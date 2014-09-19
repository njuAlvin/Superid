//
//  LoginViewController.m
//  SMCYIOS
//
//  Created by yangwen on 14-9-5.
//  Copyright (c) 2014年 yangwen. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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
- (IBAction)touchLogin:(id)sender
{
    MainViewController *controller = [[MainViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}
- (IBAction)editExit:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)backgroundTap:(id)sender {
    [_userField resignFirstResponder];
    [_keyField resignFirstResponder];
}


@end
