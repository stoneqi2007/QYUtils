//
//  UIScrollView+QYUtils.h
//  Pods
//
//  Created by 戚昌研 on 2017/7/21.
//
//

#import <UIKit/UIKit.h>

@interface UIScrollView (QYUtils)

- (void)qy_scrollToTopWithAnimated:(BOOL)animated;
- (void)qy_scrollToLeftWithAnimated:(BOOL)animated;

- (CGFloat)qy_offsetOutSideOfTop;
- (CGFloat)qy_offsetOutSideOfBottom;

@end
