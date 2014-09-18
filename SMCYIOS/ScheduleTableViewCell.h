//
//  ScheduleTableViewCell.h
//  SMCYIOS
//
//  Created by zhoufan on 14-9-18.
//  Copyright (c) 2014年 zhoufan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *scheduleTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *scheduleContentLabel;

@end
