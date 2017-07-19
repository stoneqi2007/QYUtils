//
//  UIImage+QYUtils.h
//  Pods
//
//  Created by 戚昌研 on 2017/7/19.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (QYUtils)

- (UIImage *)qy_centerResizingImage;

+ (UIImage *)qy_imageWithColor:(UIColor *)color size:(CGSize)size ellipse:(BOOL)ellipse;
+ (UIImage *)qy_imageWithColor:(UIColor *)color;

@end
