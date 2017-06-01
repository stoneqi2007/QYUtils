//
//  NSString+QYUtils.h
//  Pods
//
//  Created by 戚昌研 on 2017/6/1.
//
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (QYUtils)

- (nullable NSString *)qy_stringByDecodingURL;
- (nullable NSString *)qy_stringByEncodingURL;

- (BOOL)qy_isNumeric;

@end
NS_ASSUME_NONNULL_END
