//
//  IToastUtil.m
//  SouthRailIOS
//
//  Created by yangwen on 14-9-16.
//  Copyright (c) 2014年 yangwen. All rights reserved.
//

#import "IToastUtil.h"
#import "iToast.h"

@implementation IToastUtil{
        iToast *_myToast;
}

#pragma mark -toast
- (void)toastWithMessage:(NSString *)message
{
    double delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void)
                   {
                       if(!_myToast)
                       {
                           
                           [_myToast setGravity:iToastGravityCenter];
                           [_myToast setUseShadow:NO];
                           [_myToast setBgAlpha:1];
                           [_myToast setBgBlue:0.15];
                           [_myToast setBgRed:0.15];
                           [_myToast setBgGreen:0.15];
                           [_myToast setDuration:1500];
                       }
                       
                       //提示已经无更多信息
                       [_myToast setText:message];
                       [_myToast show];
                       
                   });
}
@end
