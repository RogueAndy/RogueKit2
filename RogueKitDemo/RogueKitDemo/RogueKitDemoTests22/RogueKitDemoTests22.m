//
//  RogueKitDemoTests22.m
//  RogueKitDemoTests22
//
//  Created by Rogue on 16/3/23.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RgUserObject.h"

@interface RogueKitDemoTests22 : XCTestCase

@end

@implementation RogueKitDemoTests22

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    
    RgUserObject *rg = [RgUserObject new];
    rg.userName = @"钟灵杰";
    rg.cards = @[@"dd", @"33", @"44"];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:rg];
//    NSDictionary *dd = [NSDictionary dictionaryWithObjectsAndKeys:@"dd", @"dwadawd", nil];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:data forKey:@"zlj"];
    [defaults synchronize];
    
    NSUserDefaults *de = [NSUserDefaults standardUserDefaults];
    NSData *newData = [de objectForKey:@"zlj"];
    RgUserObject *newrg = [RgUserObject new];
    newrg = [NSKeyedUnarchiver unarchiveObjectWithData:newData];
    NSLog(@"%@", newrg.cards);
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
