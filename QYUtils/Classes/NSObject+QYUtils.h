//
//  NSObject+QYUtils.h
//  Pods
//
//  Created by 戚昌研 on 2017/6/1.
//
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (QYUtils)

- (RACSignal *)qy_valuesForKeyPath:(NSString *)keyPath;
- (RACSignal *)qy_valuesForKeyPaths:(NSArray<NSString *> *)keypaths;

@end

NS_ASSUME_NONNULL_END
