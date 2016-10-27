//
//  RgChatWithPythonViewController.m
//  RogueKitDemo
//
//  Created by rogue on 2016/10/24.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgChatWithPythonViewController.h"
#import "RgNetWorkObject.h"
#import "RgLoadingController.h"

@interface RgChatWithPythonViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UIScrollView *chatScroll;

@property (nonatomic, strong) UITextField *chatField;

@property (nonatomic, strong) NSMutableArray *messages;

@end

@implementation RgChatWithPythonViewController

- (NSMutableArray *)messages {

    if(!_messages) {
    
        _messages = [[NSMutableArray alloc] init];
    
    }
    
    return _messages;

}

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.chatScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 50 - 64)];
    self.chatScroll.backgroundColor = [UIColor colorWithRed:230/255.f green:230/255.f blue:230/255.f alpha:1];
    [self.view addSubview:self.chatScroll];

    self.chatField = [[UITextField alloc] initWithFrame:CGRectMake(0, self.chatScroll.frame.size.height + self.chatScroll.frame.origin.y, CGRectGetWidth(self.view.frame), 50)];
    self.chatField.delegate = self;
    self.chatField.returnKeyType = UIReturnKeySend;
    [self.view addSubview:self.chatField];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    if(textField == self.chatField) {
        
        [self.chatField resignFirstResponder];
        [self addChatMessage:textField.text];
    
    }
    
    return YES;

}

- (void)addChatMessage:(NSString *)message {

    [RgLoadingController showLoadingActivityViewOn:self];
    
    __weak RgChatWithPythonViewController *weakSelf = self;
//    [RgNetWorkObject getMethod:@"returnforios/"
//                     parameters:nil
//                       complete:^(NSDictionary *response, RogueNetWorkType networkType) {
//                           NSLog(@"------  %@", response);
//                           [RgLoadingController hideLoadingActivityViewOn:weakSelf];
//                       }];
    [RgNetWorkObject postMethod:@"returnforios2/"
                     parameters:@{@"message": message}
                      complete:^(NSDictionary *response, RogueNetWorkType networkType) {
                          
                          NSLog(@"------  %@", response);
                          [weakSelf layoutScroll:message];
                          [RgLoadingController hideLoadingActivityViewOn:weakSelf];
                          
                      }];

}

- (void)layoutScroll:(NSString *)message {

    [self.messages addObject:message];
    CGFloat width = 280;
    CGFloat heigt = 25;
    CGFloat scrollHeight = self.messages.count * (5 + 25);
    self.chatScroll.contentSize = CGSizeMake(CGRectGetWidth(self.chatScroll.frame), scrollHeight > CGRectGetHeight(self.chatScroll.frame) ? scrollHeight : CGRectGetHeight(self.chatScroll.frame));
    for(NSInteger i = self.messages.count - 1; i < self.messages.count; i++) {
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.backgroundColor = [UIColor whiteColor];
        label.textColor = [UIColor colorWithRed:60/255.f green:60/255.f blue:60/255.f alpha:1];
        label.font = [UIFont systemFontOfSize:14];
        label.frame = CGRectMake((CGRectGetWidth(self.view.frame) - width) / 2.0, 5 + (25 + 5) * i, width, heigt);
        label.text = message;
        [self.chatScroll addSubview:label];
        
    }

}


@end
