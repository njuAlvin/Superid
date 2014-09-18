//
//  ScheduleDetailViewController.m
//  SMCYIOS
//
//  Created by zhoufan on 14-9-18.
//  Copyright (c) 2014年 zhoufan. All rights reserved.
//

#import "ScheduleDetailViewController.h"
#import "ViewFactory.h"
#import "ViewDecorator.h"
#import "common.h"

@interface ScheduleDetailViewController ()

@end

@implementation ScheduleDetailViewController

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

- (void)initView
{
    [ViewDecorator decorateTextView:self.contentTextView];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *strDate = [dateFormatter stringFromDate:[NSDate date]];
    self.dateLabel.text  = [NSString stringWithFormat:@"%@ 日程",strDate];
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - event listener 
- (void)leftButtonPress
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)submitSchedule:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
