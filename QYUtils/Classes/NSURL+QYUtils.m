//
//  NSURL+QYUtils.m
//  Pods
//
//  Created by 戚昌研 on 2017/6/1.
//
//

#import "NSURL+QYUtils.h"
#import "runtime.h"

@implementation NSURL (QYUtils)

- (nullable NSString *)qy_URLStringByRemovingFragment {
    if (self.fragment) {
        return [self.absoluteString stringByReplacingOccurrencesOfString:[@"#" stringByAppendingString:self.fragment]
                                                              withString:@""];
    }
    return self.absoluteString;
}

- (BOOL)qy_isScheme:(NSString *)scheme {
    return self.scheme && [self.scheme caseInsensitiveCompare:scheme] == NSOrderedSame;
}
- (BOOL)qy_isHTTP {
    return [self qy_isScheme:@"http"];
}
- (BOOL)qy_isHTTPS {
    return [self qy_isScheme:@"https"];
}
- (BOOL)qy_isHTTPOrHTTPS {
    return [self qy_isHTTP] || [self qy_isHTTPS];
}
- (BOOL)qy_isTEL {
    return [self qy_isScheme:@"tel"];
}
- (BOOL)qy_isMAILTO {
    return [self qy_isScheme:@"mailto"];
}

- (BOOL)qy_isItunes {
    return self.host && [self.host caseInsensitiveCompare:@"itunes.apple.com"] == NSOrderedSame;
}

- (BOOL)qy_isFragmentJumpWith:(NSURL *)URL {
    if (string_equivalent(self.absoluteString, URL.absoluteString)) {
        return NO;
    }
    NSString *toURLString = [self qy_URLStringByRemovingFragment];
    NSString *fromURLString = [URL qy_URLStringByRemovingFragment];
    return string_equivalent(toURLString, fromURLString);
}

@end
