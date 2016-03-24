//
//  RgWebViewController.m
//  RogueKitDemo
//
//  Created by Rogue on 16/3/24.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgWebViewController.h"

@interface RgWebViewController()

@property (nonatomic, strong) NSDictionary *model;

@end

@implementation RgWebViewController

+ (instancetype)initWithModel:(NSDictionary *)model {

    RgWebViewController *webViewController = [[RgWebViewController alloc] init];
    webViewController.model = model;
    webViewController.url = [NSURL URLWithString:@"https://github.com/TimOliver/TOWebViewController"];
    [webViewController setShouldStartLoadRequestHandler:^BOOL(NSURLRequest *request, UIWebViewNavigationType type) {
        // 此处对地址进行解析获取;
        return YES;
    }];
    return webViewController;
    
}

#pragma mark - Refresh Self ViewController

- (void)refreshWebViewController {

    // 对当前的网页进行刷新效果，例如 从未登录状态到登陆状态

}


- (void)viewWillAppear:(BOOL)animated {

    [super viewWillAppear:animated];
 
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"隐藏" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonAction:)];
    self.navigationItem.rightBarButtonItem = rightButton;

}

- (void)rightButtonAction:(id)sender {

    [self dismissViewControllerAnimated:YES completion:nil];

}

- (void)dealloc {

    NSLog(@"-------------------- 网页消失--------------------");

}

@end
