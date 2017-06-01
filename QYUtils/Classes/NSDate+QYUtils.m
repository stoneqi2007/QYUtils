//
//  NSDate+QYUtils.m
//  Pods
//
//  Created by 戚昌研 on 2017/6/1.
//
//

#import "NSDate+QYUtils.h"

@implementation NSDate (QYUtils)

- (instancetype)qy_dateByAddingWeek:(NSUInteger)week {
    return [self qy_dateByAddingDay:week * 7];
}
- (instancetype)qy_dateByAddingDay:(NSUInteger)day {
    return [self qy_dateByAddingHour:day * 24];
}
- (instancetype)qy_dateByAddingHour:(NSUInteger)hour {
    return [self qy_dateByAddingMinute:hour * 60];
}
- (instancetype)qy_dateByAddingMinute:(NSUInteger)min {
    return [self dateByAddingTimeInterval:min * 60];
}

@end
