//
//  ViewFactory.h
//  HuiYuanIOS
//
//  Created by yangwen on 14-9-17.
//  Copyright (c) 2014年 yangwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewFactory : NSObject

/* singleton */
+(ViewFactory *)sharedViewFactory;

- (UIView *)titleViewWithImage:(UIImage *)image label:(UILabel *)label;

-(UIView *)titleViewWithImage:(UIImage *)image label:(UILabel *)label leftOffset:(CGFloat)offset gap:(CGFloat)gap;

- (UIView *)viewWithLabel:(UILabel *)label insideImage:(UIImage *)image;

- (UIButton *)navigationButtonWithImage:(UIImage *)image normalColor:(UIColor *)normalColor highlightColor:(UIColor *)highlightColor;

@end
