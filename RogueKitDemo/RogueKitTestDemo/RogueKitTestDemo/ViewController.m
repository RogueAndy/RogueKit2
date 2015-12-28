//
//  ViewController.m
//  RogueKitTestDemo
//
//  Created by Rogue on 15/12/23.
//  Copyright © 2015年 Rogue. All rights reserved.
//

#import "ViewController.h"
#import "RgLoadingController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    [RgLoadingController showLoadingActivityViewOn:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
