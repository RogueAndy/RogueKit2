//
//  RogueViewControllerTranstion.m
//  RogueKitDemo
//
//  Created by Rogue on 16/1/19.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RogueViewControllerTranstion.h"
#import "RTranstionCache.h"

#define RgBound [[UIScreen mainScreen] bounds]

@interface RogueViewControllerTranstion()

@property (nonatomic, assign) CGFloat duration;

@property (nonatomic, assign) RogueTranstionType transtionType;

@property (nonatomic, strong) NSArray *needAnimationClasses;

@end

@implementation RogueViewControllerTranstion

+ (instancetype)transtionWithAnimationType:(RogueTranstionType)type duration:(CGFloat)time viewControllerClasses:(NSArray *)classes {

    RogueViewControllerTranstion *transtion = [[RogueViewControllerTranstion alloc] init];
    transtion.duration = time;
    transtion.transtionType = type;
    transtion.needAnimationClasses = [classes copy];
    
    return transtion;

}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {

    if([RTranstionCache shareInstance].transtionDuration) {
     
        return [RTranstionCache shareInstance].transtionDuration;
    
    }
    return self.duration;

}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {

    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *container = [transitionContext containerView];
    
    if([RTranstionCache shareInstance].transtionType) {
    
        self.transtionType = [RTranstionCache shareInstance].transtionType;
    
    }
    
    switch (self.transtionType) {
        case RoguePushAlphaTranstion: {
            
            [container addSubview:toViewController.view];
        
            toViewController.view.frame = RgBound;
            toViewController.view.alpha = 0;
            
            [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                           delay:0
                                         options:UIViewKeyframeAnimationOptionLayoutSubviews
                                      animations:^{
                                          toViewController.view.alpha = 1;
                                      }
                                      completion:^(BOOL finished) {
                                          [transitionContext completeTransition:YES];
                                      }];

        }
            break;
            
        case RoguePushTopToBottomPresentTranstion: {
            
            [container addSubview:toViewController.view];
            
            toViewController.view.frame = CGRectMake(0, -CGRectGetHeight(RgBound), CGRectGetWidth(RgBound), CGRectGetHeight(RgBound));
            toViewController.view.alpha = 1;
            
            [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                           delay:0
                                         options:UIViewKeyframeAnimationOptionLayoutSubviews
                                      animations:^{
                                          toViewController.view.frame = RgBound;
                                      }
                                      completion:^(BOOL finished) {
                                          [transitionContext completeTransition:YES];
                                      }];
            
        }
            break;
            
        case RoguePushBottomToTopPresentTranstion: {
            
            [container addSubview:toViewController.view];
            
            toViewController.view.frame = CGRectMake(0, CGRectGetHeight(RgBound), CGRectGetWidth(RgBound), CGRectGetHeight(RgBound));
            toViewController.view.alpha = 1;
            
            [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                           delay:0
                                         options:UIViewKeyframeAnimationOptionLayoutSubviews
                                      animations:^{
                                          toViewController.view.frame = RgBound;
                                      }
                                      completion:^(BOOL finished) {
                                          [transitionContext completeTransition:YES];
                                      }];
            
            
        }
            break;
            
        case RoguePushLeftToRightTranstion: {
            
            [container addSubview:toViewController.view];
            
            toViewController.view.frame = CGRectMake(-CGRectGetWidth(RgBound), 0, CGRectGetWidth(RgBound), CGRectGetHeight(RgBound));
            toViewController.view.alpha = 1;
            
            [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                           delay:0
                                         options:UIViewKeyframeAnimationOptionLayoutSubviews
                                      animations:^{
                                          toViewController.view.frame = RgBound;
                                      }
                                      completion:^(BOOL finished) {
                                          [transitionContext completeTransition:YES];
                                      }];
            
        }
            break;
            
        case RoguePushRightToLeftTranstion: {
            
            [container addSubview:toViewController.view];
            
            toViewController.view.frame = CGRectMake(CGRectGetWidth(RgBound), 0, CGRectGetWidth(RgBound), CGRectGetHeight(RgBound));
            toViewController.view.alpha = 1;
            
            [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                           delay:0
                                         options:UIViewKeyframeAnimationOptionLayoutSubviews
                                      animations:^{
                                          toViewController.view.frame = RgBound;
                                      }
                                      completion:^(BOOL finished) {
                                          [transitionContext completeTransition:YES];
                                      }];
            
        }
            break;
            
        case RoguePushAlphaRightToLeftTranstion: {
            
            [container addSubview:toViewController.view];
            
            toViewController.view.frame = CGRectMake(CGRectGetWidth(RgBound), 0, CGRectGetWidth(RgBound), CGRectGetHeight(RgBound));
            toViewController.view.alpha = 0;
            
            [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                           delay:0
                                         options:UIViewKeyframeAnimationOptionLayoutSubviews
                                      animations:^{
                                          toViewController.view.frame = RgBound;
                                          toViewController.view.alpha = 1;
                                      }
                                      completion:^(BOOL finished) {
                                          [transitionContext completeTransition:YES];
                                      }];
            
        }
            break;
            
        case RoguePushAlphaLeftToRightTranstion: {
            
            [container addSubview:toViewController.view];
            
            toViewController.view.frame = CGRectMake(-CGRectGetWidth(RgBound), 0, CGRectGetWidth(RgBound), CGRectGetHeight(RgBound));
            toViewController.view.alpha = 0;
            
            [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                           delay:0
                                         options:UIViewKeyframeAnimationOptionLayoutSubviews
                                      animations:^{
                                          toViewController.view.frame = RgBound;
                                          toViewController.view.alpha = 1;
                                      }
                                      completion:^(BOOL finished) {
                                          [transitionContext completeTransition:YES];
                                      }];
            
        }
            break;
            
        case RoguePushAlphaTopToBottomPresentTranstion: {
            
            [container addSubview:toViewController.view];
            
            toViewController.view.frame = CGRectMake(0, -CGRectGetHeight(RgBound), CGRectGetWidth(RgBound), CGRectGetHeight(RgBound));
            toViewController.view.alpha = 0;
            
            [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                           delay:0
                                         options:UIViewKeyframeAnimationOptionLayoutSubviews
                                      animations:^{
                                          toViewController.view.frame = RgBound;
                                          toViewController.view.alpha = 1;
                                      }
                                      completion:^(BOOL finished) {
                                          [transitionContext completeTransition:YES];
                                      }];
            
        }
            break;
            
        case RoguePushAlphaBottomToTopPresentTranstion: {
            
            [container addSubview:toViewController.view];
            
            toViewController.view.frame = CGRectMake(0, CGRectGetHeight(RgBound), CGRectGetWidth(RgBound), CGRectGetHeight(RgBound));
            toViewController.view.alpha = 0;
            
            [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                           delay:0
                                         options:UIViewKeyframeAnimationOptionLayoutSubviews
                                      animations:^{
                                          toViewController.view.frame = RgBound;
                                          toViewController.view.alpha = 1;
                                      }
                                      completion:^(BOOL finished) {
                                          [transitionContext completeTransition:YES];
                                      }];
            
        }
            break;
            
        case RoguePopAlphaTranstion: {
            
            [container addSubview:toViewController.view];
            [container addSubview:fromViewController.view];
            
            fromViewController.view.frame = RgBound;
            fromViewController.view.alpha = 0;
            
            [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                           delay:0
                                         options:UIViewKeyframeAnimationOptionLayoutSubviews
                                      animations:^{
                                          fromViewController.view.alpha = 0;
                                      }
                                      completion:^(BOOL finished) {
                                          [transitionContext completeTransition:YES];
                                      }];
            
        }
            break;
            
        case RoguePopRightToLeftTranstion: {
            
            [container addSubview:toViewController.view];
            [container addSubview:fromViewController.view];
            
            fromViewController.view.frame = RgBound;
            fromViewController.view.alpha = 1;
            
            [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                           delay:0
                                         options:UIViewKeyframeAnimationOptionLayoutSubviews
                                      animations:^{
                                          
                                          fromViewController.view.frame = CGRectMake(-CGRectGetWidth(RgBound), 0, CGRectGetWidth(RgBound), CGRectGetHeight(RgBound));
                                          
                                      }
                                      completion:^(BOOL finished) {
                                          
                                          [transitionContext completeTransition:YES];
                                          
                                      }];
            
        }
            break;
            
        case RoguePopLeftToRightTranstion: {
            
            [container addSubview:toViewController.view];
            [container addSubview:fromViewController.view];
            
            fromViewController.view.frame = RgBound;
            fromViewController.view.alpha = 1;
            
            [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                           delay:0
                                         options:UIViewKeyframeAnimationOptionLayoutSubviews
                                      animations:^{
                                          
                                          fromViewController.view.frame = CGRectMake(CGRectGetWidth(RgBound), 0, CGRectGetWidth(RgBound), CGRectGetHeight(RgBound));
                                          
                                      }
                                      completion:^(BOOL finished) {
                                          
                                          [transitionContext completeTransition:YES];
                                          
                                      }];
            
        }
            break;
            
        case RoguePopTopToBottomPresentTranstion: {
            
            [container addSubview:toViewController.view];
            [container addSubview:fromViewController.view];
            
            fromViewController.view.frame = RgBound;
            fromViewController.view.alpha = 1;
            
            [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                           delay:0
                                         options:UIViewKeyframeAnimationOptionLayoutSubviews
                                      animations:^{
                                          
                                          fromViewController.view.frame = CGRectMake(0, CGRectGetHeight(RgBound), CGRectGetWidth(RgBound), CGRectGetHeight(RgBound));
                                          
                                      }
                                      completion:^(BOOL finished) {
                                          
                                          [transitionContext completeTransition:YES];
                                          
                                      }];
            
        }
            break;
            
        case RoguePopBottomToTopPresentTranstion: {
            
            [container addSubview:toViewController.view];
            [container addSubview:fromViewController.view];
            
            fromViewController.view.frame = RgBound;
            fromViewController.view.alpha = 1;
            
            [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                           delay:0
                                         options:UIViewKeyframeAnimationOptionLayoutSubviews
                                      animations:^{
                                          
                                          fromViewController.view.frame = CGRectMake(0, -CGRectGetHeight(RgBound), CGRectGetWidth(RgBound), CGRectGetHeight(RgBound));
                                          
                                      }
                                      completion:^(BOOL finished) {
                                          
                                          [transitionContext completeTransition:YES];
                                          
                                      }];
            
        }
            break;
            
        case RoguePopAlphaBottomToTopPresentTranstion: {
            
            [container addSubview:toViewController.view];
            [container addSubview:fromViewController.view];
            
            fromViewController.view.frame = RgBound;
            fromViewController.view.alpha = 1;
            
            [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                           delay:0
                                         options:UIViewKeyframeAnimationOptionLayoutSubviews
                                      animations:^{
                                          
                                          fromViewController.view.frame = CGRectMake(0, -CGRectGetHeight(RgBound), CGRectGetWidth(RgBound), CGRectGetHeight(RgBound));
                                          fromViewController.view.alpha = 0;
                                          
                                      }
                                      completion:^(BOOL finished) {
                                          
                                          [transitionContext completeTransition:YES];
                                          
                                      }];
            
        }
            break;
         
        case RoguePopAlphaTopToBottomPresentTranstion: {
            
            [container addSubview:toViewController.view];
            [container addSubview:fromViewController.view];
            
            fromViewController.view.frame = RgBound;
            fromViewController.view.alpha = 1;
            
            [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                           delay:0
                                         options:UIViewKeyframeAnimationOptionLayoutSubviews
                                      animations:^{
                                          
                                          fromViewController.view.frame = CGRectMake(0, CGRectGetHeight(RgBound), CGRectGetWidth(RgBound), CGRectGetHeight(RgBound));
                                          fromViewController.view.alpha = 0;
                                          
                                      }
                                      completion:^(BOOL finished) {
                                          
                                          [transitionContext completeTransition:YES];
                                          
                                      }];
            
        }
            break;
            
        case RoguePopAlphaLeftToRightTranstion: {
            
            [container addSubview:toViewController.view];
            [container addSubview:fromViewController.view];
            
            fromViewController.view.frame = RgBound;
            fromViewController.view.alpha = 1;
            
            [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                           delay:0
                                         options:UIViewKeyframeAnimationOptionLayoutSubviews
                                      animations:^{
                                          
                                          fromViewController.view.frame = CGRectMake(CGRectGetWidth(RgBound), 0, CGRectGetWidth(RgBound), CGRectGetHeight(RgBound));
                                          fromViewController.view.alpha = 0;
                                          
                                      }
                                      completion:^(BOOL finished) {
                                          
                                          [transitionContext completeTransition:YES];
                                          
                                      }];
            
        }
            break;
            
        case RoguePopAlphaRightToLeftTranstion: {
            
            [container addSubview:toViewController.view];
            [container addSubview:fromViewController.view];
            
            fromViewController.view.frame = RgBound;
            fromViewController.view.alpha = 1;
            
            [UIView animateKeyframesWithDuration:[self transitionDuration:transitionContext]
                                           delay:0
                                         options:UIViewKeyframeAnimationOptionLayoutSubviews
                                      animations:^{
                                          
                                          fromViewController.view.frame = CGRectMake(-CGRectGetWidth(RgBound), 0, CGRectGetWidth(RgBound), CGRectGetHeight(RgBound));
                                          fromViewController.view.alpha = 0;
                                          
                                      }
                                      completion:^(BOOL finished) {
                                          
                                          [transitionContext completeTransition:YES];
                                          
                                      }];
            
        }
            break;
            
    }

}

