//
//  RgLoadingController.m
//  RogueKitDemo
//
//  Created by Rogue on 15/12/17.
//  Copyright © 2015年 Rogue. All rights reserved.
//


#import "RgLoadingController.h"
#import "UIImageView+RgGIF.h"

static NSMutableArray *ly_pAllLoadingActivityViewControllers = nil;
@interface RgLoadingController ()

@property (nonatomic, strong) MBProgressHUD *hud;

- (void)loadContentViewWithTitle:(NSString *)title;

@end

@implementation RgLoadingController

#pragma mark - 显示菊花

+ (void)showLoadingActivityViewOn:(UIViewController *)onViewController {
    
    [self loadingType:RgLoadingDefault
                after:0
                title:nil
          repeatTimes:0
           imageNames:nil
         gifImageName:nil
              hudView:[self showLoadingViewOnViewController:onViewController]
         withComplete:nil];
    
}

#pragma mark - 显示菊花并且提示语

+ (void)showLoadingActivityViewOn:(UIViewController *)onViewController withTitle:(NSString *)title {
    
    [self loadingType:RgLoadingDefault
                after:0
                title:title
          repeatTimes:0
           imageNames:nil
         gifImageName:nil
              hudView:[self showLoadingViewOnViewController:onViewController]
         withComplete:nil];

}

#pragma mark - 显示菊花之后自动消失，一般附带提示语，并且没有哦菊花字样

+ (void)showLoadingSoonDisplayActivityViewOn:(UIViewController *)onViewController withTitle:(NSString *)title withAfter:(CGFloat)after withComplete:(void (^)(void))completeBlock {

    [self loadingType:RgLoadingDefault
                after:after
                title:title
          repeatTimes:0
           imageNames:nil
         gifImageName:nil
              hudView:[self showLoadingViewOnViewController:onViewController]
         withComplete:completeBlock];
    
}

/***********************************************  以上方法废弃，默认使用菊花  *******************************************************/











/***********************************************  以下最新 api方法  *******************************************************/



+ (void)showLoadingActivityViewOn:(UIViewController *)onViewController hudType:(RgLoadingType)type {
    
    [self loadingType:type
                after:0
                title:nil
          repeatTimes:0
           imageNames:nil
         gifImageName:nil
              hudView:[self showLoadingViewOnViewController:onViewController]
         withComplete:nil];

}

+ (void)showLoadingActivityViewOn:(UIViewController *)onViewController hudType:(RgLoadingType)type titleOrGif:(NSString *)parameter {

    [self loadingType:type
                after:0
                title:parameter
          repeatTimes:0
           imageNames:nil
         gifImageName:parameter
              hudView:[self showLoadingViewOnViewController:onViewController]
         withComplete:nil];

}

+ (void)showLoadingSoonDisplayActivityViewOn:(UIViewController *)onViewController hudType:(RgLoadingType)type titleOrGif:(NSString *)parameter withAfter:(CGFloat)after withComplete:(void (^)(void))completeBlock {

    [self loadingType:type
                after:after
                title:parameter
          repeatTimes:0
           imageNames:nil
         gifImageName:parameter
              hudView:[self showLoadingViewOnViewController:onViewController]
         withComplete:completeBlock];

}

#pragma mark - 显示菊花

+ (void)showLoadingActivityView {
    
    __block MBProgressHUD *hud;
    [[[[UIApplication sharedApplication] keyWindow] subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[MBProgressHUD class]]) {
            hud = (MBProgressHUD *)obj;
        }
    }];
    if (hud == nil) {
        hud = [[MBProgressHUD alloc] initWithView:[[UIApplication sharedApplication] keyWindow]];
        [[[UIApplication sharedApplication] keyWindow] addSubview:hud];
    }
    RgLoadingController *loadingVC = [[self alloc] initWithHUD:hud withTitle:nil];
    [loadingVC showLoadingActivityView:MBProgressHUDModeIndeterminate];
    
}

