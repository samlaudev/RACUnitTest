//
//  LoginView.m
//  RACUnitTest
//
//  Created by Sam Lau on 8/25/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <Masonry.h>

#import "UIImage+Helper.h"
#import "LoginView.h"
#import "ColorMacro.h"

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
        make.size.equalTo(self.passwordTextField);
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
        _passwordTextField.secureTextEntry = YES;
    }
    return _passwordTextField;
}

- (UIButton *)loginButton
{
    if (!_loginButton) {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.layer.cornerRadius = 3.5f;
        _loginButton.layer.masksToBounds = YES;
        [_loginButton setTitle:@"登陆" forState:UIControlStateNormal];
        [_loginButton setBackgroundImage:[UIImage imageWithColor:BUTTON_BACKGROUND_COLOR] forState:UIControlStateNormal];
    }
    return _loginButton;
}


@end
