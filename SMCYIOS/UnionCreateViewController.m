//
//  UnionCreateViewController.m
//  SMCYIOS
//
//  Created by zhoufan on 14-9-15.
//  Copyright (c) 2014年 zhoufan. All rights reserved.
//

#import "UnionCreateViewController.h"
#import "ViewFactory.h"
#import "ViewDecorator.h"
#import "common.h"

@interface UnionCreateViewController ()

@end

@implementation UnionCreateViewController

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
    [self initView];
    [self initNav];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView
{
    [ViewDecorator decorateTextView:self.unionDescriptionTextView];
}

- (void)initNav
{
    self.title = @"创建盟";
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


- (IBAction)touchAddUnion:(id)sender
{
    [self  leftButtonPress];
}

- (void)leftButtonPress
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
