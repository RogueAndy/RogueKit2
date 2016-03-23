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
    [defaults setObject:values forKey:key];
    [defaults synchronize];
    
}

- (nonnull id)privateObjectForKey:(nonnull NSString *)key {

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:key];

}

#pragma mark - 通知消息机制

+ (void)refreshUserSession:(RogueUserObject *)user {

    [self setSessionValues:user];
    [[NSNotificationCenter defaultCenter] postNotificationName:RogueCacheGlobalUpdateUserNotification object:[self shareInstance] userInfo:@{RogueCacheUserSessionKey: [self getSessionValues]}];

}

@end
