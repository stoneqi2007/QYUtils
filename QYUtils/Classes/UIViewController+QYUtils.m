//
//  UIViewController+QYUtils.m
//  Pods
//
//  Created by 戚昌研 on 2017/7/21.
//
//

#import "UIViewController+QYUtils.h"
#import <objc/runtime.h>

@implementation UIViewController (QYUtils)

+ (void)load {
    method_exchangeImplementations(class_getInstanceMethod(self, @selector(viewWillAppear:)),
                                   class_getInstanceMethod(self, @selector(qy_viewWillAppear:)));
}

- (void)qy_viewWillAppear:(BOOL)animated {
    [self qy_viewWillAppear:animated];
    [self qy_setInteractiveNavigationBarHidden:self.qy_interactiveNavigationBarHidden animated:animated];
}

#pragma mark - interactive navigation bar hidden

static const void * kInteractiveNavigationBarHidden = &kInteractiveNavigationBarHidden;

- (void)setQy_interactiveNavigationBarHidden:(BOOL)hidden {
    [self qy_setInteractiveNavigationBarHidden:hidden animated:NO];
}

- (BOOL)qy_interactiveNavigationBarHidden {
    return [objc_getAssociatedObject(self, kInteractiveNavigationBarHidden) boolValue];
}

- (void)qy_setInteractiveNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated {
    objc_setAssociatedObject(self, kInteractiveNavigationBarHidden, @(hidden), OBJC_ASSOCIATION_COPY);
    [self.navigationController setNavigationBarHidden:hidden animated:animated];
}

@end
