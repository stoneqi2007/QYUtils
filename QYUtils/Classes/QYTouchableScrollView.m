//
//  QYTouchableScrollView.m
//  Pods
//
//  Created by 戚昌研 on 2017/7/18.
//
//

#import "QYTouchableScrollView.h"

@implementation QYTouchableScrollView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!self.isDragging) {
        [self.superview touchesBegan:touches withEvent:event];
    } else {
        [self touchesBegan:touches withEvent:event];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!self.isDragging) {
        [self.superview touchesEnded:touches withEvent:event];
    } else {
        [self touchesEnded:touches withEvent:event];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!self.isDragging) {
        [self.superview touchesMoved:touches withEvent:event];
    } else {
        [self touchesMoved:touches withEvent:event];
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.isDragging) {
        [self.superview touchesCancelled:touches withEvent:event];
    } else {
        [self touchesCancelled:touches withEvent:event];
    }
}

@end
