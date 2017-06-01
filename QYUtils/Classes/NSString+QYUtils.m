//
//  NSString+QYUtils.m
//  Pods
//
//  Created by 戚昌研 on 2017/6/1.
//
//

#import "NSString+QYUtils.h"
#import "NSRegularExpression+QYUtils.h"

@implementation NSString (QYUtils)

- (nullable NSString *)qy_stringByDecodingURL {
    return [self stringByRemovingPercentEncoding];
}
- (nullable NSString *)qy_stringByEncodingURL {
    NSMutableCharacterSet *set = [[NSMutableCharacterSet alloc] init];
    
    [set formUnionWithCharacterSet:NSCharacterSet.URLUserAllowedCharacterSet];
    [set formUnionWithCharacterSet:NSCharacterSet.URLPasswordAllowedCharacterSet];
    [set formUnionWithCharacterSet:NSCharacterSet.URLHostAllowedCharacterSet];
    [set formUnionWithCharacterSet:NSCharacterSet.URLPathAllowedCharacterSet];
    [set formUnionWithCharacterSet:NSCharacterSet.URLQueryAllowedCharacterSet];
    [set formUnionWithCharacterSet:NSCharacterSet.URLFragmentAllowedCharacterSet];
    
    return [self stringByAddingPercentEncodingWithAllowedCharacters:set];
}

- (BOOL)qy_isNumeric {
    return QYRegexMatch(@"^\\d+$", self);
}

@end
