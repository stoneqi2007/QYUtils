//
//  UIView+QYUtils.h
//  Pods
//
//  Created by 戚昌研 on 2017/7/20.
//
//

#import <UIKit/UIKit.h>

@interface UIView (QYUtils)

@property (nonatomic, assign) CGFloat qy_x;
@property (nonatomic, assign) CGFloat qy_y;
@property (nonatomic, assign) CGPoint qy_origin;

@property (nonatomic, assign) CGFloat qy_width;
@property (nonatomic, assign) CGFloat qy_height;
@property (nonatomic, assign) CGSize qy_size;

@property (nonatomic, assign, readonly) CGFloat qy_maxX;
@property (nonatomic, assign, readonly) CGFloat qy_maxY;
@property (nonatomic, assign, readonly) CGFloat qy_centerX;
@property (nonatomic, assign, readonly) CGFloat qy_centerY;

@property (nonatomic, strong, readonly) UITapGestureRecognizer *qy_tapGestureRecognizer;

- (UIView *)qy_closestView:(BOOL(^)(UIView *view))block;
- (UIView *)qy_closestViewWithClass:(Class)cls;

- (UIView *)qy_findView:(BOOL(^)(UIView *view))filter;
- (UIView *)qy_findViewWithClass:(Class)cls;

- (NSArray<UIView *> *)qy_findViews:(BOOL(^)(UIView *view))filter;
- (NSArray<UIView *> *)qy_findViewsWithClass:(Class)cls;

- (void)qy_removeSubviews;

@end