@end


























@implementation UINavigationController (RogueNavigationController)

#pragma mark - pushViewController

- (void)pushAlpha_pushViewController:(UIViewController *)viewController animated:(BOOL)animate {

    [RTranstionCache shareInstance].transtionType = RoguePushAlphaTranstion;
    [RTranstionCache shareInstance].transtionDuration = 0.25;
    [self pushViewController:viewController animated:animate];

}

- (void)pushTopToBottomPresent_pushViewController:(UIViewController *)viewController animated:(BOOL)animate {

    [RTranstionCache shareInstance].transtionType = RoguePushTopToBottomPresentTranstion;
    [RTranstionCache shareInstance].transtionDuration = 0.25;
    [self pushViewController:viewController animated:animate];

}

- (void)pushBottomToTopPresent_pushViewController:(UIViewController *)viewController animated:(BOOL)animate {

    [RTranstionCache shareInstance].transtionType = RoguePushBottomToTopPresentTranstion;
    [RTranstionCache shareInstance].transtionDuration = 0.25;
    [self pushViewController:viewController animated:animate];
    
}

- (void)pushLeftToRight_pushViewController:(UIViewController *)viewController animated:(BOOL)animate {

    [RTranstionCache shareInstance].transtionType = RoguePushLeftToRightTranstion;
    [RTranstionCache shareInstance].transtionDuration = 0.25;
    [self pushViewController:viewController animated:animate];

}

