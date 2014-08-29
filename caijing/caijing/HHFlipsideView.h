//
//  HHFlipsideView.h
//  caijing
//
//  Created by czda czda on 12-3-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@protocol HHFlipsideViewDataSource, HHFlipsideViewDelegate;
@interface HHFlipsideView : UIView
{
    id<HHFlipsideViewDataSource>dataSource;
    id<HHFlipsideViewDelegate> delegate;
    CGFloat perspective;
}
@property (nonatomic, assign) IBOutlet id<HHFlipsideViewDataSource> dataSource;
@property (nonatomic, assign) IBOutlet id<HHFlipsideViewDelegate> delegate;
@property (nonatomic, assign) CGFloat perspective;
- (void)reloadData;
- (void)scrollToItemAtIndex:(NSInteger)index animated:(BOOL)animated;
@end


@protocol HHFlipsideViewDataSource <NSObject>
- (NSUInteger)numberOfItemsInFlipsideView:(HHFlipsideView *)flipsideView;
- (UIView *)flipsideView:(HHFlipsideView *)flipsideView viewForItemAtIndex:(NSUInteger)index;
@end

@protocol HHFlipsideViewDelegate <NSObject>
- (CGFloat)flipsideItemHeight:(HHFlipsideView *)flipsideView;
@optional
- (BOOL)flipsideViewShouldWrap:(HHFlipsideView *)flipsideView;//是否循环显示
- (void)flipsideView:(HHFlipsideView *)flipsideView didSelectItemAtIndex:(NSInteger)index;
@end

