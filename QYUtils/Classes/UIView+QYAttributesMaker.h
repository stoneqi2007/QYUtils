//
//  UIView+QYAttributesMaker.h
//  Pods
//
//  Created by 戚昌研 on 2017/7/20.
//
//

#import <UIKit/UIKit.h>

@interface UIView (QYAttributesMaker)

+ (UIView *)qy_makeAttributes:(void(^)(UIView *))attributesMaker;

- (UIView *(^)(CGRect))qy_frame;
- (UIView *(^)(UIView *))qy_superView;
- (UIView *(^)(UIColor *))qy_backgroundColor;
- (UIView *(^)(NSUInteger))qy_backgroundColorHex;
- (UIView *(^)(UIViewContentMode))qy_contentMode;
- (UIView *(^)(CGFloat))qy_cornerRadius;
- (UIView *(^)(CGFloat))qy_borderWidth;
- (UIView *(^)(CGColorRef))qy_borderColor;


@end
