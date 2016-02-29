//
//  RogueNetworkManager.h
//  RogueKitDemo
//
//  Created by Rogue on 16/1/21.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RogueNetworkManager : NSObject

+ (void)sesstionConfigure;

+ (void)apiMethod:(NSString *)method parameters:(NSDictionary *)parameter completeBlock:(void (^)(BOOL status, NSDictionary *responseObj, NSString *responseMessage))complete;

+ (void)apiMethod:(NSString *)method stream:(NSData *)datas parameters:(NSDictionary *)parameter completeBlock:(void (^)(BOOL status, NSDictionary *responseObj, NSString *responseMessage))complete;

@end
