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
#import "AffairsViewController.h"
#import "UnionViewController.h"
#import "UserModuleViewController.h"
#import "UnionCreateViewController.h"
#import "MyAffairsViewController.h"
#import "AffairsCreateViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController
{
    AffairsViewController *_affairsController;
    UnionViewController *_unionController;
    MyAffairsViewController *_myAffairsController;
    UserModuleViewController *_userModuleController;
    UIView *_currentView;
}

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

#pragma mark - event listener
- (IBAction)touchUserInfo:(id)sender
{
    if(!_userModuleController)
    {
        _userModuleController = [[UserModuleViewController alloc]init];
        _userModuleController.navController = self.navigationController;
    }
    [self initRightView:_userModuleController.view];
}


- (IBAction)touchClose:(id)sender
{
    [self hideRightView];
}
- (IBAction)touchMyAffairs:(id)sender
{
    if(!_myAffairsController)
    {
        _myAffairsController = [[MyAffairsViewController alloc]init];
    }
    [self initRightView:_myAffairsController.view];
}


- (IBAction)touchAffairs:(id)sender
{
    if(!_affairsController)
    {
        _affairsController = [[AffairsViewController alloc]init];
    }
    [self initRightView:_affairsController.view];
}
- (IBAction)touchUnion:(id)sender
{
    if(!_unionController)
    {
        _unionController = [[UnionViewController alloc]init];
    }
    [self initRightView:_unionController.view];
}

- (void)leftButtonPress{
    [[RevealViewController shareRevealController] pressMenuButton];
}
- (IBAction)touchCreateUnion:(id)sender
{
    UnionCreateViewController *controller = [[UnionCreateViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}
- (IBAction)touchCreateAffairs:(id)sender
{
    AffairsCreateViewController *controller = [[AffairsCreateViewController alloc]init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)showRightView
{
    [UIView animateWithDuration:0.3//时长
                          delay:0 //延迟时间
                        options:UIViewAnimationOptionCurveEaseInOut//动画效果
                     animations:^{
                         self.rightViewController.frame = CGRectMake(30, self.rightViewController.frame.origin.y, self.rightViewController.frame.size.width, self.rightViewController.frame.size.height);
                     } completion:^(BOOL finish){
                     }];
}

- (void)hideRightView
{
    [UIView animateWithDuration:0.3//时长
                          delay:0 //延迟时间
                        options:UIViewAnimationOptionCurveEaseInOut//动画效果
                     animations:^{
                         self.rightViewController.frame = CGRectMake(320, self.rightViewController.frame.origin.y, self.rightViewController.frame.size.width, self.rightViewController.frame.size.height);
                     } completion:^(BOOL finish){
                     }];

}

- (void)initRightView:(UIView *)view
{
    [_currentView removeFromSuperview];
    _currentView = view;
    _currentView.frame = CGRectMake(self.closeButton.frame.size.width / 2, self.closeButton.frame.size.height / 2, _currentView.frame.size.width, _currentView.frame.size.height);
    [self.rightViewController insertSubview:_currentView belowSubview
                                           :self.closeButton];
    [self showRightView];

}

@end