- (void)pushRightToLeft_pushViewController:(UIViewController *)viewController animated:(BOOL)animate {

    [RTranstionCache shareInstance].transtionType = RoguePushRightToLeftTranstion;
    [RTranstionCache shareInstance].transtionDuration = 0.25;
    [self pushViewController:viewController animated:animate];

}

- (void)pushAlphaTopToBottomPresent_pushViewController:(UIViewController *)viewController animated:(BOOL)animate {

    [RTranstionCache shareInstance].transtionType = RoguePushAlphaTopToBottomPresentTranstion;
    [RTranstionCache shareInstance].transtionDuration = 0.25;
    [self pushViewController:viewController animated:animate];

}

- (void)pushAlphaBottomToTopPresent_pushViewController:(UIViewController *)viewController animated:(BOOL)animate {

    [RTranstionCache shareInstance].transtionType = RoguePushAlphaBottomToTopPresentTranstion;
    [RTranstionCache shareInstance].transtionDuration = 0.25;
    [self pushViewController:viewController animated:animate];

}

- (void)pushAlphaLeftToRight_pushViewController:(UIViewController *)viewController animated:(BOOL)animate {

    [RTranstionCache shareInstance].transtionType = RoguePushAlphaLeftToRightTranstion;
    [RTranstionCache shareInstance].transtionDuration = 0.25;
    [self pushViewController:viewController animated:animate];

}

