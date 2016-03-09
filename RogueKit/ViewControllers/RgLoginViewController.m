//
//  RgLoginViewController.m
//  RogueKitDemo
//
//  Created by Rogue on 16/1/22.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgLoginViewController.h"
#import "Masonry.h"
#import "RgTextField.h"
#import "RgRegisterViewController.h"
#import "RgLoadingController.h"

@interface RgLoginViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) RgTextField *accountField;

@property (nonatomic, strong) RgTextField *passField;

@property (nonatomic, strong) UIButton *loginButton;

@property (nonatomic, strong) UIButton *registerButton;

@end

@implementation RgLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"登陆界面";
    [self loadSubViews];
    [self loadLayout];
    
    
}

- (void)loadSubViews {

    _accountField = [RgTextField initWithEditEdge:35 frame:CGRectZero];
    _accountField.placeholder = @"请输入账户名";
    _accountField.textColor = [UIColor colorWithRed:80/255.f green:80/255.f blue:80/255.f alpha:1];
    _accountField.font = [UIFont systemFontOfSize:15];
    _accountField.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_accountField];
    
    _passField = [RgTextField initWithEditEdge:35 frame:CGRectZero];
    _passField.placeholder = @"请输入密码";
    _passField.textColor = [UIColor colorWithRed:80/255.f green:80/255.f blue:80/255.f alpha:1];
    _passField.font = [UIFont systemFontOfSize:15];
    _passField.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_passField];
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_loginButton setTitle:@"登 陆" forState:UIControlStateNormal];
    _loginButton.backgroundColor = [UIColor orangeColor];
    [_loginButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _loginButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:_loginButton];
    
    _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_registerButton setTitle:@"注 册" forState:UIControlStateNormal];
    _registerButton.backgroundColor = [UIColor orangeColor];
    [_registerButton addTarget:self action:@selector(registerA) forControlEvents:UIControlEventTouchUpInside];
    [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _registerButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:_registerButton];
    
}

- (void)loadLayout {

    [_accountField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.top.equalTo(self.view.mas_top).offset(140);
        make.height.mas_equalTo(40);
        
    }];
    
    [_passField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_accountField.mas_left);
        make.right.equalTo(_accountField.mas_right);
        make.top.equalTo(_accountField.mas_bottom).offset(20);
        make.height.equalTo(_accountField.mas_height);
        
    }];
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_accountField.mas_left);
        make.right.equalTo(_accountField.mas_right);
        make.top.equalTo(_passField.mas_bottom).offset(20);
        make.height.equalTo(_accountField.mas_height);
        
    }];
    
    [_registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_accountField.mas_left);
        make.right.equalTo(_accountField.mas_right);
        make.top.equalTo(_loginButton.mas_bottom).offset(20);
        make.height.equalTo(_accountField.mas_height);
        
    }];

}

- (void)loginAction {
//    __weak RgLoginViewController *weakSelf = self;
//    [RgLoadingController showLoadingActivityViewOn:self withTitle:@"登录中"];
//    [RogueNetworkManager apiMethod:@"userLoginAction" parameters:@{@"username":_accountField.text, @"password":_passField.text} completeBlock:^(BOOL status, NSDictionary *responseObj, NSString *responseMessage) {
//        if(!status) {
//            [RgLoadingController showLoadingSoonDisplayActivityViewOn:weakSelf withTitle:responseMessage withAfter:1 withComplete:nil];
//            return ;
//        }
//        
//        [RgLoadingController showLoadingSoonDisplayActivityViewOn:weakSelf withTitle:responseMessage withAfter:1 withComplete:nil];
//        
//    }];
    

}

- (void)registerA {

    [self.navigationController pushViewController:[RgRegisterViewController new] animated:YES];

}

@end
