//
//  ViewController.m
//  RogueKitDemo
//
//  Created by Rogue on 16/1/7.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "ViewController.h"
#import "RgLoadingController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [RgLoadingController showLoadingActivityViewOn:self withTitle:@"哈哈哈"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