- (void)pushAlphaRightToLeft_pushViewController:(UIViewController *)viewController animated:(BOOL)animate {

    [RTranstionCache shareInstance].transtionType = RoguePushAlphaRightToLeftTranstion;
    [RTranstionCache shareInstance].transtionDuration = 0.25;
    [self pushViewController:viewController animated:animate];

}

#pragma mark - popViewController

- (void)popAlpha_popViewControllerAnimated:(BOOL)animate {

    [RTranstionCache shareInstance].transtionType = RoguePopAlphaTranstion;
    [RTranstionCache shareInstance].transtionDuration = 0.25;
    [self popViewControllerAnimated:animate];

}

- (void)popBottomToTopPresent_popViewControllerAnimated:(BOOL)animate {

    [RTranstionCache shareInstance].transtionType = RoguePopBottomToTopPresentTranstion;
    [RTranstionCache shareInstance].transtionDuration = 0.25;
    [self popViewControllerAnimated:animate];

}

- (void)popTopToBottomPresent_popViewControllerAnimated:(BOOL)animate {

    [RTranstionCache shareInstance].transtionType = RoguePopTopToBottomPresentTranstion;
    [RTranstionCache shareInstance].transtionDuration = 0.25;
    [self popViewControllerAnimated:animate];

}

- (void)popRightToLeft_popViewControllerAnimated:(BOOL)animate {

    [RTranstionCache shareInstance].transtionType = RoguePopRightToLeftTranstion;
    [RTranstionCache shareInstance].transtionDuration = 0.25;
    [self popViewControllerAnimated:animate];

}

