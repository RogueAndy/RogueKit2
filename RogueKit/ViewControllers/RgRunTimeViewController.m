//
//  RgRunTimeViewController.m
//  RogueKitDemo
//
//  Created by Rogue on 16/4/21.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgRunTimeViewController.h"
#import <objc/runtime.h>

@interface RgRunTimeViewController()

@property (nonatomic, assign) RgTe selfTe;

@end

@implementation RgRunTimeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
    
}

@end
