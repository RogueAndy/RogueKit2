//
//  RLoadingController.m
//  RogueKitDemo
//
//  Created by rogue on 2017/3/6.
//  Copyright © 2017年 Rogue. All rights reserved.
//

#import "RLoadingController.h"
#import "RgLoadingController.h"

@interface RLoadingController ()

@end

@implementation RLoadingController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:238/255.f green:238/255.f blue:238/255.f alpha:1];
    
    UIButton *start = [UIButton buttonWithType:UIButtonTypeCustom];
    start.frame = CGRectMake(40, 80, self.view.frame.size.width - 80, 35);
    start.backgroundColor = [UIColor redColor];
    [start addTarget:self action:@selector(startAction:) forControlEvents:UIControlEventTouchUpInside];
    [start setTitle:@"开始" forState:UIControlStateNormal];
    [self.view addSubview:start];
    
    UIButton *end = [UIButton buttonWithType:UIButtonTypeCustom];
    end.frame = CGRectMake(40, 140, self.view.frame.size.width - 80, 35);
    end.backgroundColor = [UIColor redColor];
    [end addTarget:self action:@selector(endAction:) forControlEvents:UIControlEventTouchUpInside];
    [end setTitle:@"结束" forState:UIControlStateNormal];
    [self.view addSubview:end];
    
    UIButton *autoshow = [UIButton buttonWithType:UIButtonTypeCustom];
    autoshow.frame = CGRectMake(40, 200, self.view.frame.size.width - 80, 35);
    autoshow.backgroundColor = [UIColor redColor];
    [autoshow addTarget:self action:@selector(displayAuto:) forControlEvents:UIControlEventTouchUpInside];
    [autoshow setTitle:@"自动消失" forState:UIControlStateNormal];
    [self.view addSubview:autoshow];
    
    UIBarButtonItem *s1 = [[UIBarButtonItem alloc] initWithTitle:@"开始" style:UIBarButtonItemStylePlain target:self action:@selector(startAction:)];
    UIBarButtonItem *s2 = [[UIBarButtonItem alloc] initWithTitle:@"结束" style:UIBarButtonItemStylePlain target:self action:@selector(endAction:)];
    self.navigationItem.leftBarButtonItem = s1;
    self.navigationItem.rightBarButtonItem = s2;

}

- (void)startAction:(UIButton *)sender {

    [RgLoadingController showLoadingActivityViewOn:self];

}

- (void)endAction:(UIButton *)sender {

    [RgLoadingController hideLoadingActivityViewOn:self];

}

- (void)displayAuto:(UIButton *)sender {

    [RgLoadingController showLoadingSoonDisplayActivityViewOn:self withTitle:@"显示2s" withAfter:2 withComplete:^{
        NSLog(@"用户提示完毕后，执行改行代码");
    }];

}

@end
