//
//  NSArray+QYUtils.h
//  Pods
//
//  Created by 戚昌研 on 2017/6/1.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<__covariant ObjectType> (QYUtils)

- (NSArray<ObjectType> *)qy_filter:(BOOL(^)(ObjectType object))filter;
- (NSArray<ObjectType> *)qy_filterWithIndex:(BOOL(^)(ObjectType object, NSUInteger index))filter;

- (NSArray *)qy_map:(id(^)(ObjectType object))map;

- (nullable ObjectType)qy_findObject:(BOOL(^)(ObjectType object))find;
- (BOOL)qy_find:(BOOL(^)(ObjectType object))find;
- (NSUInteger)qy_findIndex:(BOOL(^)(ObjectType object))find;

@end

NS_ASSUME_NONNULL_END
