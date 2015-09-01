//
//  LoginViewController.h
//  RACUnitTest
//
//  Created by Sam Lau on 8/24/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginView;
@class LoginViewModel;

@interface LoginViewController : UIViewController

@property (strong, nonatomic, readonly) LoginView *rootView;
@property (strong, nonatomic, readonly) LoginViewModel *loginViewModel;

@end

