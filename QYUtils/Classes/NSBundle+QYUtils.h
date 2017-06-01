//
//  NSBundle+QYUtils.h
//  QYUtils
//
//  Created by 戚昌研 on 2017/6/1.
//  Copyright © 2017年 stoneqi2007. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (QYUtils)

/**
 App Version for objectForInfoDictionaryKey[@"CFBundleShortVersionString"]
 typically used in mainBundle
 */
- (nullable NSString *)qy_bundleVersion;

/**
 App Version for objectForInfoDictionaryKey[@"CFBundleName"]
 typically used in mainBundle
 */
- (nullable NSString *)qy_bundleName;

/**
 App Version for objectForInfoDictionaryKey[@"CFBundleDisplayName"]
 typically used in mainBundle
 */
- (nullable NSString *)qy_bundleDisplayName;

@end

NS_ASSUME_NONNULL_END
