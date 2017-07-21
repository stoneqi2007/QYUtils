//
//  UIScrollView+QYPage.m
//  Pods
//
//  Created by 戚昌研 on 2017/7/21.
//
//

#import "UIScrollView+QYPage.h"
#import <Masonry/Masonry.h>

@implementation UIScrollView (QYPage)

- (void)setPages:(NSArray<UIView *> *)pages {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    UIView *contentView = [[UIView alloc] init];
    [self addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
        make.height.equalTo(self);
    }];
    
    UIView *lastPage = nil;
    for (UIView *page in pages) {
        [self addSubview:page];
        [page mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lastPage ? lastPage.mas_left : self);
            make.top.height.with.equalTo(self);
        }];
        
        lastPage = page;
    }
    [contentView mas_makeConstraints:^(MASConstraintMaker *maker){
        maker.right.equalTo(lastPage);
    }];
}

@end
