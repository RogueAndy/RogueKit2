//
//  RgLoadingController.h
//  RogueKitDemo
//
//  Created by Rogue on 15/12/17.
//  Copyright © 2015年 Rogue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RgLoadingController : UIViewController

/**
 *  显示菊花
 *
 *  @param onViewController 某个控制器
 */

+ (void)showLoadingActivityViewOn:(UIViewController *)onViewController;

/**
 *  隐藏句话
 *
 *  @param onViewController 某个控制器
 */

+ (void)hideLoadingActivityViewOn:(UIViewController *)onViewController;

/**
 *  用户提示
 *
 *  @param onViewController 显示在某个控制器上
 *  @param title            显示提示语
 */

+ (void)showLoadingActivityViewOn:(UIViewController *)onViewController withTitle:(NSString *)title;

/**
 *  显示菊花后隔段时间自动隐藏
 *
 *  @param onViewController 控制器
 *  @param title            提示语
 *  @param after            开始到自动隐藏前的时间
 *  @param completeBlock    隐藏完毕后执行的动作
 */

+ (void)showLoadingSoonDisplayActivityViewOn:(UIViewController *)onViewController withTitle:(NSString *)title withAfter:(CGFloat)after withComplete:(void(^)(void))completeBlock;

@end
