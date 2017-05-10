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



@interface UINavigationController (RogueNavigationController)

- (void)pushAlpha_pushViewController:(UIViewController *)viewController animated:(BOOL)animate;
- (void)pushTopToBottomPresent_pushViewController:(UIViewController *)viewController animated:(BOOL)animate;
- (void)pushBottomToTopPresent_pushViewController:(UIViewController *)viewController animated:(BOOL)animate;
- (void)pushLeftToRight_pushViewController:(UIViewController *)viewController animated:(BOOL)animate;
- (void)pushRightToLeft_pushViewController:(UIViewController *)viewController animated:(BOOL)animate;
- (void)pushAlphaTopToBottomPresent_pushViewController:(UIViewController *)viewController animated:(BOOL)animate;
- (void)pushAlphaBottomToTopPresent_pushViewController:(UIViewController *)viewController animated:(BOOL)animate;
- (void)pushAlphaLeftToRight_pushViewController:(UIViewController *)viewController animated:(BOOL)animate;
- (void)pushAlphaRightToLeft_pushViewController:(UIViewController *)viewController animated:(BOOL)animate;
- (void)popAlpha_popViewControllerAnimated:(BOOL)animate;
- (void)popBottomToTopPresent_popViewControllerAnimated:(BOOL)animate;
- (void)popTopToBottomPresent_popViewControllerAnimated:(BOOL)animate;
- (void)popRightToLeft_popViewControllerAnimated:(BOOL)animate;
- (void)popLeftToRight_popViewControllerAnimated:(BOOL)animate;
- (void)popAlphaBottomToTopPresent_popViewControllerAnimated:(BOOL)animate;
- (void)popAlphaTopToBottomPresent_popViewControllerAnimated:(BOOL)animate;
- (void)popAlphaRightToLeft_popViewControllerAnimated:(BOOL)animate;
- (void)popAlphaLeftToRight_popViewControllerAnimated:(BOOL)animate;

@end
