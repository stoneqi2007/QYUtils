//
//  NSDate+QYUtils.h
//  Pods
//
//  Created by 戚昌研 on 2017/6/1.
//
//

#import <Foundation/Foundation.h>

@interface NSDate (QYUtils)

- (instancetype)qy_dateByAddingWeek:(NSUInteger)week;
- (instancetype)qy_dateByAddingDay:(NSUInteger)day;

- (instancetype)qy_dateByAddingHour:(NSUInteger)hour;
- (instancetype)qy_dateByAddingMinute:(NSUInteger)min;

@end
