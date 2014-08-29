//
//  HHFlipsideView.m
//  caijing
//
//  Created by czda czda on 12-3-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#define  kViewTagStart 1000
#import "HHFlipsideView.h"
#import "WiAdView.h"
@interface HHFlipsideView()
@property (nonatomic, retain) UIView *contentView;
@property (nonatomic, assign) NSInteger numberOfVisibleItems;
@property (nonatomic, assign) BOOL shouldWrap;
@property (nonatomic, assign) BOOL isAnimationing;
@property (nonatomic, assign) CGFloat itemHeight;
@property (nonatomic, assign) NSInteger currentItemIndex;
@property (nonatomic, assign) CGFloat previousTranslation;
@property (nonatomic, assign) CGFloat panTotal;
- (void)initialize;
- (void)layOutItemViews;
- (CGFloat)offsetForIndex:(NSInteger)index;
- (CATransform3D)transformForItemView:(UIView *)view withOffset:(CGFloat)offset;
@end



@implementation HHFlipsideView
@synthesize delegate,dataSource;
@synthesize contentView;
@synthesize numberOfVisibleItems;
@synthesize shouldWrap;
@synthesize itemHeight;
@synthesize perspective;
@synthesize currentItemIndex;
@synthesize isAnimationing;
@synthesize previousTranslation;
@synthesize panTotal;
- (void)initialize
{
    numberOfVisibleItems = 0;
    shouldWrap = YES;
    itemHeight = 70;
    perspective = -1.0f/700.0f;//透视
    panTotal = 0.0;

    contentView = [[UIView alloc] initWithFrame:self.bounds];
    contentView.backgroundColor = [UIColor colorWithRed:60.0/255.0 green:105.0/255 blue:210.0/255 alpha:1.0];
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didPan:)];
	panGesture.delegate = (id <UIGestureRecognizerDelegate>)self;
    [contentView addGestureRecognizer:panGesture];
    [panGesture release];
    [self addSubview:contentView];
    
    [self reloadData];

}


- (void)reloadData
{
    if (!dataSource || !contentView)
	{
		return;
	}
    for (UIView *view in contentView.subviews)
    {
        [view removeFromSuperview];
    }
    [self layOutItemViews];
}

- (void)layOutItemViews
{
    if (!dataSource || !contentView)
	{
		return;
	}
    
    if ([dataSource respondsToSelector:@selector(numberOfItemsInFlipsideView:)])
    {
        numberOfVisibleItems = [dataSource numberOfItemsInFlipsideView:self];
    }
    
    if (delegate && [delegate respondsToSelector:@selector(flipsideViewShouldWrap:)])
    {
        shouldWrap = [delegate flipsideViewShouldWrap:self];
    }
    else
    {
        shouldWrap = YES;
    }
    
    if (delegate && [delegate respondsToSelector:@selector(flipsideItemHeight:)])
    {
        itemHeight = [delegate flipsideItemHeight:self];
    }
    
    for (int i = 0;i < numberOfVisibleItems;i++)
    {
        UIView *view = [dataSource flipsideView:self viewForItemAtIndex:i];
        view.frame = CGRectMake((self.frame.size.width -  view.frame.size.width)/4.0,(self.frame.size.height -  view.frame.size.height)/2.0,view.frame.size.width,view.frame.size.height);
        CGFloat offset = i;
        view.layer.transform = [self transformForItemView:view withOffset:offset];
        [self.contentView addSubview:view];
        view.tag = kViewTagStart + i;
        
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)];
        tapGesture.delegate = (id <UIGestureRecognizerDelegate>)self;
        [view addGestureRecognizer:tapGesture];
        [tapGesture release];
        
    }
    currentItemIndex = kViewTagStart;
}


- (void)didTap:(UITapGestureRecognizer *)tapGesture
{
    kIsAdShow;
    NSInteger tag = tapGesture.view.tag;
    NSLog(@"点击tag：%d",tag);
    if (tag != self.currentItemIndex)
    {
        if (!isAnimationing)
        {
            [self scrollToItemAtIndex:tag animated:YES];
        }
        
    }
    else
    {
        if (delegate && [delegate respondsToSelector:@selector(flipsideView:didSelectItemAtIndex:)])
        {
            [delegate flipsideView:self didSelectItemAtIndex:tag - kViewTagStart];
        }
    }
}


