//
//  NSObject+QYUtils.m
//  Pods
//
//  Created by 戚昌研 on 2017/6/1.
//
//

#import "NSObject+QYUtils.h"
#import "NSArray+QYUtils.h"
#import <ReactiveObjC/ReactiveObjC.h>

@implementation NSObject (QYUtils)

- (RACSignal *)qy_valuesForKeyPath:(NSString *)keyPath {
    __weak id object = self;
    return [object rac_valuesForKeyPath:keyPath observer:self];
}
- (RACSignal *)qy_valuesForKeyPaths:(NSArray<NSString *> *)keypaths {
    NSCAssert(keypaths.count > 0, @"keypaths count not be empty");
    return [RACSignal merge:[keypaths qy_map:^id _Nonnull(NSString *keyPath) {
        return [self qy_valuesForKeyPath:keyPath];
    }]];
}

@end
