//
//  RgMBViewController.m
//  RogueKitDemo
//
//  Created by Rogue on 16/3/21.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgMBViewController.h"
#import "UIImageView+RgGIF.h"
#import "RgLoadingController.h"
#import "RogueCache.h"
#import "RgUserObject.h"

@interface RgMBViewController ()

@end

@implementation RgMBViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [RgLoadingController showLoadingActivityViewOn:self hudType:RgLoadingGIF titleOrGif:@"RgRefresh"];
    
    NSString *hanzi = @"中国大地";
    NSMutableString *ms = [[NSMutableString alloc] initWithString:hanzi];
    if(CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformMandarinLatin, NO)) {
        NSLog(@"%@", ms);
    }
    if(CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformStripDiacritics, NO)) {
        NSLog(@"%@", ms);
    }
    
    UIButton *add = [UIButton buttonWithType:UIButtonTypeSystem];
    [add addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchUpInside];
    add.frame = CGRectMake(20, 100, 80, 40);
    add.backgroundColor = [UIColor redColor];
    [self.view addSubview:add];
    
    UIButton *remove = [UIButton buttonWithType:UIButtonTypeSystem];
    [remove addTarget:self action:@selector(removeAction) forControlEvents:UIControlEventTouchUpInside];
    remove.frame = CGRectMake(180, 100, 80, 40);
    remove.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:remove];
    
    [self addNotification];

}

- (void)addAction {

    RgUserObject *dd = [RgUserObject new];
    dd.userName = @"哈哈哈";
    dd.cards = @[@"11", @"22", @"33"];
    [RogueCache setSessionValues:dd];
    
}

- (void)addNotification {

    __weak RgMBViewController *weakSelf = self;
    [RogueCache notificationResponseWithBlock:^(NSString * _Nonnull key) {
        [[NSNotificationCenter defaultCenter] addObserver:weakSelf selector:@selector(changeOther:) name:key object:nil];
    }];


}

- (void)removeAction {

    RgUserObject *dd = [RgUserObject new];
    dd.userName = @"钟灵杰";
    dd.cards = @[@"dwa", @"dwwwww"];
    [RogueCache refreshUserSession:dd];
    
}

- (void)changeOther:(NSNotification *)notification {

    RgUserObject *rg = (RgUserObject *)notification.userInfo[@"RogueCacheUserSessionKey"];
    NSLog(@"%@", rg.cards);
    
}

@end