- (void)scrollToItemAtIndex:(NSInteger)index animated:(BOOL)animated
{
    if (animated)
    {
        isAnimationing = YES;
        [UIView beginAnimations:@"present-countdown" context:nil];
        [UIView setAnimationDuration:1.0];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(tapAnimationStop)];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        
        for (int i = 0;i < numberOfVisibleItems;i++)
        {
            currentItemIndex =  index;
            UIView *view = [contentView viewWithTag:kViewTagStart + i];
            CGFloat offset = [self offsetForIndex:i + kViewTagStart];
            view.layer.transform = [self transformForItemView:view withOffset:offset];
            
        }
        [UIView commitAnimations];
    }
    else
    {
        isAnimationing = NO; 
        for (int i = 0;i < numberOfVisibleItems;i++)
        {
            currentItemIndex =  index;
            UIView *view = [contentView viewWithTag:kViewTagStart + i];
            CGFloat offset = [self offsetForIndex:i + kViewTagStart];
            view.layer.transform = [self transformForItemView:view withOffset:offset];
            
        }
    }
}

- (void)tapAnimationStop
{
    isAnimationing = NO;
}


- (CGFloat)offsetForIndex:(NSInteger)index
{
    if (index >= currentItemIndex)
    {
        return index - currentItemIndex;
    }
    else
    {
        return numberOfVisibleItems - (currentItemIndex - index);
    }
}

- (CATransform3D)transformForItemView:(UIView *)view withOffset:(CGFloat)offset
{
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = perspective;

    
    CGFloat arc = M_PI * 2.0f;
    CGFloat radius = itemHeight / 2.0f / tanf(arc/2.0f/numberOfVisibleItems);
    CGFloat angle = (offset + panTotal) / numberOfVisibleItems * arc;
    if (angle>M_PI * 2.0)
    {
        angle -= M_PI * 2.0;
    }
    if (angle<0)
    {
        angle += M_PI * 2.0;
    }
    transform = CATransform3DTranslate(transform, 0.0f, 0.0f, -radius);
    transform = CATransform3DRotate(transform, angle, 1.0f, 0.0f, 0.0f);
    //transform = CATransform3DRotate(transform, 0.02, 0.0f, 1.0f, 0.0f);
    if ((angle<M_PI/2.0 && angle>=0 ) || (angle>M_PI * 3.0/2.0 && angle<=M_PI * 2.0))
    {
        return CATransform3DTranslate(transform, 0.0f, 0.0f, radius + 0.01f);
    }
    return CATransform3DTranslate(transform, 1000.f, 0.0f, radius + 0.01f);
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        [self initialize];
    }
    return self;
}

- (void)awakeFromNib
{
    [self initialize];
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
}

- (void)didPan:(UIPanGestureRecognizer *)panGesture
{
    //[[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"wiAdTotal"];
    
    kIsAdShow;
    switch (panGesture.state)
    {
        case UIGestureRecognizerStateBegan:
        {
            previousTranslation = [panGesture translationInView:contentView].y;
            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            int total =  (int)(panTotal + 0.5);
            panTotal = 0.0;
            if (total!=0)
            {
                int index = currentItemIndex - total;
                if (index >= (numberOfVisibleItems + kViewTagStart))
                {
                    index = index - numberOfVisibleItems;
                }
                if (index < kViewTagStart) 
                {
                  //  index = kViewTagStart + numberOfVisibleItems - kViewTagStart - index;
                   index = kViewTagStart + numberOfVisibleItems - (kViewTagStart - index) -1;
                }
                [self scrollToItemAtIndex:index animated:NO];
                
            }
            break;
        }
        default:
        {
            CGFloat translation = previousTranslation - [panGesture translationInView:contentView].y;
            panTotal += translation/itemHeight;
            [self scrollToItemAtIndex:currentItemIndex animated:NO];
            previousTranslation = [panGesture translationInView:contentView].y;
        }
    }
}

@end
