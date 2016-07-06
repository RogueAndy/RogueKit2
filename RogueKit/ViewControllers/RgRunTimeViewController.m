//
//  RgRunTimeViewController.m
//  RogueKitDemo
//
//  Created by Rogue on 16/4/21.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgRunTimeViewController.h"
#import <objc/runtime.h>
#import "RgLoadingController.h"



@interface RgRunTimeViewController1()

@end

@implementation RgRunTimeViewController1

- (void)viewDidLoad {

    [super viewDidLoad];
    
    UIButton *sender = [UIButton buttonWithType:UIButtonTypeCustom];
    [sender addTarget:self action:@selector(pushViewController:) forControlEvents:UIControlEventTouchUpInside];
    sender.frame = CGRectMake(0, 0, 120, 30);
    sender.backgroundColor = [UIColor orangeColor];
    sender.center = self.view.center;
    [self.view addSubview:sender];

}

- (void)pushViewController:(UIButton *)sender {

    [self.navigationController pushViewController:[RgRunTimeViewController new] animated:YES];

}

@end








@interface RgRunTimeViewController()

@property (nonatomic, assign) RgTe selfTe;

@end

@implementation RgRunTimeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    [self loadSubviews];
    
}

- (void)loadSubviews {

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:[UIColor orangeColor]];
    button.frame = CGRectMake(0, 0, 200, 40);
    button.center = self.view.center;
    [button addTarget:self action:@selector(clickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}

- (void)clickButtonAction:(UIButton *)sender {

    [self loadShow];

}

- (void)loadShow {

    NSArray *arrays = @[@"loading_1",
                        @"loading_2",
                        @"loading_3",
                        @"loading_4",
                        @"loading_5",
                        @"loading_6",
                        @"loading_7",
                        @"loading_8",
                        @"loading_9",
                        @"loading_10",
                        @"loading_11",
                        @"loading_12",
                        @"loading_13",
                        @"loading_14"
                        ];

//    [RgLoadingController showLoadingSoonDisplayActivityViewOn:self
//                                                  repeatTimer:1.5
//                                          animationImageNames:arrays
//                                                    withAfter:3
//                                                 withComplete:nil];
    
//    [RgLoadingController showLoadingActivityViewOn:self];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2ull * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//        [RgLoadingController hideLoadingActivityViewOn:self];
//        
//    });
    
//    [RgLoadingController showLoadingSoonDisplayActivityViewOn:self hudType:RgLoadingDefault titleOrGif:@"测试" withAfter:2 withComplete:^{
//        NSLog(@"完毕----");
//    }];
    
    [RgLoadingController showLoadingSoonDisplayActivityViewOn:self repeatTimer:1.5 animationImageNames:arrays withAfter:4 withComplete:^{
        NSLog(@"完毕-----");
    }];


}

@end
