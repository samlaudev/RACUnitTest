//
//  LoginViewModel.h
//  RACUnitTest
//
//  Created by Sam Lau on 8/25/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <RVMViewModel.h>

@class RACCommand;

@interface LoginViewModel : RVMViewModel

#pragma mark - UI state
/*
 @brief 用户名
 */
@property (copy, nonatomic) NSString *username;
/*
 @brief 密码
 */
@property (copy, nonatomic) NSString *password;

#pragma mark - Handle events
/*
 @brief 处理用户民和密码是否有效才能点击按钮以及登陆事件
 */
@property (nonatomic, strong) RACCommand *loginCommand;

#pragma mark - Methods
- (RACSignal *)isValidUsernameAndPasswordSignal;

@end
