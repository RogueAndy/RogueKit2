//
//  RgNetWorkObject.h
//  RogueKitDemo
//
//  Created by Rogue on 16/3/17.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  判断网络数据类型
 */
typedef NS_ENUM(NSInteger, RogueNetWorkType) {
    /**
     *  返回的网络数据正确
     */
    RogueNetWorkRight       = 0,
    /**
     *  返回的网络数据有错
     */
    RogueNetWorkWrong       = 1,
    /**
     *  连接网络失败
     */
    RogueNetWorkSystemWrong = 2
};

@interface RgNetWorkObject : NSObject

+ (void)postMethod:(NSString *)method parameters:(NSDictionary *)parameters complete:(void (^)(NSDictionary *response, RogueNetWorkType networkType))complete;

@end
