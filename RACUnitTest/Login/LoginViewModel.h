//
//  LoginViewModel.h
//  RACUnitTest
//
//  Created by Sam Lau on 8/25/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <RVMViewModel.h>

@interface LoginViewModel : RVMViewModel

/*
 @brief 用户名
 */
@property (copy, nonatomic) NSString *username;
/*
 @brief 密码
 */
@property (copy, nonatomic) NSString *password;

@end
