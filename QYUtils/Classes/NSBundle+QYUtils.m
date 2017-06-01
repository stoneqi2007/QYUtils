//
//  NSBundle+QYUtils.m
//  QYUtils
//
//  Created by 戚昌研 on 2017/6/1.
//  Copyright © 2017年 stoneqi2007. All rights reserved.
//

#import "NSBundle+QYUtils.h"

@implementation NSBundle (QYUtils)

- (nullable NSString *)qy_bundleVersion {
    return [self objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

- (nullable NSString *)qy_bundleName {
    return [self objectForInfoDictionaryKey:@"CFBundleName"];
}

- (nullable NSString *)qy_bundleDisplayName {
    return [self objectForInfoDictionaryKey:@"CFBundleDisplayName"];
}

@end
