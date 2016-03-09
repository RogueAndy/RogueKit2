//
//  RgRegisterViewController.m
//  RogueKitDemo
//
//  Created by Rogue on 16/1/22.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgRegisterViewController.h"
#import "Masonry.h"
#import "RgTextField.h"

@interface RgRegisterViewController ()<UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) RgTextField *accountField;

@property (nonatomic, strong) RgTextField *passField;

@property (nonatomic, strong) RgTextField *passAgainField;

@property (nonatomic, strong) RgTextField *sexField;

@property (nonatomic, strong) RgTextField *ageField;

@property (nonatomic, strong) RgTextField *interestField;

@property (nonatomic, strong) UIButton *registerButton;

@property (nonatomic, strong) UIPickerView *picker;

@end

@implementation RgRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册界面";
    self.view.backgroundColor = [UIColor grayColor];
    
    [self loadSubViews];
    [self loadLayout];
}

- (void)loadSubViews {

    _accountField = [RgTextField initWithEditEdge:35 frame:CGRectZero];
    _accountField.placeholder = @"请输入账户名";
    _accountField.textColor = [UIColor colorWithRed:80/255.f green:80/255.f blue:80/255.f alpha:1];
    _accountField.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_accountField];
    
    _passField = [RgTextField initWithEditEdge:35 frame:CGRectZero];
    _passField.placeholder = @"请输入密码";
    _passField.textColor = [UIColor colorWithRed:80/255.f green:80/255.f blue:80/255.f alpha:1];
    _passField.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_passField];
    
    _passAgainField = [RgTextField initWithEditEdge:35 frame:CGRectZero];
    _passAgainField.placeholder = @"请再次输入密码";
    _passAgainField.textColor = [UIColor colorWithRed:80/255.f green:80/255.f blue:80/255.f alpha:1];
    _passAgainField.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_passAgainField];
    
    _ageField = [RgTextField initWithEditEdge:35 frame:CGRectZero];
    _ageField.placeholder = @"请输入年龄";
    _ageField.textColor = [UIColor colorWithRed:80/255.f green:80/255.f blue:80/255.f alpha:1];
    _ageField.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_ageField];
    
    _sexField = [RgTextField initWithEditEdge:35 frame:CGRectZero];
    _sexField.placeholder = @"请选择性别";
    _sexField.textColor = [UIColor colorWithRed:80/255.f green:80/255.f blue:80/255.f alpha:1];
    _sexField.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_sexField];

    _interestField = [RgTextField initWithEditEdge:35 frame:CGRectZero];
    _interestField.placeholder = @"请填写兴趣";
    _interestField.textColor = [UIColor colorWithRed:80/255.f green:80/255.f blue:80/255.f alpha:1];
    _interestField.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_interestField];
    
    _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_registerButton setTitle:@"注 册" forState:UIControlStateNormal];
    [_registerButton addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
    [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _registerButton.titleLabel.font = [UIFont systemFontOfSize:18];
    _registerButton.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_registerButton];
    
    _accountField.backgroundColor = [UIColor whiteColor];
    _passField.backgroundColor = [UIColor whiteColor];
    _passAgainField.backgroundColor = [UIColor whiteColor];
    _ageField.backgroundColor = [UIColor whiteColor];
    _sexField.backgroundColor = [UIColor whiteColor];
    _interestField.backgroundColor = [UIColor whiteColor];
    
    _accountField.delegate = self;
    _passAgainField.delegate = self;
    _passField.delegate = self;
    _ageField.delegate = self;
    _sexField.delegate = self;
    _interestField.delegate = self;

}

- (void)loadLayout {

    [_accountField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view.mas_left).offset(40);
        make.right.equalTo(self.view.mas_right).offset(-40);
        make.top.equalTo(self.view.mas_top).offset(100);
        make.height.mas_equalTo(40);
        
    }];
    
    [_passField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_accountField.mas_left);
        make.right.equalTo(_accountField.mas_right);
        make.top.equalTo(_accountField.mas_bottom).offset(10);
        make.height.equalTo(_accountField.mas_height);
        
    }];
    
    [_passAgainField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_accountField.mas_left);
        make.right.equalTo(_accountField.mas_right);
        make.top.equalTo(_passField.mas_bottom).offset(10);
        make.height.equalTo(_accountField.mas_height);
        
    }];
    
    [_ageField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_accountField.mas_left);
        make.right.equalTo(_accountField.mas_right);
        make.top.equalTo(_passAgainField.mas_bottom).offset(10);
        make.height.equalTo(_accountField.mas_height);
        
    }];
    
    [_sexField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_accountField.mas_left);
        make.right.equalTo(_accountField.mas_right);
        make.top.equalTo(_ageField.mas_bottom).offset(10);
        make.height.equalTo(_accountField.mas_height);
        
    }];
    
    [_interestField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_accountField.mas_left);
        make.right.equalTo(_accountField.mas_right);
        make.top.equalTo(_sexField.mas_bottom).offset(10);
        make.height.equalTo(_accountField.mas_height);
        
    }];

    [_registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_accountField.mas_left);
        make.right.equalTo(_accountField.mas_right);
        make.top.equalTo(_interestField.mas_bottom).offset(20);
        make.height.equalTo(_accountField.mas_height);
        
    }];
}

- (void)registerAction {

//    NSDictionary *dic = @{@"password":_passField.text, @"username":_accountField.text, @"userage":_ageField.text, @"usersex":@"", @"interest":_interestField.text};
//    [RogueNetworkManager apiMethod:@"registerIosuserWithUserInfor" parameters:dic completeBlock:^(BOOL status, NSDictionary *responseObj, NSString *responseMessage) {
//        if(status) {
//        
//            NSLog(@"%@", responseObj);
//        
//        }
//    }];

}

- (void)test {

    NSLog(@"dwadaw");

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    if(_accountField == textField) {
    
        [_accountField resignFirstResponder];
        [_passField becomeFirstResponder];
        
    } else if(_passField == textField) {
    
        [_passField resignFirstResponder];
        [_passAgainField becomeFirstResponder];
    
    } else if(_passAgainField == textField) {
    
        [_passAgainField resignFirstResponder];
        [_ageField becomeFirstResponder];
    
    } else if(_ageField == textField) {
    
        [_ageField resignFirstResponder];
        [_interestField becomeFirstResponder];
    
    } else if(_interestField == textField) {
    
        [_interestField resignFirstResponder];
    
    }
    
    return YES;

}

- (void)textFieldDidBeginEditing:(UITextField *)textField {

    if(textField == _sexField) {
    
        [_sexField resignFirstResponder];
    
    }

}

- (void)showPicker {

    _picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 140)];
    _picker.dataSource = self;
    _picker.delegate = self;
    [self.view addSubview:_picker];

}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {

    return 1;

}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {

    return 2;

}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return @"男";
    } else {
        return @"女";
        
    }
}

@end
