//
//  ScheduleDetailViewController.h
//  SMCYIOS
//
//  Created by yangwen on 14-9-8.
//  Copyright (c) 2014年 yangwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (strong, nonatomic) NSDate *date;

@end
