//
//  RevealViewController.h
//  SMCYIOS
//
//  Created by yangwen on 14-9-9.
//  Copyright (c) 2014年 yangwen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    originPosition = 0,
    narrowPosition,
    hiddenPosition,
}FrontViewStatus;

@interface RevealViewController : UIViewController

@property (strong, nonatomic) UINavigationController *rearNavViewController;
@property (strong, nonatomic) UINavigationController *frontNavViewController;
@property (strong, nonatomic) UIView *frontView;
@property (strong, nonatomic) UIView *rearView;
@property (nonatomic) FrontViewStatus positionStatus;

+(RevealViewController *)shareRevealController;

-(void)pressMenuButton;

-(void)hiddenFrontView;

-(void)showNarrowFrontView;

-(void)setStatusBarStyleDefault;

-(void)setStatusBarStyleLightContent;

- (void)showAllFrontView;

@end
