//
//  LoginView.h
//  RACUnitTest
//
//  Created by Sam Lau on 8/25/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <SHPAbstractView.h>
#import <UIKit/UIKit.h>

@interface LoginView : SHPAbstractView

/*
 @brief 用户名
 */
@property (strong, nonatomic) UITextField *usernameTextField;
/*
 @brief 密码
 */
@property (strong, nonatomic) UITextField *passwordTextField;
/*
 @brief 登陆按钮
 */
@property (strong, nonatomic) UIButton *loginButton;

@end
