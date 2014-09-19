//
//  UserModuleViewController.m
//  SMCYIOS
//
//  Created by yangwen on 14-9-16.
//  Copyright (c) 2014年 yangwen. All rights reserved.
//

#import "UserModuleViewController.h"
#import "UserInfoViewController.h"

@interface UserModuleViewController ()

@end

@implementation UserModuleViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchUserInfo:(id)sender
{
    UserInfoViewController *controller = [[UserInfoViewController alloc]init];
    [self.navController pushViewController:controller animated:YES];
}


@end
