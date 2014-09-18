//
//  ScheduleDetailViewController.h
//  SMCYIOS
//
//  Created by zhoufan on 14-9-18.
//  Copyright (c) 2014年 zhoufan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (strong, nonatomic) NSDate *date;

@end
