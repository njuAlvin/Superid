//
//  ScheduleViewController.m
//  SMCYIOS
//
//  Created by zhoufan on 14-9-18.
//  Copyright (c) 2014年 zhoufan. All rights reserved.
//

#import "ScheduleViewController.h"
#import "ScheduleTableViewCell.h"
#import "ViewFactory.h"
#import "common.h"
#import "ScheduleDetailViewController.h"

@interface ScheduleViewController ()

@end

@implementation ScheduleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initNav];
    [self initView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initNav
{
    self.title = @"日程安排";
    self.navigationController.navigationBar.translucent = NO;
    
    //set left nav button
    UIButton *leftButton = [[ViewFactory sharedViewFactory] navigationButtonWithImage:[UIImage imageNamed:@"nav_return"]
                                                                          normalColor:UIColorFromRGB(COLOR_NAVIGATION_BUTTON)
                                                                       highlightColor:UIColorFromRGB(COLOR_NAVIGATION_BUTTON_HIGHLIGHT)];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = 0;
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, [[UIBarButtonItem alloc] initWithCustomView:leftButton] , nil];
    [leftButton addTarget:self action:@selector(leftButtonPress) forControlEvents:UIControlEventTouchUpInside];
}

- (void)initView
{
    //初始化当天
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [dateFormatter stringFromDate:[NSDate date]];
    self.dateLabel.text  = [NSString stringWithFormat:@"%@ 日程",strDate];
    
    //
    self.datePicker.date = [NSDate date];
}

#pragma mark - event listener 
- (void)leftButtonPress
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)touchAddSchedule:(id)sender
{
    ScheduleDetailViewController *controller = [[ScheduleDetailViewController alloc]init];
    controller.date = self.datePicker.date;
    [self.navigationController pushViewController:controller animated:YES];
}
#pragma mark - date Picker event
- (IBAction)dateChange:(id)sender
{
    UIDatePicker* control = (UIDatePicker*)sender;
    NSDate* date = control.date;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *strDate = [dateFormatter stringFromDate:date];
    self.dateLabel.text  = [NSString stringWithFormat:@"%@ 日程",strDate];
}


#pragma mark - init tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"schedule";
    ScheduleTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        //initialize cell
        cell = (ScheduleTableViewCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"ScheduleTableViewCell" owner:self options:nil]  lastObject];
    }
    return cell;
}

@end
