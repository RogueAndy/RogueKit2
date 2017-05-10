//
//  RTranstionCache.m
//  RogueKitDemo
//
//  Created by rogue on 2017/5/5.
//  Copyright © 2017年 Rogue. All rights reserved.
//

#import "RTranstionCache.h"

static RTranstionCache *rTranstionCache = nil;

@interface RTranstionCache()

@end

@implementation RTranstionCache

#pragma mark - 设置全局变量

+ (nonnull instancetype)shareInstance {
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        rTranstionCache = [[self alloc] init];
    });
    
    return rTranstionCache;
    
}

@end
