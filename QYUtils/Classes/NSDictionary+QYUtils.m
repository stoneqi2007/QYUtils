//
//  NSDictionary+QYUtils.m
//  Pods
//
//  Created by 戚昌研 on 2017/6/1.
//
//

#import "NSDictionary+QYUtils.h"

@implementation NSDictionary (QYUtils)

- (nullable id)qy_objectForKey:(NSString *)key expectedType:(Class)cls {
    id value = self[key];
    return (value && value != [NSNull null] && [value isKindOfClass:cls] ? value : nil);
}

- (nullable NSString *)qy_stringForKey:(NSString *)key {
   return [self qy_objectForKey:key expectedType:NSString.class];
}
- (nullable NSNumber *)qy_numberForKey:(NSString *)key {
    return [self qy_objectForKey:key expectedType:NSNumber.class];
}
- (NSInteger)qy_integerForKey:(NSString *)key {
    return [self qy_numberForKey:key].integerValue;
}
- (BOOL)qy_boolForKey:(NSString *)key {
    return [self qy_numberForKey:key].boolValue;
}
- (nullable NSDictionary *)qy_dictionaryForKey:(NSString *)key {
    return [self qy_objectForKey:key expectedType:NSDictionary.class];
}
- (nullable NSArray *)qy_arrayForKey:(NSString *)key {
    return [self qy_objectForKey:key expectedType:NSArray.class];
}

@end
