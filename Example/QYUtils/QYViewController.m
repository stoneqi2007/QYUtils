//
//  QYViewController.m
//  QYUtils
//
//  Created by stoneqi2007 on 05/19/2017.
//  Copyright (c) 2017 stoneqi2007. All rights reserved.
//

#import "QYViewController.h"

@interface QYViewController ()

@end

@implementation QYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self testSafeBoundsArray];
    [self testArrayUtils];
    [self testBundleUtils];
    [self testAttributeMakerUtils];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - test method

//NSArray+SafeBounds
- (void)testSafeBoundsArray {
    NSArray *testArray = @[@"a",@"b",@"c"];
    NSLog(@"%@",testArray[4]);
    
    NSMutableArray *testMArray = [[NSMutableArray alloc]init];
    [testMArray addObject:@"a"];
    [testMArray addObject:@"b"];
    NSLog(@"%@",testMArray[5]);
}

//NSArray+QYUtils
- (void)testArrayUtils {
    NSArray *testArray = @[@(1),@(2),@(3),@(4),@(5),@(6),@(7)];
    
    NSArray *filterArray = [testArray qy_filter:^BOOL(NSNumber *object) {
        if ([object integerValue] > 5) {
            return YES;
        }
        return NO;
    }];
    NSLog(@"filterArray = %@",filterArray);
    
    NSArray *mapArray = [testArray qy_map:^id _Nonnull(NSNumber *object) {
        return @(object.integerValue + 5);
    }];
    NSLog(@"mapArray = %@",mapArray);
    
    NSNumber *object = [testArray qy_findObject:^BOOL(NSNumber *object) {
        if (object.integerValue == 5) {
            return YES;
        }
        return NO;
    }];
    NSLog(@"findObject = %@",object);
}

- (void)testBundleUtils {
//    NSString *bundleVersion = [[NSBundle mainBundle] qy_bundleVersion];
//    NSLog(@"bundleVersion = %@",bundleVersion);
//    
//    NSString *bundleName = [[NSBundle mainBundle] qy_bundleName];
//    NSLog(@"bundleName = %@",bundleName);
//    
//    NSString *bundleDisplayName = [[NSBundle mainBundle] qy_bundleDisplayName];
//    NSLog(@"bundleDisplayName = %@",bundleDisplayName);
}

- (void)testAttributeMakerUtils {
    [UILabel qy_makeAttributes:^(UILabel *label) {
        label.qy_frame(CGRectMake(0, 0, 100, 200)).qy_superView(self.view).qy_backgroundColor([UIColor redColor]);
    }];
}

@end
