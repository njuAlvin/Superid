//
//  UITableView+DragTableSafeAnimation.h
//  LoadMore
//
//  Created by zhoufan on 14-9-15.
//  Copyright (c) 2014年 zhoufan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (DragTableSafeAnimation)

- (void)dragTableSafeAnimationForSetContentInsets:(UIEdgeInsets)contentInsets;

@end
