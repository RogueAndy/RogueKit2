//
//  RogueCache.h
//  RogueKitDemo
//
//  Created by Rogue on 16/1/19.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RogueViewControllerTranstion.h"
#import "RogueUserObject.h"

@interface RogueCache : NSObject

@property (nonatomic, assign) CGFloat transtionDuration;

@property (nonatomic, assign) RogueTranstionType transtionType;

@property (nonatomic, assign) BOOL isLogin;

/**
 *  单例模式
 *
 *  @return 单例全局变量
 */

+ (nonnull instancetype)shareInstance;

/**
 *  设置内存缓存
 *
 *  @param user 用户缓存信息
 */

+ (void)setSessionValues:(nonnull RogueUserObject *)user;

/**
 *  取出内存缓存
 *
 *  @return 取出缓存值
 */

+ (nonnull RogueUserObject *)getSessionValues;

/**
 *  更新用户信息，从而促发通知效果
 *
 *  @param user 用户信息
 */

+ (void)refreshUserSession:(nonnull RogueUserObject *)user;

@end
