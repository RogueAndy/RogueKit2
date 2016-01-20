//
//  RogueViewControllerTranstion.h
//  RogueKitDemo
//
//  Created by Rogue on 16/1/19.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

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
