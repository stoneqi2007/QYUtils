//
//  UILabel+QYAttributesMaker.h
//  Pods
//
//  Created by 戚昌研 on 2017/7/20.
//
//

#import <UIKit/UIKit.h>

@interface UILabel (QYAttributesMaker)

+ (UILabel *)qy_makeAttributes:(void(^)(UILabel *))attributesMaker;

- (UILabel *(^)(UIFont *))qy_font;
- (UILabel *(^)(CGFloat))qy_systemFont;
- (UILabel *(^)(CGFloat))qy_boldSystemFont;
- (UILabel *(^)(UIColor *))qy_texColor;
- (UILabel *(^)(NSUInteger))qy_textColorHex;
- (UILabel *(^)(NSString *))qy_text;
- (UILabel *(^)(NSTextAlignment))qy_texAlignment;
- (UILabel *(^)(NSInteger))qy_numberOfLines;

@end
