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

@interface RogueCache : NSObject

@property (nonatomic, assign) CGFloat transtionDuration;

@property (nonatomic, assign) RogueTranstionType transtionType;

@property (nonatomic, assign) BOOL isLogin;

+ (instancetype)shareInstance;


@end
