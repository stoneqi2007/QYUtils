//
//  NSArray+SafeBounds.m
//  Pods
//
//  Created by 戚昌研 on 2017/5/24.
//
//

#import "NSArray+SafeBounds.h"
#import <objc/runtime.h>

@implementation NSArray (SafeBounds)

+ (void)load {
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{  //方法交换只要一次就好
        Method oldObjectAtIndex = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndex:));
        Method newObjectAtIndex = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(__safe__objectAtIndex:));
        method_exchangeImplementations(oldObjectAtIndex, newObjectAtIndex);
    });
}

- (id)__safe__objectAtIndex:(NSInteger)index {
    if (index > self.count - 1 || !self.count){
        @try {
            return [self __safe__objectAtIndex:index];
        } @catch (NSException *exception) {
            //__throwOutException  抛出异常
            return nil;
        } @finally {
            
        }
    }
    else{
        return [self __safe__objectAtIndex:index];
    }
}

@end

//mutableArray的对象也需要做方法交换
@interface NSMutableArray (SafeBounds)

@end

@implementation NSMutableArray (SafeBounds)

+ (void)load {
    [super load];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{  //方法交换只要一次就好
        Method oldObjectAtIndex = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(objectAtIndex:));
        Method newObjectAtIndex = class_getInstanceMethod(objc_getClass("__NSArrayM"), @selector(__safe__objectAtIndex:));
        method_exchangeImplementations(oldObjectAtIndex, newObjectAtIndex);
    });
}

- (id)__safe__objectAtIndex:(NSUInteger)index {
    if (index > self.count - 1 || !self.count){
        @try {
            return [self __safe__objectAtIndex:index];
        } @catch (NSException *exception) {
            //__throwOutException  抛出异常
            return nil;
        } @finally {
            
        }
    } else{
        return [self __safe__objectAtIndex:index];
    }
}

@end

