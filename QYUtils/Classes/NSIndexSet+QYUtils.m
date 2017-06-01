//
//  NSIndexSet+QYUtils.m
//  Pods
//
//  Created by 戚昌研 on 2017/6/1.
//
//

#import "NSIndexSet+QYUtils.h"

@implementation NSIndexSet (QYUtils)

- (NSArray<NSNumber *> *)qy_toArray {
    NSInteger index = self.firstIndex;
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    
    while (index != NSNotFound) {
        [result addObject:@(index)];
        index = [self indexGreaterThanIndex:index];
    }
    return result.copy;
}
- (NSArray<NSNumber *> *)qy_toDescendingArray {
    NSInteger index = self.lastIndex;
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    
    while (index != NSNotFound) {
        [result addObject:@(index)];
        index = [self indexLessThanIndex:index];
    }
    return result.copy;
}

@end
