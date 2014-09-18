//
//  ScheduleViewController.h
//  SMCYIOS
//
//  Created by zhoufan on 14-9-18.
//  Copyright (c) 2014年 zhoufan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
