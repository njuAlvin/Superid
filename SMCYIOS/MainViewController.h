//
//  MainViewController.h
//  SMCYIOS
//
//  Created by zhoufan on 14-9-9.
//  Copyright (c) 2014年 zhoufan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *moreServiceButton;
@property (weak, nonatomic) IBOutlet UIView *rightViewController;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@end
