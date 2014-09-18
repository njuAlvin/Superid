//
//  RevealViewController.m
//  SMCYIOS
//
//  Created by zhoufan on 14-9-18.
//  Copyright (c) 2014年 zhoufan. All rights reserved.
//

#import "RevealViewController.h"
#import "MainViewController.h"
#import "UserCenterViewController.h"
#import "LoginViewController.h"
#define REVEAL_TOP_GAP 64
#define REVEAL_LEFT_GAP 270
#define REVEAL_SHADOW_OFF 3


@interface RevealViewController ()

@end

static RevealViewController *revealViewController;
@implementation RevealViewController
{
    CGRect originRect;
    CGSize originSize;
    CGRect bounds;
    UIImageView *blackBGView;
    
    //  覆盖在FrontView上，监听gesture
    UIView *hiddenView;
    
    //  拖动效果
    //  记录拖动的角度
    float tanRotation;
    
    //  缩小的效果
    CGRect narrowRect;
    float narrowScale;
    float narrowWidth;
    float narrowHeight;
    
    UIView *_networkVeilView;//网络请求的veilView(刷新)
    UIActivityIndicatorView *_networkIndicator;
    UILabel *_searchTextLabel;
    
    LoginViewController *_frontViewController;
    UIViewController *_rearViewController;
    
    
    UIStatusBarStyle _barStyle;

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        revealViewController = self;
    }
    return self;
}

+(RevealViewController *)shareRevealController{
    return revealViewController;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.positionStatus = originPosition;
    bounds = [UIScreen mainScreen].bounds;
    [self initBGView];
    [self initView];
    [self addGesture];
    [self initNarrowParams];

    // Do any additional setup after loading the view from its nib.
}

- (void)initBGView{
    blackBGView = [[UIImageView alloc]initWithFrame:bounds];
    if(bounds.size.height == 480){
        blackBGView.image = [UIImage imageNamed:@"splash_screen_35"];
    }
    else{
        blackBGView.image = [UIImage imageNamed:@"splash_screen_40"];
        
    }
    [self.view addSubview:blackBGView];
}

//  初始化FrontView的缩放比
- (void)initNarrowParams{
    narrowScale = (originSize.height - 2 * REVEAL_TOP_GAP) / originSize.height;
    narrowWidth = originSize.width * narrowScale;
    narrowHeight = originSize.height * narrowScale;
}

//  初始化FrontView 和 rearView的两个界面
- (void)initView{
    self.view.frame = bounds;
    _frontViewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    _rearViewController = [[UserCenterViewController alloc]initWithNibName:@"UserCenterViewController" bundle:nil];
    _rearViewController.navigationController.navigationBar.hidden = NO;
    
    self.frontNavViewController = [[UINavigationController alloc] initWithRootViewController:_frontViewController];
    self.rearNavViewController = [[UINavigationController alloc] initWithRootViewController:_rearViewController];
    
    [self addChildViewController:self.frontNavViewController];
    [self addChildViewController:self.rearNavViewController];
    
    self.frontView = self.frontNavViewController.view;
    self.frontView.frame =  bounds;
    self.rearView = self.rearNavViewController.view;
    self.rearView.frame = bounds;
    originRect = self.frontView.frame;
    originSize = self.frontView.frame.size;
    
    //  hiddenView浮层与FrontView上方，为一透明的view，用于监听事件，以及FrontView 事件屏蔽
    hiddenView = [[UIView alloc]initWithFrame:bounds];
    hiddenView.hidden = YES;
    hiddenView.backgroundColor = [UIColor clearColor];
    [self.frontView addSubview:hiddenView];
    
    
    self.frontView.hidden = NO;
    self.rearView.hidden = NO;
    
    [self.view addSubview:self.rearView];
    [self.view addSubview:self.frontView];
    
}

//  给HiddenView增加移动和轻点击监听
- (void)addGesture{
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognized:)];
    [hiddenView addGestureRecognizer:panGestureRecognizer];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognized:)];
    [hiddenView addGestureRecognizer:tapGestureRecognizer];
}


//  完全隐藏FrontView，当通过个人中心菜单到详情的时候
-(void)hiddenFrontView{
    float scale = (originSize.height - (tanRotation * (originSize.width + REVEAL_SHADOW_OFF) * 2)) / originSize.height;
    float newY = tanRotation * (originSize.width + REVEAL_SHADOW_OFF);
    
    [UIView animateWithDuration:0.2//时长
                          delay:0 //延迟时间
                        options:UIViewAnimationOptionCurveEaseInOut//动画效果
                     animations:^{
                         self.frontView.transform = CGAffineTransformMakeScale(scale, scale);
                         
                         self.frontView.frame = CGRectMake(originSize.width + REVEAL_SHADOW_OFF,
                                                           newY,
                                                           scale * originSize.width,
                                                           scale * originSize.height);
                         
                     } completion:^(BOOL finish){
                         self.positionStatus = hiddenPosition;
                     }];
    
}

//  从完全隐藏到半隐藏，当从详情回到个人中心菜单时
-(void)showNarrowFrontView{
    [UIView animateWithDuration:0.2//时长
                          delay:0 //延迟时间
                        options:UIViewAnimationOptionCurveEaseInOut//动画效果
                     animations:^{
                         self.frontView.transform = CGAffineTransformMakeScale(narrowScale, narrowScale);
                         
                         self.frontView.frame = CGRectMake(REVEAL_LEFT_GAP,
                                                           REVEAL_TOP_GAP,
                                                           narrowWidth,
                                                           narrowHeight);
                         
                     } completion:^(BOOL finish){
                         self.positionStatus = narrowPosition;
                     }];
}

