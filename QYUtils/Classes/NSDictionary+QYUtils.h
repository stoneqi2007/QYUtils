//
//  NSDictionary+QYUtils.h
//  Pods
//
//  Created by 戚昌研 on 2017/6/1.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (QYUtils)

- (nullable NSString *)qy_stringForKey:(NSString *)key;
- (nullable NSNumber *)qy_numberForKey:(NSString *)key;
- (NSInteger)qy_integerForKey:(NSString *)key;
- (BOOL)qy_boolForKey:(NSString *)key;
- (nullable NSDictionary *)qy_dictionaryForKey:(NSString *)key;
- (nullable NSArray *)qy_arrayForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
