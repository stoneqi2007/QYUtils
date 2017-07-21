//
//  UIScrollView+QYUtils.m
//  Pods
//
//  Created by 戚昌研 on 2017/7/21.
//
//

#import "UIScrollView+QYUtils.h"

@implementation UIScrollView (QYUtils)

- (void)qy_scrollToTopWithAnimated:(BOOL)animated {
    CGPoint offset = self.contentOffset;
    offset.y = -self.contentInset.top;
    
    [self setContentOffset:offset animated:animated];
}
- (void)qy_scrollToLeftWithAnimated:(BOOL)animated {
    CGPoint offset = self.contentOffset;
    offset.x = -self.contentInset.left;
    
    [self setContentOffset:offset animated:animated];
}

- (CGFloat)qy_offsetOutSideOfTop {
    return self.contentOffset.y + self.contentInset.top;
}
- (CGFloat)qy_offsetOutSideOfBottom {
    return (self.contentSize.height - (self.bounds.size.height - self.contentInset.bottom)) - self.contentOffset.y;
}

@end