#pragma mark - 在某个控制器上隐藏菊花

+ (void)hideLoadingActivityViewOn:(UIViewController *)onViewController {
    __block MBProgressHUD *hud;
    [onViewController.view.subviews enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[MBProgressHUD class]]) {
            hud = (MBProgressHUD *)obj;
        }
    }];
    if (hud != nil) {
        [ly_pAllLoadingActivityViewControllers enumerateObjectsUsingBlock:^(RgLoadingController *obj, NSUInteger idx, BOOL *stop) {
            if (hud.customView == obj.hud.customView) {
                [obj hideLoadingActivityView:0 withComplete:nil];
            }
        }];
    }
}

#pragma mark - 隐藏菊花

+ (void)hideLoadingActivityView {
    
    __block MBProgressHUD *hud;
    [[[[UIApplication sharedApplication] keyWindow] subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[MBProgressHUD class]]) {
            hud = (MBProgressHUD *)obj;
        }
    }];
    if (hud != nil) {
        [ly_pAllLoadingActivityViewControllers enumerateObjectsUsingBlock:^(RgLoadingController *obj, NSUInteger idx, BOOL *stop) {
            if (hud.customView == obj.hud.customView) {
                [obj hideLoadingActivityView:0 withComplete:nil];
            }
        }];
    }
    
}

#pragma mark - 使用图片数组生成帧动画

+ (void)showLoadingActivityViewOn:(UIViewController *)onViewController repeatTimer:(NSTimeInterval)timer animationImageNames:(NSArray *)imageNames {

    [self loadingType:RgLoadingImageArrays
                after:0
                title:nil
          repeatTimes:timer
           imageNames:imageNames
         gifImageName:nil
              hudView:[self showLoadingViewOnViewController:onViewController]
         withComplete:nil];
    
}

+ (void)showLoadingSoonDisplayActivityViewOn:(UIViewController *)onViewController repeatTimer:(NSTimeInterval)timer animationImageNames:(NSArray *)imageNames withAfter:(CGFloat)after withComplete:(void(^)(void))completeBlock {
    
    [self loadingType:RgLoadingImageArrays
                after:after
                title:nil
          repeatTimes:timer
           imageNames:imageNames
         gifImageName:nil
              hudView:[self showLoadingViewOnViewController:onViewController]
         withComplete:completeBlock];
    
}

#pragma mark - 循环控制器，查找当前界面上所有的用户提示框，如果有，则删除之后重新添加，如果没得，则新建

+ (MBProgressHUD *)showLoadingViewOnViewController:(UIViewController *)onViewController {

    __block MBProgressHUD *hud;
    [onViewController.view.subviews enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[MBProgressHUD class]]) {
            hud = (MBProgressHUD *)obj;
        }
    }];
    if (hud == nil) {
        hud = [[MBProgressHUD alloc] initWithView:onViewController.view];
        [onViewController.view addSubview:hud];
    }
    
    return hud;

}

#pragma mark - 公用底层方法

