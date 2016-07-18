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
#import "UILabel+RgLabel.h"

@interface RgRunTimeViewController2()

@property (atomic) NSInteger count;

@end

@implementation RgRunTimeViewController2

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.count = 0;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSLog(@"---上: %ld", (long)self.count);
        self.count = self.count + 1;
        NSLog(@"---下: %ld", (long)self.count);
        
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSLog(@"~~~上: %ld", (long)self.count);
        self.count = self.count - 1;
        NSLog(@"~~~下: %ld", (long)self.count);
        
    });

}

@end






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

    [self.navigationController pushViewController:[RgRunTimeViewController2 new] animated:YES];

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
    [self loadRgLabel];
    
}

- (void)loadSubviews {

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:[UIColor orangeColor]];
    button.frame = CGRectMake(0, 0, 200, 40);
    button.center = self.view.center;
    [button addTarget:self action:@selector(clickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

}

- (void)loadRgLabel {

    NSString *str = @"瓦达瓦大煎熬达瓦达瓦六角恐龙据了解立刻就分手刻录机俄罗斯飞机上了就发立刻就两节课了的弯道立刻就了解到垃圾我打拉开距离惊呆了接娃娃打我";
    
    UILabel *fitLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 140, [[UIScreen mainScreen] bounds].size.width - 200, 400)];
    fitLabel.font = [UIFont systemFontOfSize:20];
    fitLabel.text = str;
    fitLabel.numberOfLines = 0;
    fitLabel.lineBreakMode = NSLineBreakByCharWrapping;
    [self.view addSubview:fitLabel];

    NSLog(@"%f", [fitLabel height]);
    
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

    [RgLoadingController showLoadingSoonDisplayActivityViewOn:self
                                                  repeatTimer:1.5
                                          animationImageNames:arrays
                                                    withAfter:0
                                                 withComplete:nil];
    
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
