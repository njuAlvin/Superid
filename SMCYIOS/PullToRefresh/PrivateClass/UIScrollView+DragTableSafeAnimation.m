//
//  UITableView+DragTableSafeAnimation.m
//  LoadMore
//
//  Created by zhoufan on 14-9-15.
//  Copyright (c) 2014年 zhoufan. All rights reserved.
//

#import "UIScrollView+DragTableSafeAnimation.h"
#import <objc/runtime.h>

#define DRAG_TABLE_LAST_CONTENT_INSETS_KEY          @"ot_kUITableViewDragDelegate"

@implementation UIScrollView (DragTableSafeAnimation)

- (void)dragTableSafeAnimationForSetContentInsets:(UIEdgeInsets)contentInsets
{
    NSValue *lastContentInsetsValue = [self lastContentInsets];
    if (lastContentInsetsValue)
    {
        [NSObject cancelPreviousPerformRequestsWithTarget:self];// selector:@selector(dragTableSafeAnimationForSetContentInsets:) object:lastContentInsetsValue];
    }
    
    NSValue *newContentInsetsValue = [NSValue valueWithUIEdgeInsets:contentInsets];
    [self setLastContentInsets:newContentInsetsValue];
    [self performSelector:@selector(dragTableDoAnimationForSetContentInsets:) withObject:newContentInsetsValue afterDelay:0];
}

- (void)dragTableDoAnimationForSetContentInsets:(NSValue *)contentInsetsValue
{
    UIEdgeInsets insets = [contentInsetsValue UIEdgeInsetsValue];
    [UIView animateWithDuration:0.2 animations:^{
        self.contentInset = insets;
    }];
}

- (NSValue *)lastContentInsets
{
    return objc_getAssociatedObject(self, DRAG_TABLE_LAST_CONTENT_INSETS_KEY);
}

- (void)setLastContentInsets:(NSValue *)lastContentInsets
{
    objc_setAssociatedObject(self, DRAG_TABLE_LAST_CONTENT_INSETS_KEY, lastContentInsets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
