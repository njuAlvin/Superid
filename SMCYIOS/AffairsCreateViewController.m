//
//  AffairsCreateViewController.m
//  SMCYIOS
//
//  Created by zhoufan on 14-9-19.
//  Copyright (c) 2014年 zhoufan. All rights reserved.
//

#import "AffairsCreateViewController.h"
#import "ViewDecorator.h"
#import "ViewFactory.h"
#import "common.h"

@interface AffairsCreateViewController ()

@end

@implementation AffairsCreateViewController

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

- (void)initView
{
    [ViewDecorator decorateTextView:self.affarisDescriptionTextView];
    [ViewDecorator decoratePicker:self.tagViewContainer];
}

- (void)initNav
{
    self.title = @"创建事务";
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

- (IBAction)touchCreateAffairs:(id)sender
{
    [self leftButtonPress];
}

- (void)leftButtonPress
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
