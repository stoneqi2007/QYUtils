//
//  UIApplication+QYUtils.h
//  Pods
//
//  Created by 戚昌研 on 2017/7/18.
//
//

#import <UIKit/UIKit.h>

@interface UIApplication (QYUtils)

- (NSString *)qy_appVersion;

- (NSString *)qy_appName;

- (void)qy_launchAppStoreForAppId:(NSString *)appId;

- (void)qy_mailTo:(NSString *)recipient subject:(NSString *)subject messageBody:(NSString *)messageBody fromViewController:(UIViewController *)viewController;

- (void)qy_telephoneTo:(NSString *)number;

@end
