//
//  NSRegularExpression+QYUtils.h
//  Pods
//
//  Created by 戚昌研 on 2017/6/1.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#ifndef QYRegex
#define QYRegex(x) [NSRegularExpression qy_regularExpressionWithPattern:x]
#endif

#ifndef QYRegexMatch
#define QYRegexMatch(pattern, string) [QYRegex(pattern) qy_match:(string)]
#endif

@interface NSRegularExpression (QYUtils)

/// option is case insensitive
+ (nullable instancetype)qy_regularExpressionWithPattern:(NSString *)pattern;
+ (nullable instancetype)qy_regularExpressionWithPattern:(NSString *)pattern caseInsensitive:(BOOL)caseInsensitive;

- (BOOL)qy_match:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
