//
//  RogueCache.m
//  RogueKitDemo
//
//  Created by Rogue on 16/1/19.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RogueCache.h"

static RogueCache *rogueCache = nil;

@implementation RogueCache

+ (instancetype)shareInstance {

    static dispatch_once_t once;
    dispatch_once(&once, ^{
        rogueCache = [[self alloc] init];
    });
    
    return rogueCache;

}

@end
