//
//  DragTableHeaderView_ot.h
//
//  Created by zhoufan on 14-9-15.
//  Copyright (c) 2014年 zhoufan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define REFRESH_TRIGGER_HEIGHT              (-60.0f)

@class DragTableHeaderView_ot;

@protocol DragTableHeaderDelegate_ot

- (void)dragTableHeaderDidTriggerRefresh:(DragTableHeaderView_ot*)view;
- (void)initOldInsetSize:(float)top bottom:(float)bottom;
- (float)getOldInsetTop;
- (float)getOldinsetBottom;

@end

@interface DragTableHeaderView_ot : UIView

#pragma mark - Texts
@property (nonatomic, retain) NSString *pullDownText;
@property (nonatomic, retain) NSString *releaseText;
@property (nonatomic, retain) NSString *loadingText;
@property (nonatomic, retain) NSString *dateFormatterText;
@property (nonatomic, retain) NSString *refreshDateFormatText;

#pragma mark - UIs
@property (nonatomic, readonly) UILabel *loadingStatusLabel;
@property (nonatomic, readonly) UILabel *refreshDateLabel;
@property (nonatomic, readonly) UIActivityIndicatorView *loadingIndicator;
@property (nonatomic, readonly) UIView *backgroundView;

#pragma mark - Events

- (id)initWithFrame:(CGRect)frame datePermanentStoreKey:(NSString *)datePermanentStoreKey;

@property (nonatomic,assign) NSObject<DragTableHeaderDelegate_ot> *delegate;
@property (nonatomic,readonly) BOOL isLoading;
@property (nonatomic,assign) BOOL shouldShowDate;

- (void)dragTableDidScroll:(UIScrollView *)scrollView;
- (void)dragTableDidEndDragging:(UIScrollView *)scrollView;

- (void)triggerLoading:(UIScrollView *)scrollView;

//Prevent animation conflict when loadmore triggerd. Pass `NO` to `shouldChangeContentInset` when loadmore triggered.
- (void)endLoading:(UIScrollView *)scrollView shouldUpdateRefreshDate:(BOOL)shouldUpdate shouldChangeContentInset:(BOOL)shouldChangeContentInset;

@end