//  缩小FrontView到半隐藏的时候
-(void)pressMenuButton{
    
    [UIView animateWithDuration:0.3//时长
                          delay:0 //延迟时间
                        options:UIViewAnimationOptionCurveEaseInOut//动画效果
                     animations:^{
                         self.frontView.transform = CGAffineTransformMakeScale(narrowScale, narrowScale);
                         
                         self.frontView.frame = CGRectMake(REVEAL_LEFT_GAP,
                                                           REVEAL_TOP_GAP,
                                                           narrowWidth,
                                                           narrowHeight);
                         
                     } completion:^(BOOL finish){
                         self.positionStatus = narrowPosition;
                         tanRotation = (float)REVEAL_TOP_GAP / (float)REVEAL_LEFT_GAP;
                         narrowRect = self.frontView.frame;
                         hiddenView.hidden = NO;
                     }];
    
    _barStyle = UIStatusBarStyleLightContent;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)showAllFrontView
{
    [UIView animateWithDuration:0.3//时长
                          delay:0 //延迟时间
                        options:UIViewAnimationOptionCurveEaseInOut//动画效果
                     animations:^{
                         self.frontView.transform = CGAffineTransformMakeScale(1, 1);
                         self.frontView.frame = originRect;
                         //                         self.rearView.alpha = 0;
                     } completion:^(BOOL finish){
                         hiddenView.hidden = YES;
                     }];
    
    _barStyle = UIStatusBarStyleDefault;
    
    [self setNeedsStatusBarAppearanceUpdate];

}

#pragma mark - gesture event
- (void)panGestureRecognized:(UIPanGestureRecognizer *)sender
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    CGPoint translation = [sender translationInView:window];
    
	if (sender.state == UIGestureRecognizerStateBegan) {
		
	}
    
    //  计算拖动时的大小
    if (sender.state == UIGestureRecognizerStateChanged) {
        CGFloat x = translation.x;
        CGFloat newX;
        CGFloat newY;
        CGFloat scale = 0;
        if(x < 0){
            CGFloat tempX = abs(x);
            newX = REVEAL_LEFT_GAP - tempX;
            newY = REVEAL_TOP_GAP - tempX * tanRotation;
            CGFloat newHeight = narrowRect.size.height + tempX * tanRotation * 2;
            scale = newHeight / originSize.height;
        }
        else{
            CGFloat tempX = abs(x);
            newX = REVEAL_LEFT_GAP + tempX;
            newY = REVEAL_TOP_GAP + tempX * tanRotation;
            CGFloat newHeight = narrowRect.size.height - tempX * tanRotation * 2;
            scale = newHeight / originSize.height;
        }
        
        if (newX < 0) {
            self.frontView.frame = CGRectMake(0, 0, originSize.width, originSize.height);
            
        } else {
            self.frontView.frame = CGRectMake(newX, newY, originSize.width * scale, originSize.height * scale);
        }
        
        self.frontView.transform = CGAffineTransformMakeScale(scale, scale);
        
    }
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        
        //  当移动距离，超过50，则放大到全屏，否则，回到原来位置
        if(abs(translation.x) < 50){
            [UIView animateWithDuration:0.3//时长
                                  delay:0 //延迟时间
                                options:UIViewAnimationOptionCurveEaseInOut//动画效果
                             animations:^{
                                 self.frontView.transform = CGAffineTransformMakeScale(narrowScale, narrowScale);
                                 
                                 self.frontView.frame = CGRectMake(REVEAL_LEFT_GAP,
                                                                   REVEAL_TOP_GAP,
                                                                   narrowWidth,
                                                                   narrowHeight);
                                 [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleDefault];
                                 //                                 self.rearView.alpha = 1;
                             } completion:^(BOOL finish){
                                 
                             }];
        }
        else{
            [UIView animateWithDuration:0.3//时长
                                  delay:0 //延迟时间
                                options:UIViewAnimationOptionCurveEaseInOut//动画效果
                             animations:^{
                                 self.frontView.transform = CGAffineTransformMakeScale(1, 1);
                                 self.frontView.frame = originRect;
                                 //                                 self.rearView.alpha = 0;
                             } completion:^(BOOL finish){
                                 self.positionStatus = originPosition;
                                 hiddenView.hidden = YES;
                             }];
            _barStyle = UIStatusBarStyleDefault;
            
        }
        
        
        [self setNeedsStatusBarAppearanceUpdate];
        
    }
}

//  轻点击时，放大到全屏
- (void)tapGestureRecognized:(UITapGestureRecognizer *)sender{
    [UIView animateWithDuration:0.3//时长
                          delay:0 //延迟时间
                        options:UIViewAnimationOptionCurveEaseInOut//动画效果
                     animations:^{
                         self.frontView.transform = CGAffineTransformMakeScale(1, 1);
                         self.frontView.frame = originRect;
                         //                         self.rearView.alpha = 0;
                     } completion:^(BOOL finish){
                         hiddenView.hidden = YES;
                     }];
    
    _barStyle = UIStatusBarStyleDefault;
  
    [self setNeedsStatusBarAppearanceUpdate];
}



#pragma mark - status bar style
-(void)setStatusBarStyleDefault{
    _barStyle = UIStatusBarStyleDefault;
}

-(void)setStatusBarStyleLightContent{
    _barStyle = UIStatusBarStyleLightContent;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return _barStyle;
}

@end