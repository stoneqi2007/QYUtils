//
//  UIView+QYAttributesMaker.m
//  Pods
//
//  Created by 戚昌研 on 2017/7/20.
//
//

#import "UIView+QYAttributesMaker.h"
#import "UIColor+QYUtils.h"

@implementation UIView (QYAttributesMaker)

+ (UIView *)qy_makeAttributes:(void (^)(UIView *))attributesMaker {
    UIView *view = [[UIView alloc] init];
    attributesMaker(view);
    return view;
}

- (UIView *(^)(CGRect))qy_frame {
    return ^(CGRect rect) {
        self.frame = rect;
        return self;
    };
}

- (UIView *(^)(UIView *))qy_superView {
    return ^(UIView *view) {
        [view addSubview:self];
        return self;
    };
}

- (UIView *(^)(UIColor *))qy_backgroundColor {
    return ^(UIColor *color) {
        self.backgroundColor = color;
        return self;
    };
}

- (UIView *(^)(NSUInteger))qy_backgroundColorHex {
    return ^(NSUInteger hex) {
        self.backgroundColor = [UIColor qy_colorWithHex:hex];
        return self;
    };
}

- (UIView *(^)(UIViewContentMode))qy_contentMode {
    return ^(UIViewContentMode mode){
        self.contentMode = mode;
        return self;
    };
}

- (UIView *(^)(CGFloat))qy_cornerRadius {
    return ^(CGFloat value){
        self.layer.cornerRadius = value;
        return self;
    };
}

- (UIView *(^)(CGFloat))qy_borderWidth {
    return ^(CGFloat value){
        self.layer.borderWidth = value;
        return self;
    };
}

- (UIView *(^)(CGColorRef))qy_borderColor {
    return ^(CGColorRef value){
        self.layer.borderColor = value;
        return self;
    };
}

@end
