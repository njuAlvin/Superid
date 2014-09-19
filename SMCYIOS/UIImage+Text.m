//
//  UIImage+Text.m
//  HuiYuanIOS
//
//  Created by yangwen on 14-9-17.
//  Copyright (c) 2014年 yangwen. All rights reserved.
//

#import "UIImage+Text.h"
#define DEFAULT_IMAGE_WIDTH 66
#define DEFAULT_IMAGE_HEIGHT 22

@implementation UIImage (Text)

-(UIImage *)addText:(UIImage *)img text:(NSString *)text1{
    
    int w = img.size.width;
    int h = img.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
    
    char* text= (char *)[text1 cStringUsingEncoding:NSASCIIStringEncoding];
    CGContextSelectFont(context, "Arial",20, kCGEncodingMacRoman);
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextSetRGBFillColor(context, 0, 0, 0, 1);
    CGContextShowTextAtPoint(context,10,10,text, strlen(text));
    CGImageRef imgCombined = CGBitmapContextCreateImage(context);
    
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    
    UIImage *retImage = [UIImage imageWithCGImage:imgCombined];
    CGImageRelease(imgCombined);
    
    return retImage;
}

//add label to the right side of image and return the new image
-(UIImage *) addLabel:(UILabel *)label
{
    return [self addLabel:label gap:0.0];
}

//add label to the right side of image and return the new image
//@gap: gap between image and label
-(UIImage *) addLabel:(UILabel *)label gap:(CGFloat)gap
{
    CGSize labelSize = [label.text sizeWithFont:label.font];
    CGRect rect;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.size.width + labelSize.width + gap, self.size.height), NO, 2);
    [self drawInRect:CGRectMake(0,0,self.size.width,self.size.height)];
    rect = CGRectMake(self.size.width + gap, (self.size.height - labelSize.height) * 0.5 , labelSize.width, labelSize.height);
    
    [label.textColor set];
    [label.text drawInRect:CGRectIntegral(rect) withFont:label.font];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

-(UIImage*) addLabelInCenter:(UILabel *)label
{
    CGSize labelSize = [label.text sizeWithFont:label.font];
    CGRect labelRect;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.size.width, self.size.height), NO, 2);
    [self drawInRect:CGRectMake(0,0,self.size.width,self.size.height)];
    labelRect = CGRectMake((self.size.width - labelSize.width) * 0.5, (self.size.height - labelSize.height) * 0.5 , labelSize.width, labelSize.height);
    
    [label.textColor set];
    [label.text drawInRect:CGRectIntegral(labelRect) withFont:label.font];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
