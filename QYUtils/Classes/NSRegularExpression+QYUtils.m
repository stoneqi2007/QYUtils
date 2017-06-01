//
//  NSRegularExpression+QYUtils.m
//  Pods
//
//  Created by 戚昌研 on 2017/6/1.
//
//

#import "NSRegularExpression+QYUtils.h"

@implementation NSRegularExpression (QYUtils)

+ (nullable instancetype)qy_regularExpressionWithPattern:(NSString *)pattern {
   return [self qy_regularExpressionWithPattern:pattern caseInsensitive:YES];
}
+ (nullable instancetype)qy_regularExpressionWithPattern:(NSString *)pattern caseInsensitive:(BOOL)caseInsensitive {
    return [self regularExpressionWithPattern:pattern options:caseInsensitive ? NSRegularExpressionCaseInsensitive : 0 error:NULL];
}

- (BOOL)qy_match:(NSString *)string {
    return [self firstMatchInString:string options:0 range:NSMakeRange(0, string.length)] != nil;
}

@end
