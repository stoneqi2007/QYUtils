//
//  UIViewController+QYUtils.h
//  Pods
//
//  Created by 戚昌研 on 2017/7/21.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (QYUtils)

@property (nonatomic, assign) BOOL qy_interactiveNavigationBarHidden;

- (void)qy_setInteractiveNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated;

@end
