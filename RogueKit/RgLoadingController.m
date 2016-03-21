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
    RgLoadingController *loadingVC = [[self alloc] initWithHUD:hud withTitle:nil];
    [loadingVC showLoadingActivityView:MBProgressHUDModeIndeterminate];
}

#pragma mark - 显示菊花并且提示语

+ (void)showLoadingActivityViewOn:(UIViewController *)onViewController withTitle:(NSString *)title {
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
    RgLoadingController *loadingVC = [[self alloc] initWithHUD:hud withTitle:title];
    [loadingVC showLoadingActivityView:MBProgressHUDModeIndeterminate];
}

#pragma mark - 显示菊花之后自动消失，一般附带提示语，并且没有哦菊花字样

+ (void)showLoadingSoonDisplayActivityViewOn:(UIViewController *)onViewController withTitle:(NSString *)title withAfter:(CGFloat)after withComplete:(void (^)(void))completeBlock {
    
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
    RgLoadingController *loadingVC = [[self alloc] initWithHUD:hud withTitle:title];
    [loadingVC showLoadingActivityView:MBProgressHUDModeText];
    
    
    [loadingVC hideLoadingActivityView:after withComplete:completeBlock];
    
}

/***********************************************  以上方法废弃，默认使用菊花  *******************************************************/











/***********************************************  以下最新 api方法  *******************************************************/



+ (void)showLoadingActivityViewOn:(UIViewController *)onViewController hudType:(RgLoadingType)type {

    switch (type) {
        case RgLoadingGIF:
        {
        
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
            RgLoadingController *loadingVC = [[self alloc] initWithHUD:hud withTitle:nil];
            UIImageView *gifImage = [UIImageView initWithGIFName:@"RgRefresh"];
            gifImage.frame = CGRectMake(0, 0, 90, 90);
            hud.minSize = gifImage.bounds.size;
            gifImage.center = hud.center;
            [hud addSubview:gifImage];
            [loadingVC showLoadingActivityView:MBProgressHUDModeCustomView];
            
        }
            break;
            
        default:
        {
            
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
            RgLoadingController *loadingVC = [[self alloc] initWithHUD:hud withTitle:nil];
            [loadingVC showLoadingActivityView:MBProgressHUDModeIndeterminate];
            
        }
            break;
    }

}

+ (void)showLoadingActivityViewOn:(UIViewController *)onViewController hudType:(RgLoadingType)type titleOrGif:(NSString *)parameter {

    switch (type) {
        case RgLoadingGIF:
        {
            
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
            RgLoadingController *loadingVC = [[self alloc] initWithHUD:hud withTitle:nil];
            UIImageView *gifImage = [UIImageView initWithGIFName:(parameter == nil ? @"RgRefresh" : parameter)];
            gifImage.frame = CGRectMake(0, 0, 90, 90);
            gifImage.center = hud.center;
            hud.minSize = gifImage.bounds.size;
            [hud addSubview:gifImage];
            [loadingVC showLoadingActivityView:MBProgressHUDModeCustomView];
        
        }
            break;
            
        default:
        {
        
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
            RgLoadingController *loadingVC = [[self alloc] initWithHUD:hud withTitle:parameter];
            [loadingVC showLoadingActivityView:MBProgressHUDModeIndeterminate];
        
        }
            break;
    }

}

+ (void)showLoadingSoonDisplayActivityViewOn:(UIViewController *)onViewController hudType:(RgLoadingType)type titleOrGif:(NSString *)parameter withAfter:(CGFloat)after withComplete:(void (^)(void))completeBlock {

    switch (type) {
        case RgLoadingGIF:
        {
        
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
            RgLoadingController *loadingVC = [[self alloc] initWithHUD:hud withTitle:nil];
            UIImageView *gifImage = [UIImageView initWithGIFName:(parameter == nil ? @"RgRefresh" : parameter)];
            gifImage.frame = CGRectMake(0, 0, 90, 90);
            hud.minSize = gifImage.bounds.size;
            gifImage.center = hud.center;
            [hud addSubview:gifImage];
            [loadingVC showLoadingActivityView:MBProgressHUDModeCustomView];
            
            [loadingVC hideLoadingActivityView:after withComplete:completeBlock];
        
        }
            break;
            
        default:
        {
            
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
            RgLoadingController *loadingVC = [[self alloc] initWithHUD:hud withTitle:parameter];
            [loadingVC showLoadingActivityView:MBProgressHUDModeText];
            
            [loadingVC hideLoadingActivityView:after withComplete:completeBlock];
        
        }
            break;
    }
    
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
    
    self.hud.labelText = title;
}

- (void)showLoadingActivityView:(MBProgressHUDMode)mode{
    [_hud setMode:mode];
    [self addToAllLoadingActivityViewControllers];
    [_hud show:YES];
}


- (void)hideLoadingActivityView:(CGFloat)after withComplete:(void(^)(void))completeBlock {
    [_hud setRemoveFromSuperViewOnHide:YES];
    [_hud setMinShowTime:0.3];
    __weak RgLoadingController *weakSelf = self;
    [_hud setCompletionBlock:^{
        [weakSelf removeToAllLoadingActivityViewControllers];
        if(completeBlock){completeBlock();}
    }];
    [_hud hide:YES afterDelay:after];
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
}

@end
