//
//  NSURL+QYUtils.h
//  Pods
//
//  Created by 戚昌研 on 2017/6/1.
//
//

#import <Foundation/Foundation.h>

@interface NSURL (QYUtils)

- (BOOL)qy_isHTTP;
- (BOOL)qy_isHTTPS;
- (BOOL)qy_isHTTPOrHTTPS;
- (BOOL)qy_isTEL;
- (BOOL)qy_isMAILTO;

- (BOOL)qy_isItunes;

- (BOOL)qy_isFragmentJumpWith:(NSURL *)URL;

@end
