//
//  LoginViewController.m
//  RACUnitTest
//
//  Created by Sam Lau on 8/24/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <ReactiveCocoa.h>

#import "LoginViewController.h"
#import "LoginView.h"
#import "MASConstraintMaker.h"
#import "View+MASAdditions.h"
#import "LoginViewModel.h"
#import "MBProgressHUD+Helper.h"

@interface LoginViewController ()

#pragma mark - UI properties
@property (strong, nonatomic) LoginView *rootView;

#pragma mark - View model
@property (strong, nonatomic) LoginViewModel *loginViewModel;

@end

@implementation LoginViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    // build view hierarchy
    [self buildViewHierarchy];
    // bind data
    [self bindData];
    // handle events
    [self handleEvents];
    // update UI
    [self updateUI];
}

- (void)buildViewHierarchy
{
    [self.view addSubview:self.rootView];
    [self.rootView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)bindData
{
    RAC(self.loginViewModel, username) = self.rootView.usernameTextField.rac_textSignal;
    RAC(self.loginViewModel, password) = self.rootView.passwordTextField.rac_textSignal;
}

- (void)handleEvents
{
    self.rootView.loginButton.rac_command = self.loginViewModel.loginCommand;
}

- (void)updateUI
{
    [self.loginViewModel.loginCommand.executionSignals subscribeNext:^(RACSignal *subscribedSignal) {
        [subscribedSignal subscribeCompleted:^{
            [MBProgressHUD showMessage:@"登录成功" onView:self.view];
        }];
    }];
}

#pragma mark - Custom Accessors
- (LoginView *)rootView
{
    if (!_rootView) {
        _rootView = [LoginView new];
    }
    return _rootView;
}

- (LoginViewModel *)loginViewModel
{
    if (!_loginViewModel) {
        _loginViewModel = [LoginViewModel new];
    }
    return _loginViewModel;
}


@end
