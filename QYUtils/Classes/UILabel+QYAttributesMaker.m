//
//  UILabel+QYAttributesMaker.m
//  Pods
//
//  Created by 戚昌研 on 2017/7/20.
//
//

#import "UILabel+QYAttributesMaker.h"
#import "UIColor+QYUtils.h"

@implementation UILabel (QYAttributesMaker)

//+ (UILabel *)qy_makeAttributes:(void (^)(UILabel *))attributesMaker {
//    UILabel *label = [[UILabel alloc] init];
//    attributesMaker(label);
//    return label;
//}

//- (UILabel *(^)(CGRect))qy_frame {
//    return ^(CGRect rect) {
//        self.frame = rect;
//        return self;
//    };
//}
//
//- (UILabel *(^)(UIView *))qy_superView {
//    return ^(UIView *view) {
//        [view addSubview:self];
//        return self;
//    };
//}

- (UILabel *(^)(UIFont *))qy_font {
    return ^(UIFont *font) {
        self.font = font;
        return self;
    };
}

- (UILabel *(^)(CGFloat))qy_systemFont {
    return ^(CGFloat size) {
        self.font = [UIFont systemFontOfSize:size];
        return self;
    };
}

- (UILabel *(^)(CGFloat))qy_boldSystemFont {
    return ^(CGFloat size) {
        self.font = [UIFont boldSystemFontOfSize:size];
        return self;
    };
}

- (UILabel *(^)(UIColor *))qy_texColor {
    return ^(UIColor *color) {
        self.textColor = color;
        return self;
    };
}

- (UILabel *(^)(NSUInteger))qy_textColorHex {
    return ^(NSUInteger hex) {
        self.textColor = [UIColor qy_colorWithHex:hex];
        return self;
    };
}

//- (UILabel *(^)(UIColor *))qy_backgroundColor {
//    return ^(UIColor *color) {
//        self.backgroundColor = color;
//        return self;
//    };
//}
//
//- (UILabel *(^)(NSUInteger))qy_backgroundColorHex {
//    return ^(NSUInteger hex) {
//        self.backgroundColor = [UIColor qy_colorWithHex:hex];
//        return self;
//    };
//}

- (UILabel *(^)(NSString *))qy_text {
    return ^(NSString *text) {
        self.text = text;
        return self;
    };
}

- (UILabel *(^)(NSTextAlignment))qy_texAlignment {
    return ^(NSTextAlignment texAlignment) {
        self.textAlignment = texAlignment;
        return self;
    };
}

- (UILabel *(^)(NSInteger))qy_numberOfLines {
    return ^(NSInteger num) {
        self.numberOfLines = num;
        return self;
    };
}


@end
