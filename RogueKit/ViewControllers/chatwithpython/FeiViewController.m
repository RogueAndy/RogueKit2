//
//  FeiViewController.m
//  RogueKitDemo
//
//  Created by rogue on 2016/10/27.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "FeiViewController.h"

@interface FeiViewController ()<UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webview;

@end

@implementation FeiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 64)];
    self.webview.delegate = self;
    NSString *url = @"http://www.wxcs.cn/portal/appList.jsp?columnid=900014&col_maxnum=24&col_name=%25u4EA4%25u901A%25u51FA%25u884C&index=0&userId=&regionId=43";
    NSString *haha = [url stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@", haha);
//    url = [url stringByAddingPercentEscapesUsingEncoding:NSUnicodeStringEncoding];
    
    NSMutableString *outputStr = [NSMutableString stringWithString:url];
    [outputStr replaceOccurrencesOfString:@"+"
                               withString:@" "
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0, [outputStr length])];
    
    NSString *dd = [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@", dd);
//    NSString *aesString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,(CFStringRef)url,NULL,CFSTR(":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`"),kCFStringEncodingUTF8));
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    [self.webview loadRequest:request];
    [self.view addSubview:self.webview];
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {

    NSLog(@"-------------------------------------------------------------------------------------------------");
    
    return YES;

}


@end
