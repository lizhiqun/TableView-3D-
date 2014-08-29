//
//  HHFipsideItmeView.h
//  caijing
//
//  Created by czda czda on 12-3-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@interface HHFipsideItmeView : UIView
{
    IBOutlet UILabel *timeLabel;
    IBOutlet UILabel *totalLabel;
    IBOutlet UILabel *titleLabel;
    IBOutlet UILabel *titleTime;
    IBOutlet UIImageView *imageView;
    
}
@property (nonatomic, assign) UILabel *timeLabel;
@property (nonatomic, assign) UILabel *totalLabel;
@property (nonatomic, assign) UILabel *titleLabel;
@property (nonatomic, assign) UILabel *titleTime;
@property (nonatomic, assign) UIImageView *imageView;
@end
