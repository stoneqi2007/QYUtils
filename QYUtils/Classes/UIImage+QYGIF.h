//
//  UIImage+QYGIF.h
//  Pods
//
//  Created by 戚昌研 on 2017/7/19.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (QYGIF)

+ (nullable UIImage *)qy_gifAnimatedImageWithFile:(NSString *_Nullable)path;

+ (nullable CFArrayRef)qy_gifFramesWithFile:(NSString *_Nullable)path totalDuration:(out NSTimeInterval *_Nullable)duration;
+ (nullable NSArray<UIImage *> *)qy_gifImagesWithFile:(NSString *_Nullable)path totalDuration:(out NSTimeInterval *_Nullable)duration;

@end
