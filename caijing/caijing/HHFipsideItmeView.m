//
//  HHFipsideItmeView.m
//  caijing
//
//  Created by czda czda on 12-3-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "HHFipsideItmeView.h"

@implementation HHFipsideItmeView
@synthesize timeLabel;
@synthesize totalLabel;
@synthesize titleLabel;
@synthesize titleTime;
@synthesize imageView;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = 5.0;
    imageView.layer.borderWidth = 3.0;
    imageView.layer.borderColor =[[UIColor whiteColor] CGColor];
}
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
@end
