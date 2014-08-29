//
//  HHRootViewController.m
//  caijing
//
//  Created by czda czda on 12-3-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HHRootViewController.h"
#import "HHFipsideItmeView.h"
#import "WiAdView.h"
@interface HHRootViewController()
- (void)initData;
@end

@implementation HHRootViewController
@synthesize dataArray;

- (void)dealloc
{
    [dataArray release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self initData];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)initData
{
    dataArray = [[NSMutableArray alloc]init];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"1.jpg",@"image",
                         @"自然垄断者",@"title",
                         @"2012年第三期",@"titleTime",
                         @"总第312期",@"totalTime",
                         @"2012年1月30日",@"time",
                         nil];
    [dataArray addObject:dic];
    
    dic = [NSDictionary dictionaryWithObjectsAndKeys:@"2.jpg",@"image",
                         @"改革抉择时刻",@"title",
                         @"2012年第4期",@"titleTime",
                         @"总第313期",@"totalTime",
                         @"2012年1月31日",@"time",
                         nil];
    [dataArray addObject:dic];
    
    dic = [NSDictionary dictionaryWithObjectsAndKeys:@"3.jpg",@"image",
           @"器官旅游移植链",@"title",
           @"2012年第5期",@"titleTime",
           @"总第314期",@"totalTime",
           @"2012年2月1日",@"time",
           nil];
    [dataArray addObject:dic];
    
    dic = [NSDictionary dictionaryWithObjectsAndKeys:@"4.jpg",@"image",
           @"中美新平衡",@"title",
           @"2012年第6期",@"titleTime",
           @"总第315期",@"totalTime",
           @"2012年2月2日",@"time",
           nil];
    [dataArray addObject:dic];
    
    dic = [NSDictionary dictionaryWithObjectsAndKeys:@"5.jpg",@"image",
           @"致命的集资",@"title",
           @"2012年第7期",@"titleTime",
           @"总第316期",@"totalTime",
           @"2012年2月3日",@"time",
           nil];
    [dataArray addObject:dic];
    
    dic = [NSDictionary dictionaryWithObjectsAndKeys:@"6.jpg",@"image",
           @"医改下一步",@"title",
           @"2012年第8期",@"titleTime",
           @"总第317期",@"totalTime",
           @"2012年2月4日",@"time",
           nil];
    [dataArray addObject:dic];
    
    dic = [NSDictionary dictionaryWithObjectsAndKeys:@"7.jpg",@"image",
           @"医改下一步",@"title",
           @"2012年第8期",@"titleTime",
           @"总第317期",@"totalTime",
           @"2012年2月4日",@"time",
           nil];
    [dataArray addObject:dic];
    
    dic = [NSDictionary dictionaryWithObjectsAndKeys:@"8.jpg",@"image",
           @"审视资本账户开放",@"title",
           @"2012年第9期",@"titleTime",
           @"总第318期",@"totalTime",
           @"2012年2月5日",@"time",
           nil];
    [dataArray addObject:dic];
    

    dic = [NSDictionary dictionaryWithObjectsAndKeys:@"9.jpg",@"image",
           @"曲美影子银行",@"title",
           @"2012年第10期",@"titleTime",
           @"总第319期",@"totalTime",
           @"2012年2月6日",@"time",
           nil];
    [dataArray addObject:dic];
    
    dic = [NSDictionary dictionaryWithObjectsAndKeys:@"10.jpg",@"image",
           @"千亿减税虚实",@"title",
           @"2012年第11期",@"titleTime",
           @"总第320期",@"totalTime",
           @"2012年2月7日",@"time",
           nil];
    [dataArray addObject:dic];
    
    dic = [NSDictionary dictionaryWithObjectsAndKeys:@"11.jpg",@"image",
           @"铁道融资变通",@"title",
           @"2012年第12期",@"titleTime",
           @"总第321期",@"totalTime",
           @"2012年2月8日",@"time",
           nil];
    [dataArray addObject:dic];
    
    
    dic = [NSDictionary dictionaryWithObjectsAndKeys:@"12.jpg",@"image",
           @"卡特谈中美",@"title",
           @"2012年第29期",@"titleTime",
           @"总第327期",@"totalTime",
           @"2012年2月23日",@"time",
           nil];
    [dataArray addObject:dic];
    
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:60.0/255.0 green:105.0/255 blue:210.0/255 alpha:1.0];
    

    WiAdView* adView = [WiAdView adViewWithResId:@"4844096a1364e610" style:kWiAdViewStyleBanner320_50];
    adView.center = CGPointMake(160.0,80);
    adView.delegate = self;
    adView.refreshInterval = 31;
    adView.adBgColor = [UIColor colorWithRed:1.0f green:(CGFloat)0x66/255 blue:(CGFloat)0x33/255 alpha:1.0f];
    [self.view addSubview:adView];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"request-close.png"]];
    [self.view addSubview:imageView];
    imageView.center = CGPointMake(310,adView.center.y);
    
    
    [adView requestAd];
    
    adView = [WiAdView adViewWithResId:@"4844096a1364e610" style:kWiAdViewStyleBanner320_50];
    adView.center = self.view.center;
    adView.delegate = self;
    adView.refreshInterval = 31;
    adView.adBgColor = [UIColor colorWithRed:1.0f green:(CGFloat)0x66/255 blue:(CGFloat)0x33/255 alpha:1.0f];
    [self.view addSubview:adView];
    
    imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"request-close.png"]];
    [self.view addSubview:imageView];
    imageView.center = CGPointMake(310,adView.center.y);
    [adView requestAd];
    
}



