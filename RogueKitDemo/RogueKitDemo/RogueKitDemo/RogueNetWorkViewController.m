//
//  RogueNetWorkViewController.m
//  RogueKitDemo
//
//  Created by Rogue on 16/1/21.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RogueNetWorkViewController.h"

@interface RogueNetWorkViewController ()

@end

@implementation RogueNetWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"测试网络" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(20, 200, 280, 50);
    [button addTarget:self action:@selector(testNet) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)testNet  {
    

}
@end
