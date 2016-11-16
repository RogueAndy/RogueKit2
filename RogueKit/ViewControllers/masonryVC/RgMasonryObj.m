//
//  RgMasonryObj.m
//  RogueKitDemo
//
//  Created by rogue on 2016/11/16.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgMasonryObj.h"

@implementation RgMasonryObj

- (void)testMethod {

    self.goBackBlock(@"i am a ");
    
    NSDictionary *testDictionary = self.goBackBlock1(@"hhh");
    NSLog(@"%@", testDictionary);

}

- (RgMasonryObj *(^)(NSString *))method1 {

    return ^(NSString *str){
    
        return [RgMasonryObj new];
    
    };
    
}

- (RgMasonryObj *(^)(id))equalWithSelf {

    return ^(id current) {
    
        return [RgMasonryObj new];
    
    };

}

@end
