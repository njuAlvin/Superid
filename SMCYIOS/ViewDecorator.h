//
//  ViewDecorator.h
//  LoveStory
//
//  Created by yangwen on 14-9-17.
//  Copyright (c) 2014年 yangwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewDecorator : NSObject

+(void)decorateTextView:(UITextView *)textView;

+(void)decorateButton:(UIButton *)button;
+(void)decorateNavButton:(UIButton *)button;

+(void)decoratePicker:(UIView *)picker;

+(void)textViewHideKeyboard:(UITextView *)textView target:(id)target selector:(SEL)selector;

+(void)decorateFlatButton:(UIButton *)button;

+(void)decorateTable:(UITableView *)tableView;

+(void)decorateDatePicker:(UIView *)picker;

+(void)decorateTextField:(UITextField *)view;

+(void)decorateRadiusImageView:(UIImageView *)view;

@end
