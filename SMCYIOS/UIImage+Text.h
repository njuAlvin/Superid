//
//  UIImage+Text.h
//  HuiYuanIOS
//
//  Created by yangwen on 14-9-17.
//  Copyright (c) 2014年 yangwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Text)

-(UIImage *)addText:(UIImage *)img text:(NSString *)text1;

-(UIImage *)addLabel:(UILabel *)label;
-(UIImage *)addLabel:(UILabel *)label gap:(CGFloat)gap;

-(UIImage*)addLabelInCenter:(UILabel *)label;
    
@end
