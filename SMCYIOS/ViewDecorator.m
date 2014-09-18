//
//  ViewDecorator.m
//  LoveStory
//
//  Created by Xu Xian on 14-3-22.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "ViewDecorator.h"

#import "Common.h"

@implementation ViewDecorator

+(void)decorateTextView:(UITextView *)textView
{
    //To make the border look very close to a UITextField
    [textView.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [textView.layer setBorderWidth:0.5];
    
    //The rounded corner part, where you specify your view's corner radius:
    textView.layer.cornerRadius = 5;
    textView.clipsToBounds = YES;
    
    //    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:_textView.bounds];
    textView.layer.masksToBounds = NO;
}

+(void)decoratePicker:(UIView *)picker{
    //To make the border look very close to a UITextField
    [picker setBackgroundColor:[UIColor whiteColor]];
    [picker.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [picker.layer setBorderWidth:2.0];
    
    //The rounded corner part, where you specify your view's corner radius:
    picker.layer.cornerRadius = 5;
    picker.clipsToBounds = YES;
    
    //    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:_textView.bounds];
    picker.layer.masksToBounds = NO;
    picker.layer.masksToBounds = NO;
    picker.layer.shadowColor = [UIColor blackColor].CGColor;
    picker.layer.shadowOffset  = CGSizeMake( -1.f, 1.f);
    picker.layer.shadowOpacity = 0.5f;
}

+(void)decorateNavButton:(UIButton *)button
{
    [button.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    [button.layer setBorderWidth:1];
    
    
    button.layer.cornerRadius = 5.0;
    button.clipsToBounds = YES;
    
//    button.layer.masksToBounds = NO;
//    button.layer.shadowColor = [UIColor blackColor].CGColor;
//    button.layer.shadowOffset  = CGSizeMake( -1.f, -1.f);
//    button.layer.shadowOpacity = 0.5f;
//    
//    button.titleLabel.shadowOffset = CGSizeMake(0.f, 0.f);
}

+(void)decorateDatePicker:(UIView *)picker{
    //To make the border look very close to a UITextField
    [picker.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [picker.layer setBorderWidth:2.0];
    
    //The rounded corner part, where you specify your view's corner radius:
    picker.layer.cornerRadius = 5;
    picker.clipsToBounds = YES;
    
    //    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:_textView.bounds];
    picker.layer.masksToBounds = NO;
    picker.layer.masksToBounds = NO;
    picker.layer.shadowColor = [UIColor blackColor].CGColor;
    picker.layer.shadowOffset  = CGSizeMake( -1.f, 1.f);
    picker.layer.shadowOpacity = 0.5f;
}

+(void)decorateButton:(UIButton *)button
{
    [button.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [button.layer setBorderWidth:1];
    
    
    button.layer.cornerRadius = 5.0;
    button.clipsToBounds = YES;
    button.layer.masksToBounds = NO;
    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowOffset  = CGSizeMake( -1.f, 1.f);
    button.layer.shadowOpacity = 0.5f;
    
    button.titleLabel.shadowOffset = CGSizeMake(0.f, 0.f);
}

+(void)decorateFlatButton:(UIButton *)button
{
//    [button.layer setBorderColor:[UIColor clearColor].CGColor];
//    [button.layer setBorderWidth:1];
//    
//    
//    button.layer.cornerRadius = 5.0;
//    button.clipsToBounds = YES;
//    button.layer.masksToBounds = NO;
//    button.layer.shadowColor = [UIColor blackColor].CGColor;
//    button.layer.shadowOffset  = CGSizeMake( -1.f, -1.f);
//    button.layer.shadowOpacity = 0.5f;
//    
//    button.titleLabel.shadowOffset = CGSizeMake(0.f, 0.f);
}

+(void)textViewHideKeyboard:(UITextView *)textView target:(id)target selector:(SEL)selector
{
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
//    [topView setBarStyle:UIBarStyleBlackTranslucent];
    
//    UIBarButtonItem * helloButton = [[UIBarButtonItem alloc]initWithTitle:@"Hello" style:UIBarButtonItemStyleBordered target:self action:nil];
    
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:target action:selector];
    
    
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace,doneButton,nil];
    
    [topView setItems:buttonsArray];
    [textView setInputAccessoryView:topView];
}

+(void)decorateTable:(UITableView *)tableView{
    //To make the border look very close to a UITextField
    [tableView.layer setBorderColor:[[[UIColor grayColor] colorWithAlphaComponent:0.5] CGColor]];
    [tableView.layer setBorderWidth:2.0];
    
    //The rounded corner part, where you specify your view's corner radius:
    tableView.layer.cornerRadius = 5;
    tableView.clipsToBounds = YES;
    
    //    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:_textView.bounds];
    tableView.layer.masksToBounds = NO;
    tableView.layer.masksToBounds = NO;
    tableView.layer.shadowColor = [UIColor blackColor].CGColor;
    tableView.layer.shadowOffset  = CGSizeMake( -1.f, 1.f);
    tableView.layer.shadowOpacity = 0.5f;
}

+(void)decorateTextField:(UITextField *)view
{
    [view.layer setBorderWidth:1];
    
    view.layer.cornerRadius = 1;
}

+(void)decorateRadiusImageView:(UIImageView *)view
{
    view.layer.cornerRadius = view.frame.size.width / 2;
    view.clipsToBounds = YES;
    view.layer.borderWidth = 3.0f;
    view.layer.borderColor = [UIColor whiteColor].CGColor;
}
@end
