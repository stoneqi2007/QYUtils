//
//  NSArray+QYUtils.m
//  Pods
//
//  Created by 戚昌研 on 2017/6/1.
//
//

#import "NSArray+QYUtils.h"

@implementation NSArray (QYUtils)

- (NSArray *)qy_filter:(BOOL (^)(id _Nonnull))filter {
    return [self qy_filterWithIndex:^BOOL(id object, NSUInteger index) {
        return filter(object);
    }];
}
- (NSArray *)qy_filterWithIndex:(BOOL(^)(id, NSUInteger))filter {
    if (self.count == 0) {
        return @[];
    }
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (filter(obj, idx)) {
            [array addObject:obj];
        }
    }];
    return array.copy;
}

- (NSArray *)qy_map:(id  _Nonnull (^)(id _Nonnull))map {
    if (self.count == 0) {
        return @[];
    }
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
    for (id obj in self) {
        [array addObject:map(obj)];
    }
    return array.copy;
}

- (id)qy_findObject:(BOOL (^)(id _Nonnull))find {
    NSUInteger index = [self qy_findIndex:find];
    if (index != NSNotFound) {
        return self[index];
    }
    return nil;
}
- (BOOL)qy_find:(BOOL (^)(id _Nonnull))find {
    return [self qy_findIndex:find] == NSNotFound;
}
- (NSUInteger)qy_findIndex:(BOOL (^)(id _Nonnull))find {
    __block NSUInteger result = NSNotFound;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (find(obj)) {
            result = idx;
            *stop = YES;
        }
    }];
    return result;
}

@end
