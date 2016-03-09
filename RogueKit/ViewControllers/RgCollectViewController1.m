//
//  RgCollectViewController.m
//  RogueKitDemo
//
//  Created by Rogue on 16/3/7.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgCollectViewController1.h"
#import "RogueCollectView.h"

@implementation RgCollectViewController1

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    NSArray<NSString *> *dd = [NSArray arrayWithObjects:@"11", @"22", @"33", @"44", @"55", @"66", @"77", @"88", @"99", nil];
    RogueCollectView *collect = [RogueCollectView initWithFrame:CGRectMake(0, 80, CGRectGetWidth(self.view.frame), 160) datas:dd];
    [self.view addSubview:collect];
    
}

@end
