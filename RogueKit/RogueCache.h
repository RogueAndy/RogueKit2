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
 *  设置内存缓存，缓存类型必须继承于 RogueUserObject 类型
 *
 *  @param user 用户缓存信息
 */

+ (void)setSessionValues:(nullable RogueUserObject *)user;

/**
 *  取出内存缓存
 *
 *  @return 取出缓存值
 */

+ (nullable RogueUserObject *)getSessionValues;

/**
 *  更新用户信息，从而促发通知效果,不使用系统的 postNotificationName:(NSString *)aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo 方法，因为该方法里已经覆盖了系统方法
 *
 *  @param user 用户信息
 */

+ (void)refreshUserSession:(nullable RogueUserObject *)user;

/**
 *  调用该方法时，回调函数里书写 [[NSNotificationCenter defaultCenter] addObserver:weakSelf selector:@selector(changeOther:) name:key object:nil] 响应通知
 *
 *  @param response 回到函数
 */

+ (void)notificationResponseWithBlock:(nonnull void (^)(NSString * _Nonnull key))response;

@end
