//
//  UserCenterViewController.m
//  SMCYIOS
//
//  Created by yangwen on 14-9-18.
//  Copyright (c) 2014年 yangwen. All rights reserved.
//

#import "UserCenterViewController.h"
#import "LoginViewController.h"
#import "RevealViewController.h"
#import "ScheduleViewController.h"

@interface UserCenterViewController ()

@end

@implementation UserCenterViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)initNav
{
    self.navigationController.navigationBar.hidden = YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchScheduleManager:(id)sender
{
    RevealViewController *controller = [RevealViewController shareRevealController];
    UINavigationController *navController = controller.frontNavViewController;
    ScheduleViewController *scheduleController = [[ScheduleViewController alloc]init];
    [navController pushViewController:scheduleController animated:YES];
    [controller showAllFrontView];
}
@end
