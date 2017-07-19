//
//  UIImage+QYUtils.m
//  Pods
//
//  Created by 戚昌研 on 2017/7/19.
//
//

#import "UIImage+QYUtils.h"

static void qy_CGContexFill(CGContextRef context, UIColor *color, CGRect rect, BOOL ellipse) {
    [color setFill];
    if (ellipse) {
        CGContextAddEllipseInRect(context, rect);
    } else {
        CGContextAddRect(context, rect);
    }
    
    CGContextFillPath(context);
}

@implementation UIImage (QYUtils)

- (UIImage *)qy_centerResizingImage {
    CGSize size = self.size;
    UIEdgeInsets insets = UIEdgeInsetsMake(floor(size.height/2.f),
                                           floor(size.width/2.f),
                                           floor(size.height/2.f),
                                           floor(size.width/2.f));
    return [self resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
}

+ (UIImage *)qy_imageWithColor:(UIColor *)color size:(CGSize)size ellipse:(BOOL)ellipse {
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    qy_CGContexFill(context, color, CGRectMake(0, 0, size.width, size.height), ellipse);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)qy_imageWithColor:(UIColor *)color {
    return [self qy_imageWithColor:color size:CGSizeMake(1.f, 1.f) ellipse:NO];
}

@end
