//
//  RTranstionCache.h
//  RogueKitDemo
//
//  Created by rogue on 2017/5/5.
//  Copyright © 2017年 Rogue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "RogueViewControllerTranstion.h"

@interface RTranstionCache : NSObject

@property (nonatomic, assign) CGFloat transtionDuration;

@property (nonatomic, assign) RogueTranstionType transtionType;

/**
 *  单例模式
 *
 *  @return 单例全局变量
 */

+ (nonnull instancetype)shareInstance;

@end
