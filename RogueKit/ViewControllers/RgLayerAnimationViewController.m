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
    _animationLayer.frame = CGRectMake(80, 150, 40, 40);
    _animationLayer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:_animationLayer];
    
    UIButton *b1 = [UIButton buttonWithType:UIButtonTypeSystem];
    b1.frame = CGRectMake(20, 80, 200, 40);
    b1.backgroundColor = [UIColor redColor];
    [b1 addTarget:self action:@selector(action1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b1];
}

- (void)action1 {
    
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGMutablePathRef path = CGPathCreateMutable();
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.duration = 2;
    CGPathMoveToPoint(path, NULL, 100, 230);
    CGPathAddArc(path, NULL, 100, 170, 60,  M_PI / 4.0, M_PI / 2.0, YES);
    pathAnimation.path = path;
    CGPathRelease(path);
    
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation1.fromValue = @1;
    animation1.toValue = @3;
    animation1.duration = 2;

    [_animationLayer addAnimation:pathAnimation forKey:nil];
    [_animationLayer addAnimation:animation1 forKey:nil];
    
}



@end
