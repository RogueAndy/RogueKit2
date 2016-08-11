//
//  RgMengCengViewController.m
//  RogueKitDemo
//
//  Created by Rogue Andy on 16/8/12.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgMengCengViewController.h"

@interface RgMengCengViewController()

@property (nonatomic, strong) UIImageView *bottom_1;

@property (nonatomic, strong) UIImageView *bottom_2;

@property (nonatomic, strong) UIImageView *black;

@property (nonatomic, strong) CALayer *mohu;

@end

@implementation RgMengCengViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _bottom_1 = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view addSubview:_bottom_1];

    _bottom_2 = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.view addSubview:_bottom_2];
    
    UIImage *blackImage = [UIImage imageNamed:@"black_corner"];
    _black = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, blackImage.size.width, blackImage.size.height)];
    _black.center = self.view.center;
    [self.view addSubview:_black];
    
    _bottom_1.image = [UIImage imageNamed:@"bottom_1"];
    _bottom_2.image = [UIImage imageNamed:@"bottom_2"];
    _black.backgroundColor = [UIColor clearColor];
    
    _mohu = [CALayer layer];
    _mohu.frame = CGRectMake(0, 0, _black.frame.size.width, _black.frame.size.height);
    _mohu.contents = (__bridge id _Nullable)([blackImage CGImage]);
    _mohu.position = _bottom_2.center;
    _bottom_2.layer.mask = _mohu;

}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    for (UITouch *touch in touches) {
    
        [CATransaction setDisableActions:YES];
        CGPoint point = [touch locationInView:self.view];
        _mohu.position = point;
    
    }

}

@end
