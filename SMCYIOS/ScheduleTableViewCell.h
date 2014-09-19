//
//  ScheduleTableViewCell.h
//  SMCYIOS
//
//  Created by yangwen on 14-9-7.
//  Copyright (c) 2014年 yangwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *scheduleTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *scheduleContentLabel;

@end
