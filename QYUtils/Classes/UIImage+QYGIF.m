//
//  UIImage+QYGIF.m
//  Pods
//
//  Created by 戚昌研 on 2017/7/19.
//
//

#import "UIImage+QYGIF.h"
#import <ImageIO/ImageIO.h>
#import <ReactiveObjC/ReactiveObjC.h>

static inline CGImageSourceRef CreateImageSourceWithFile(NSString *path) {
    CFDataRef data = (__bridge CFDataRef)[NSData dataWithContentsOfFile:path];
    if (data == NULL) {
        return NULL;
    }
    return CGImageSourceCreateWithData(data, nil);
}

static inline float ImageSourceGetTotalDuration(CGImageSourceRef const source, size_t const count) {
    float duration = 0.f;
    
    for (int i = 0; i < count; i++) {
        CFDictionaryRef const properties = CGImageSourceCopyPropertiesAtIndex(source, i, NULL);
        if (!properties) {
            continue;
        }
        
        CFDictionaryRef const gifProperties = CFDictionaryGetValue(properties, kCGImagePropertyGIFDictionary);
        if (gifProperties) {
            NSNumber *number =  (__bridge id)CFDictionaryGetValue(gifProperties, kCGImagePropertyGIFUnclampedDelayTime);
            if (number == NULL || [number doubleValue] == 0) {
                number =  (__bridge id)CFDictionaryGetValue(gifProperties, kCGImagePropertyGIFDelayTime);
            }
            if ([number doubleValue] > 0) {
                duration += number.floatValue;
            }
        }
        CFRelease(properties);
    }
    
    return duration;
}

@implementation UIImage (QYGIF)

+ (nullable CFArrayRef)qy_gifFramesWithFile:(NSString *_Nullable)path totalDuration:(out NSTimeInterval *_Nullable)duration {
    CGImageSourceRef isrc = CreateImageSourceWithFile(path);
    if (!isrc) {
        return NULL;
    }
    @onExit {
        CFRelease(isrc);
    };
    size_t const count = CGImageSourceGetCount(isrc);
    if (count == 0) {
        return NULL;
    }
    CFMutableArrayRef frames = CFArrayCreateMutable(kCFAllocatorDefault, count, &kCFTypeArrayCallBacks);
    for (size_t index = 0; index < count; index++) {
        CGImageRef image = CGImageSourceCreateImageAtIndex(isrc, index, NULL);
        CFArrayAppendValue(frames, image);
        CFRelease(image);
    }
    if (duration) {
        NSTimeInterval totalDuration = ImageSourceGetTotalDuration(isrc, count);
        *duration = totalDuration;
    }
    return CFAutorelease(frames);
}

+ (nullable NSArray<UIImage *> *)qy_gifImagesWithFile:(NSString *_Nullable)path totalDuration:(out NSTimeInterval *_Nullable)duration {
    CFArrayRef frames = [self qy_gifFramesWithFile:path totalDuration:duration];
    if (!frames) {
        return NULL;
    }
    CFIndex count = CFArrayGetCount(frames);
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:count];
    for (CFIndex idx = 0; idx < count; idx++) {
        CGImageRef frame = (CGImageRef)CFArrayGetValueAtIndex(frames, idx);
        [results addObject:[UIImage imageWithCGImage:frame scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp]];
    }
    return results;
}

+ (UIImage *)qy_gifAnimatedImageWithFile:(NSString *)path {
    NSTimeInterval duration = 0;
    NSArray *images = [self qy_gifImagesWithFile:path totalDuration:&duration];
    if (images) {
        return [UIImage animatedImageWithImages:images duration:duration];
    }
    return nil;
}

@end

