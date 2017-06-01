//
//  NSIndexSet+QYUtils.h
//  Pods
//
//  Created by 戚昌研 on 2017/6/1.
//
//

#import <Foundation/Foundation.h>

@interface NSIndexSet (QYUtils)

/// ascending.
- (NSArray<NSNumber *> *)qy_toArray;
- (NSArray<NSNumber *> *)qy_toDescendingArray;

@end
