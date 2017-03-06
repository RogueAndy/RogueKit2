//
//  RogueViewControllerTranstion.h
//  RogueKitDemo
//
//  Created by Rogue on 16/1/19.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 枚举类型

 - RoguePushAlphaTranstion: 和原本的方式相同
 - RoguePushTopToBottomPresentTranstion: 上到下过度
 - RoguePushBottomToTopPresentTranstion: 下到上过度
 - RoguePushLeftToRightTranstion: 左到右过度
 - RoguePushRightToLeftTranstion: 右到左过度
 - RoguePushAlphaTopToBottomPresentTranstion: 渐影上到下过度
 - RoguePushAlphaBottomToTopPresentTranstion: 渐影下到上过度
 - RoguePushAlphaLeftToRightTranstion: 渐影左到右过度
 - RoguePushAlphaRightToLeftTranstion: 渐影右到左过度
 - RoguePopAlphaTranstion: 渐影过度
 - RoguePopBottomToTopPresentTranstion: POP下到上过度
 - RoguePopTopToBottomPresentTranstion: POP上到下过度
 - RoguePopRightToLeftTranstion: POP右到左过度
 - RoguePopLeftToRightTranstion: POP左到右过度
 - RoguePopAlphaBottomToTopPresentTranstion: POP渐影下到上过度
 - RoguePopAlphaTopToBottomPresentTranstion: POP渐影上到下过度
 - RoguePopAlphaRightToLeftTranstion: POP渐影右到左过度
 - RoguePopAlphaLeftToRightTranstion: POP渐影左到右过度
 */
typedef NS_ENUM(NSInteger, RogueTranstionType)
{

    RoguePushAlphaTranstion                   = 0,
    RoguePushTopToBottomPresentTranstion      = 1,
    RoguePushBottomToTopPresentTranstion      = 2,
    RoguePushLeftToRightTranstion             = 3,
    RoguePushRightToLeftTranstion             = 4,
    RoguePushAlphaTopToBottomPresentTranstion = 5,
    RoguePushAlphaBottomToTopPresentTranstion = 6,
    RoguePushAlphaLeftToRightTranstion        = 7,
    RoguePushAlphaRightToLeftTranstion        = 8,
    RoguePopAlphaTranstion                    = 9,
    RoguePopBottomToTopPresentTranstion       = 10,
    RoguePopTopToBottomPresentTranstion       = 11,
    RoguePopRightToLeftTranstion              = 12,
    RoguePopLeftToRightTranstion              = 13,
    RoguePopAlphaBottomToTopPresentTranstion  = 14,
    RoguePopAlphaTopToBottomPresentTranstion  = 15,
    RoguePopAlphaRightToLeftTranstion         = 16,
    RoguePopAlphaLeftToRightTranstion         = 17
    

};

@interface RogueViewControllerTranstion : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)transtionWithAnimationType:(RogueTranstionType)type duration:(CGFloat)time viewControllerClasses:(NSArray *)classes;

@end
