//
//  MainViewController.m
//  SMCYIOS
//
//  Created by zhoufan on 14-9-18.
//  Copyright (c) 2014年 zhoufan. All rights reserved.
//

#import "MainViewController.h"
#import "RevealViewController.h"
#import "ViewFactory.h"
#import "common.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    [self initScrollView];
//    self.scrollView.contentSize = CGSizeMake(320,568);
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initScrollView
{
    self.scrollView.contentSize = CGSizeMake(320, CGRectGetMaxY(self.moreServiceButton.frame) + 20);
}

- (void)initNav
{
    self.title = @"我的主页";
    UINavigationBar *navBar = [self.navigationController navigationBar];
    [navBar setTranslucent:NO];
    
    //set left nav button
    UIButton *leftButton = [[ViewFactory sharedViewFactory] navigationButtonWithImage:[UIImage imageNamed:@"nav_setting_un"]
                                                                          normalColor:UIColorFromRGB(COLOR_NAVIGATION_BUTTON)
                                                                       highlightColor:UIColorFromRGB(COLOR_NAVIGATION_BUTTON_HIGHLIGHT)];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = 0;
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, [[UIBarButtonItem alloc] initWithCustomView:leftButton] , nil];
    [leftButton addTarget:self action:@selector(leftButtonPress) forControlEvents:UIControlEventTouchUpInside];
}
- (void)leftButtonPress{
    [[RevealViewController shareRevealController] pressMenuButton];
}
@end
