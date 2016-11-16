//
//  RgMasonryObj.h
//  RogueKitDemo
//
//  Created by rogue on 2016/11/16.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RgMasonryObj : NSObject

@property (nonatomic, strong) void (^goBackBlock)(NSString *str);

@property (nonatomic, strong) NSDictionary *(^goBackBlock1)(NSString *str);

- (void)leftAttribution;

- (NSDictionary *)centerAttribution;

- (RgMasonryObj *)rightAttribution;

- (RgMasonryObj * (^)(id test))equalWithSelf;

- (RgMasonryObj * (^)(NSString *str))method1;

- (RgMasonryObj *)method2:(NSString *)str;

- (RgMasonryObj *)method3;

@end