- (void)popLeftToRight_popViewControllerAnimated:(BOOL)animate {

    [RTranstionCache shareInstance].transtionType = RoguePopLeftToRightTranstion;
    [RTranstionCache shareInstance].transtionDuration = 0.25;
    [self popViewControllerAnimated:animate];

}

- (void)popAlphaBottomToTopPresent_popViewControllerAnimated:(BOOL)animate {

    [RTranstionCache shareInstance].transtionType = RoguePopAlphaBottomToTopPresentTranstion;
    [RTranstionCache shareInstance].transtionDuration = 0.25;
    [self popViewControllerAnimated:animate];

}

- (void)popAlphaTopToBottomPresent_popViewControllerAnimated:(BOOL)animate {

    [RTranstionCache shareInstance].transtionType = RoguePopAlphaTopToBottomPresentTranstion;
    [RTranstionCache shareInstance].transtionDuration = 0.25;
    [self popViewControllerAnimated:animate];

}

- (void)popAlphaRightToLeft_popViewControllerAnimated:(BOOL)animate {

    [RTranstionCache shareInstance].transtionType = RoguePopAlphaRightToLeftTranstion;
    [RTranstionCache shareInstance].transtionDuration = 0.25;
    [self popViewControllerAnimated:animate];

}

- (void)popAlphaLeftToRight_popViewControllerAnimated:(BOOL)animate {

    [RTranstionCache shareInstance].transtionType = RoguePopAlphaLeftToRightTranstion;
    [RTranstionCache shareInstance].transtionDuration = 0.25;
    [self popViewControllerAnimated:animate];

}

@end
