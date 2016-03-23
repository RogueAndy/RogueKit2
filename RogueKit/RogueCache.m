//
//  RogueCache.m
//  RogueKitDemo
//
//  Created by Rogue on 16/1/19.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RogueCache.h"

static RogueCache *rogueCache = nil;

NSString *const RogueCacheGlobalUpdateUserNotification = @"RogueCacheGlobalUpdateUserNotification";
NSString *const RogueCacheUserSessionKey = @"RogueCacheUserSessionKey";

@interface RogueCache()

@end

@implementation RogueCache

#pragma mark - 设置全局变量

+ (nonnull instancetype)shareInstance {

    static dispatch_once_t once;
    dispatch_once(&once, ^{
        rogueCache = [[self alloc] init];
    });
    
    return rogueCache;

}

#pragma mark - 设置内存缓存

+ (void)setSessionValues:(RogueUserObject *)user {

    [[self shareInstance] privateSetObject:user forKey:RogueCacheUserSessionKey];

}

+ (RogueUserObject *)getSessionValues {

    return [[self shareInstance] privateObjectForKey:RogueCacheUserSessionKey];

}

- (void)privateSetObject:(nullable id)values forKey:(nonnull NSString *)key {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:(values ? [NSKeyedArchiver archivedDataWithRootObject:values] : nil) forKey:key];
    [defaults synchronize];
    
}

- (nonnull id)privateObjectForKey:(nonnull NSString *)key {

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    RogueUserObject *user = [NSKeyedUnarchiver unarchiveObjectWithData:[defaults objectForKey:key]];
    return user;

}


#pragma mark - 更新session的缓存，促发通知消息机制

+ (void)refreshUserSession:(RogueUserObject *)user {

    [self setSessionValues:user];
    [[NSNotificationCenter defaultCenter] postNotificationName:RogueCacheGlobalUpdateUserNotification object:[self shareInstance] userInfo:([self getSessionValues] ? @{RogueCacheUserSessionKey: [self getSessionValues]} : nil)];

}

+ (void)notificationResponseWithBlock:(void (^)(NSString * _Nonnull key))response {

    response(RogueCacheGlobalUpdateUserNotification);

}



@end
