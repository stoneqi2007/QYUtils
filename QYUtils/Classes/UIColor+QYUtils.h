//
//  UIColor+QYUtils.h
//  Pods
//
//  Created by 戚昌研 on 2017/7/18.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (QYUtils)

+ (UIColor *)qy_colorWithHex:(NSUInteger)hex;
+ (UIColor *)qy_colorWithHex:(long)hex alpha:(float)opacity;
+ (UIColor *)qy_colorWithHexString:(NSString *)hexString;

+ (NSString *)qy_hexFromUIColor:(UIColor*)color;

@end
