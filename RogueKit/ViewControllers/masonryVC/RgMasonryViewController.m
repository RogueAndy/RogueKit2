//
//  RgMasonryViewController.m
//  RogueKitDemo
//
//  Created by rogue on 2016/11/16.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgMasonryViewController.h"
#import "RgMasonryObj.h"

@interface RgMasonryViewController ()

@end

@implementation RgMasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    RgMasonryObj *obj = [RgMasonryObj new];
    NSDictionary *dic = obj.centerAttribution;
    RgMasonryObj *obj1 = obj.method1(@"ddd");
    RgMasonryObj *obj2 = [obj method2:@"ddd"];
    RgMasonryObj *obj3 = obj.rightAttribution;
    RgMasonryObj *dd = obj.equalWithSelf(@(55));
    NSLog(@"%@", dic);
    
    UIView *testView = [UIView new];
    [self.view addSubview:testView];
    
    [testView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(5);
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