+ (void)loadingType:(RgLoadingType)type after:(CGFloat)after title:(NSString *)title repeatTimes:(NSTimeInterval)repeatTimer imageNames:(NSArray *)imageNames gifImageName:(NSString *)parameter hudView:(MBProgressHUD *)hud withComplete:(void(^)(void))completeBlock {

    RgLoadingController *loadingVC = [[self alloc] initWithHUD:hud withTitle:title];
    
    switch (type) {
        case RgLoadingDefault: {
            
            [loadingVC showLoadingActivityView:MBProgressHUDModeIndeterminate];
            
            break;
        }
        case RgLoadingGIF: {
            
            UIImageView *gifImage = [UIImageView initWithGIFName:(parameter == nil ? @"RgRefresh" : parameter)];
            gifImage.frame = CGRectMake(0, 0, 90, 90);
            hud.minSize = gifImage.bounds.size;
            gifImage.center = hud.center;
            [hud addSubview:gifImage];
            [loadingVC showLoadingActivityView:MBProgressHUDModeCustomView];
            
            break;
        }
        case RgLoadingImageArrays: {
            
            UIImageView *gifImage = [[UIImageView alloc] init];
            NSMutableArray *images = [[NSMutableArray alloc] init];
            [imageNames enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [images addObject:[UIImage imageNamed:obj]];
            }];
            gifImage.animationImages = [images copy];
            gifImage.animationRepeatCount = 0;
            gifImage.animationDuration = repeatTimer;
            gifImage.contentMode = UIViewContentModeScaleAspectFill;
            gifImage.frame = CGRectMake(0, 0, 31, 31);
            hud.minSize = CGSizeMake(80, 80);
            gifImage.center = hud.center;
            [gifImage startAnimating];
            [hud addSubview:gifImage];
            [loadingVC showLoadingActivityView:MBProgressHUDModeCustomView imageView:gifImage];
            
            break;
        }
    }
    
    if(after == 0) {
    
        return;
        
    }
    
    switch (type) {
        case RgLoadingDefault: {
            [loadingVC hideLoadingActivityView:after withComplete:completeBlock];
            break;
        }
        case RgLoadingGIF: {
            [loadingVC hideLoadingActivityView:after withComplete:completeBlock];
            break;
        }
        case RgLoadingImageArrays: {
            [loadingVC hideLoadingActivityView:after withComplete:completeBlock];
            break;
        }
    }

}


/***********************************************  动态方法  *******************************************************/

- (instancetype)initWithHUD:(MBProgressHUD *)hud withTitle:(NSString *)title {
    self = [super init];
    if (self) {
        self.hud = hud;
        [self loadContentViewWithTitle:title];
    }
    return self;
}

- (void)loadContentViewWithTitle:(NSString *)title {
    
    CGRect rect = CGRectMake(0, 0, 48, 15);
    if (title != nil) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        [label setFont:[UIFont systemFontOfSize:12]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [label setText:title];
        [label sizeToFit];
        rect.size.height += 20;
        rect.size.width = label.frame.size.width + 20;
        rect.size.width = rect.size.width > 48 ? rect.size.width : 48;
    }
    
    if(!title) {return;}
    self.hud.label.text = title;
}

- (void)showLoadingActivityView:(MBProgressHUDMode)mode {
    
    if([_hud respondsToSelector:@selector(showAnimated:)]) {
    
        NSLog(@"ddd");
    
    }
    
    return;
    
    [_hud setMode:mode];
    [self addToAllLoadingActivityViewControllers];
    [_hud showAnimated:YES];
    
}

- (void)showLoadingActivityView:(MBProgressHUDMode)mode imageView:(UIImageView *)imageView {

    [_hud setMode:mode];
    [self addToAllLoadingActivityViewControllers];
    [_hud showAnimated:YES];
    [imageView startAnimating];

}


- (void)hideLoadingActivityView:(CGFloat)after withComplete:(void(^)(void))completeBlock {
    
    [_hud setRemoveFromSuperViewOnHide:YES];
    [_hud setMinShowTime:0.3];
    __weak RgLoadingController *weakSelf = self;
    [_hud setCompletionBlock:^{
        [weakSelf removeToAllLoadingActivityViewControllers];
        if(completeBlock){completeBlock();}
    }];
    [_hud hideAnimated:YES afterDelay:after];

}

- (void)addToAllLoadingActivityViewControllers {
    
    ly_pAllLoadingActivityViewControllers = ly_pAllLoadingActivityViewControllers ?: [NSMutableArray array];
    [ly_pAllLoadingActivityViewControllers addObject:self];
    
}

- (void)removeToAllLoadingActivityViewControllers {
   
    ly_pAllLoadingActivityViewControllers = ly_pAllLoadingActivityViewControllers ?: [NSMutableArray array];
    [ly_pAllLoadingActivityViewControllers removeObject:self];

}

- (void)dealloc {
    
    NSLog(@"------- RgLoadingController dealloc -------");

}

@end
