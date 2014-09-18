//
//  ViewFactory.m
//  HuiYuanIOS
//
//  Created by Xu Xian on 14-4-9.
//  Copyright (c) 2014年 Xu Xian. All rights reserved.
//

#import "ViewFactory.h"
#import "UIImage+Text.h"
#import "Common.h"
#import "UIImage+Overlay.h"

#define FORM_LABEL_COLOR 0x000000
#define FORM_CONTENT_COLOR 0x005DAC

@implementation ViewFactory

//access singleton in two ways: sharedDataManager and init
static ViewFactory *sharedViewFactory = nil;
/* singleton */
+(ViewFactory *)sharedViewFactory{
    @synchronized(self){
        if(!sharedViewFactory){
            sharedViewFactory = [[ViewFactory alloc]init];
        }
    }
    return sharedViewFactory;
}
/* singleton */
-(id)init{
    if(!sharedViewFactory){
        self = [super init];
        if(self){
            sharedViewFactory = self;
        }
    }
    return sharedViewFactory;
}

-(UIView *)titleViewWithImage:(UIImage *)image label:(UILabel *)label
{
    return [self titleViewWithImage:image label:label leftOffset:0.0 gap:0.0];
}

-(UIView *)titleViewWithImage:(UIImage *)image label:(UILabel *)label leftOffset:(CGFloat)offset gap:(CGFloat)gap
{
    UIImage *titleImage = [image addLabel:label gap:gap];
    
    UIImageView *titleView = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                           0,
                                                                           titleImage.size.width,
                                                                           titleImage.size.height)];
    titleView.image = titleImage;
    
    return [self navigationContainerViewShiftedToLeft:offset titleView:titleView];
}

- (UIView *)navigationContainerViewShiftedToLeft:(CGFloat)leftOffset titleView:(UIView *)titleView
{
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(titleView.frame.origin.x,
                                                                 titleView.frame.origin.y,
                                                                 titleView.frame.size.width + 2 * leftOffset,
                                                                 titleView.frame.size.height)];
    
    titleView.frame = CGRectMake(0,
                                 0,
                                 titleView.frame.size.width ,
                                 titleView.frame.size.height);
    [container addSubview:titleView];
    
    return container;
}

- (UIView *)viewWithLabel:(UILabel *)label insideImage:(UIImage *)image
{
    UIImage *labeledImage = [image addLabelInCenter:label];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                                           0,
                                                                           labeledImage.size.width,
                                                                           labeledImage.size.height)];
    
    imageView.image = labeledImage;
    
    return imageView;
}



- (UIButton *)navigationButtonWithImage:(UIImage *)image normalColor:(UIColor *)normalColor highlightColor:(UIColor *)highlightColor
{
    UIButton *navButton =[UIButton buttonWithType:UIButtonTypeCustom];
    if(normalColor)
    {
        [navButton setImage:[image imageWithOverlayColor:normalColor] forState:UIControlStateNormal];
    }
    else
    {
        [navButton setImage:image forState:UIControlStateNormal];
    }
    
    if(highlightColor)
    {
        [navButton setImage:[image imageWithOverlayColor:highlightColor] forState:UIControlStateHighlighted];
    }
    else
    {
        //do nothing;
    }
    
    [navButton setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    return navButton;
}

@end
