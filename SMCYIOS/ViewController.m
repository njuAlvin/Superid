//
//  ViewController.m
//  ;
//
//  Created by zhoufan on 14-9-18.
//  Copyright (c) 2014年 zhoufan. All rights reserved.
//

#import "ViewController.h"
#import "RevealViewController.h"
#import "MainViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)touchLogin:(id)sender
{
    RevealViewController * _revealViewController = [[RevealViewController alloc]initWithNibName:@"RevealViewController" bundle:nil];
    [self.navigationController pushViewController:_revealViewController animated:YES];
    
//    MainViewController *controller = [[MainViewController alloc]init];
//    [self.navigationController pushViewController:controller animated:YES];
}

@end
