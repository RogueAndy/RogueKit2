//
//  RogueKitDemoTests.m
//  RogueKitDemoTests
//
//  Created by Rogue on 16/3/17.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RgNetWorkObject.h"

@interface RogueKitDemoTests : XCTestCase

@end

@implementation RogueKitDemoTests

- (void)setUp {
    [super setUp];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
    NSLog(@"----------------------");
    [RgNetWorkObject postMethod:@"getUserWithUserId" parameters:@{@"userid": @"11103080235"} complete:^(NSDictionary *response, RogueNetWorkType networkType) {
        
        if(networkType == RogueNetWorkRight) {
        
            NSLog(@"%@", response[@"obj"]);
        
        }
        
    }];
    NSLog(@"----------------------");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
