//
//  LoginView.m
//  RACUnitTest
//
//  Created by Sam Lau on 8/25/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <Masonry.h>
#import "LoginView.h"

@implementation LoginView

#pragma mark - Views hierarchy and layout

- (void)addSubviews
{
    [self addSubview:self.usernameTextField];
    [self addSubview:self.passwordTextField];
    [self addSubview:self.loginButton];
}

- (void)defineLayout
{
    [self.usernameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self).with.centerOffset(CGPointMake(0, -80));
        make.width.equalTo(@250);
        make.height.equalTo(@30);
    }];

    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.usernameTextField.mas_bottom).with.offset(10);
        make.size.equalTo(self.usernameTextField);
    }];

    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.passwordTextField.mas_bottom).with.offset(10.0f);
    }];
}

#pragma mark - Views Lazy Initialization

- (UITextField *)usernameTextField
{
    if (!_usernameTextField) {
        _usernameTextField  = [UITextField new]; 
        _usernameTextField.placeholder = @"用户名";
        _usernameTextField.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _usernameTextField;
}

- (UITextField *)passwordTextField
{
    if (!_passwordTextField) {
        _passwordTextField = [UITextField new];
        _passwordTextField.placeholder = @"密码";
        _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _passwordTextField;
}

- (UIButton *)loginButton
{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    }
    return _loginButton;
}


@end
