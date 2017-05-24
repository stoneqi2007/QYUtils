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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSArray *testArray = @[@"a",@"b",@"c"];
    NSLog(@"%@",testArray[4]);
    
    NSMutableArray *testMArray = [[NSMutableArray alloc]init];
    [testMArray addObject:@"a"];
    [testMArray addObject:@"b"];
    NSLog(@"%@",testMArray[5]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
