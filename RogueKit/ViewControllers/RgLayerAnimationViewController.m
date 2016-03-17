//
//  RgLayerAnimationViewController.m
//  RogueKitDemo
//
//  Created by Rogue on 16/3/11.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgLayerAnimationViewController.h"

@interface RgLayerAnimationViewController ()

@property (nonatomic, strong) CALayer *animationLayer;

@end

@implementation RgLayerAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _animationLayer = [CALayer layer];
    _animationLayer.frame = CGRectMake(20, 150, 60, 60);
    _animationLayer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:_animationLayer];
    
    UIButton *b1 = [UIButton buttonWithType:UIButtonTypeSystem];
    b1.frame = CGRectMake(20, 80, 200, 40);
    b1.backgroundColor = [UIColor redColor];
    [b1 addTarget:self action:@selector(action1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b1];
}

- (void)action1 {

//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    animation.toValue = [NSNumber numberWithFloat:(2 * M_PI) * 3];
//    animation.duration = 2;
//    
//    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"position"];
//    animation1.fromValue = [NSValue valueWithCGRect:CGRectMake(20, 150, 60, 60)];
//    animation1.toValue = [NSValue valueWithCGRect:CGRectMake(120, 150, 60, 60)];
//    animation1.duration = 2;
//
//    [_animationLayer addAnimation:animation forKey:nil];
//    [_animationLayer addAnimation:animation1 forKey:nil];

    UILocalNotification *notification= [[UILocalNotification alloc] init];
    notification.alertBody = @"提示闹钟";
    NSDictionary* info = [NSDictionary dictionaryWithObject:@"没事儿" forKey:@"haha"];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
}



@end
