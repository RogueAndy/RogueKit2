//
//  RgTabbarViewController.m
//  RogueKitDemo
//
//  Created by Rogue on 16/1/25.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgTabbarViewController.h"
#import "RgHomeViewController.h"
#import "RgZoneViewController.h"

@interface RgTabbarViewController ()

@end

@implementation RgTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadSubViews];
}

- (void)loadSubViews {

    RgHomeViewController *home = [RgHomeViewController new];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:home];
    
    RgZoneViewController *zone = [RgZoneViewController new];
    UINavigationController *zoneNav = [[UINavigationController alloc] initWithRootViewController:zone];
    
    self.viewControllers = @[homeNav, zoneNav];

}

@end
