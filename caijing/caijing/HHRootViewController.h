//
//  HHRootViewController.h
//  caijing
//
//  Created by czda czda on 12-3-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHFlipsideView.h"
@interface HHRootViewController : UIViewController<HHFlipsideViewDataSource,HHFlipsideViewDelegate>
{
    NSMutableArray *dataArray;
    IBOutlet HHFlipsideView *flipsideView;
}
@property (nonatomic, retain) NSMutableArray *dataArray;
@end
