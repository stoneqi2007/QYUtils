//
//  UIView+QYUtils.m
//  Pods
//
//  Created by 戚昌研 on 2017/7/20.
//
//

#import "UIView+QYUtils.h"
#import <objc/runtime.h>

@implementation UIView (QYUtils)

#pragma mark - frame

- (CGFloat)qy_x {
    return self.frame.origin.x;
}

- (void)setQy_x:(CGFloat)qy_x {
    CGRect frame = self.frame;
    frame.origin.x = qy_x;
    self.frame = frame;
}

- (CGFloat)qy_y {
    return self.frame.origin.y;
}

- (void)setQy_y:(CGFloat)qy_y {
    CGRect frame = self.frame;
    frame.origin.y = qy_y;
    self.frame = frame;
}

- (CGPoint)qy_origin {
    return self.frame.origin;
}

- (void)setQy_origin:(CGPoint)qy_origin {
    CGRect frame = self.frame;
    frame.origin = qy_origin;
    self.frame = frame;
}

- (CGFloat)qy_width {
    return self.bounds.size.width;
}

- (void)setQy_width:(CGFloat)qy_width {
    CGRect frame = self.frame;
    frame.size.width = qy_width;
    self.frame = frame;
}

- (CGFloat)qy_height {
    return self.bounds.size.height;
}

- (void)setQy_height:(CGFloat)qy_height {
    CGRect frame = self.frame;
    frame.size.height = qy_height;
    self.frame = frame;
}

- (CGSize)qy_size {
    return self.bounds.size;
}

- (void)setQy_size:(CGSize)qy_size {
    CGRect frame = self.frame;
    frame.size = qy_size;
    self.frame = frame;
}

- (CGFloat)qy_maxX {
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)qy_maxY {
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)qy_centerX {
    return CGRectGetMidX(self.frame);
}

- (CGFloat)qy_centerY {
    return CGRectGetMidY(self.frame);
}

#pragma mark - Gesture Recognizer

- (UITapGestureRecognizer *)qy_tapGestureRecognizer {
    UITapGestureRecognizer *tap = objc_getAssociatedObject(self, _cmd);
    if (tap) {
        return tap;
    }
    
    self.userInteractionEnabled = YES;
    tap = [[UITapGestureRecognizer alloc] init];
    [self addGestureRecognizer:tap];
    objc_setAssociatedObject(self, _cmd, tap, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return tap;
}

#pragma mark - View hierarchy

- (UIView *)qy_closestView:(BOOL (^)(UIView * _Nonnull))block {
    UIView *view = self;
    while (view) {
        if (block(view)) {
            return view;
        }
        view = view.superview;
    }
    return nil;
}

- (UIView *)qy_closestViewWithClass:(Class)cls {
    return [self qy_closestView:^(UIView *view){
        return [view isKindOfClass:cls];
    }];
}

- (UIView *)qy_findView:(BOOL (^)(UIView *))filter {
    UIView *view = self;
    if (filter(view)) {
        return view;
    }
    for (UIView *subview in view.subviews) {
        return [subview qy_findView:filter];
    }
    return nil;
}

- (UIView *)qy_findViewWithClass:(Class)cls {
    return [self qy_findView:^BOOL(UIView *view) {
        return [view isKindOfClass:cls];
    }];
}

- (void)qy_findView:(UIView *)view appendToArray:(NSMutableArray *)array filter:(BOOL (^)(UIView *))filter {
    if (filter(view)) {
        [array addObject:view];
        return;
    }
    for (UIView *subview in view.subviews) {
        [self qy_findView:subview appendToArray:array filter:filter];
    }
}

- (NSArray<__kindof UIView *> *)qy_findViews:(BOOL(^)(UIView *view))filter {
    NSMutableArray *results = [NSMutableArray array];
    [self qy_findView:self appendToArray:results filter:filter];
    if (results) {
        return results.copy;
    }
    return nil;
}

- (NSArray<UIView *> *)qy_findViewsWithClass:(Class)cls {
    return [self qy_findViews:^BOOL(__kindof UIView * _Nonnull view) {
        return [view isKindOfClass:cls];
    }];
}

- (void)qy_removeSubviews {
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
}

@end