#pragma mark -
#pragma mark 广告窗口Delegate函数

- (BOOL)WiAdUseTestMode:(WiAdView*)adView{
    return NO;
}

- (int)WiAdTestAdType:(WiAdView*)adView{
    return TEST_WIAD_TYPE_BANNER;
}

- (void)WiAdDidLoad:(WiAdView*)adView{
    [adView setHidden:NO];
}

- (void)WiAdDidFailLoad:(WiAdView*)adView{
    [adView setHidden:YES];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - HHFlipsideViewDataSource
- (NSUInteger)numberOfItemsInFlipsideView:(HHFlipsideView *)flipsideView
{
    return [dataArray count];
}
- (UIView *)flipsideView:(HHFlipsideView *)flipsideView viewForItemAtIndex:(NSUInteger)index
{
    HHFipsideItmeView *view;
    NSArray *nib= [[NSBundle mainBundle] loadNibNamed:@"HHflipsideItmeView" owner:nil options:nil] ;
    for(id oneObjec in nib)
    {
        if([oneObjec isKindOfClass:[HHFipsideItmeView class]])
        {
            view = (HHFipsideItmeView *)oneObjec;
            view.titleLabel.text = [[dataArray objectAtIndex:index]objectForKey:@"title"];
            view.titleTime.text  = [[dataArray objectAtIndex:index]objectForKey:@"titleTime"];
            view.totalLabel.text = [[dataArray objectAtIndex:index]objectForKey:@"totalTime"];
            view.timeLabel.text = [[dataArray objectAtIndex:index]objectForKey:@"time"];
            view.imageView.image = [UIImage imageNamed:[[dataArray objectAtIndex:index]objectForKey:@"image"]];
        }
    }

    //return [view autorelease];
    return view;
}

#pragma mark - HHFlipsideViewDelegate
- (BOOL)flipsideViewShouldWrap:(HHFlipsideView *)flipsideView
{
    return YES;
}

- (CGFloat)flipsideItemHeight:(HHFlipsideView *)flipsideView
{
    return 130;
}

- (void)flipsideView:(HHFlipsideView *)flipsideView didSelectItemAtIndex:(NSInteger)index
{
    ;
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"点击事件" message:[NSString stringWithFormat:@"%@",[[dataArray objectAtIndex:index] objectForKey:@"title"]] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
    [alert release];
}

@end
