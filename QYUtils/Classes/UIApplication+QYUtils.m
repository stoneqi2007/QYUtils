//
//  UIApplication+QYUtils.m
//  Pods
//
//  Created by 戚昌研 on 2017/7/18.
//
//

#import "UIApplication+QYUtils.h"
#import "NSBundle+QYUtils.h"
#import <MessageUI/MessageUI.h>
#import <objc/runtime.h>
#import "NSString+QYUtils.h"

static NSString *const kLaunchAppStoreLink = @"https://itunes.apple.com/app/apple-store/id%@?mt=8";

@implementation UIApplication (QYUtils)

- (NSString *)qy_appVersion {
    return [[NSBundle mainBundle] qy_bundleVersion];
}

- (NSString *)qy_appName {
    return [[NSBundle mainBundle] qy_bundleDisplayName];
}

- (void)qy_openURLString:(NSString *)URLString {
    NSURL *url = [NSURL URLWithString:URLString];
    
    if (!url) return;
    
    if ([self canOpenURL:url]) {
        if ([self respondsToSelector:@selector(openURL:options:completionHandler:)]) {
            [self openURL:url options:@{} completionHandler:NULL];
        } else {
            [self openURL:url];
        }
    }
}

- (void)qy_launchAppStoreForAppId:(NSString *)appId {
    NSString *link = [NSString stringWithFormat:kLaunchAppStoreLink,appId];
    [self qy_openURLString:link];
}

- (void)qy_telephoneTo:(NSString *)number {
    NSString *link = [NSString stringWithFormat:@"tel://%@",number];
    [self qy_openURLString:link];
}

static void qy_mailComposeControllerDidFinish(MFMailComposeViewController *composeController, MFMailComposeResult result, NSError *error) {
    [composeController dismissViewControllerAnimated:YES completion:NULL];
}

- (void)qy_mailTo:(NSString *)recipient subject:(NSString *)subject messageBody:(NSString *)messageBody fromViewController:(UIViewController *)viewController {
    if ([MFMailComposeViewController canSendMail]) {
        MFMailComposeViewController *mailComposeViewController = [[MFMailComposeViewController alloc] init];
        [mailComposeViewController setSubject:subject ?: @""];
        [mailComposeViewController setToRecipients:recipient ? @[recipient] : nil];
        [mailComposeViewController setMessageBody:messageBody ?: @"" isHTML:NO];
        [mailComposeViewController presentViewController:mailComposeViewController animated:YES completion:NULL];
        
        static const char *name = "QY_MFMailComposeViewController";
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            Class newClass = objc_allocateClassPair([MFMailComposeViewController class], name, 0);
            class_addProtocol(newClass, @protocol(MFMailComposeViewControllerDelegate));
            SEL sel = @selector(mailComposeController:didFinishWithResult:error:);
            const char *typeEncoding = [[NSString stringWithFormat:@"v@:@%s@",@encode(MFMailComposeResult)] UTF8String];
            class_addMethod(newClass, sel, (IMP)qy_mailComposeControllerDidFinish, typeEncoding);
            objc_registerClassPair(newClass);
        });
        object_setClass(mailComposeViewController, objc_getClass(name));
        mailComposeViewController.mailComposeDelegate = (id<MFMailComposeViewControllerDelegate>)mailComposeViewController;
    } else {
        NSMutableString *mail = [NSMutableString stringWithString:@"mailto:"];
        if (recipient) {
            [mail appendString:[recipient qy_stringByEncodingURL]];
        }
        [mail appendString:@"?"];
        NSMutableArray *params = [NSMutableArray array];
        if (subject) {
            [params addObject:[NSString stringWithFormat:@"subject=%@",[subject qy_stringByEncodingURL]]];
        }
        if (messageBody) {
            [params addObject:[NSString stringWithFormat:@"body=%@",[messageBody qy_stringByEncodingURL]]];
        }
        if (params.count > 0) {
            [mail appendString:[params componentsJoinedByString:@"&"]];
        }
        
        [self qy_openURLString:mail];
    }
}

@end
