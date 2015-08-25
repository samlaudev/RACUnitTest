//
//  LoginViewController.m
//  RACUnitTest
//
//  Created by Sam Lau on 8/24/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "MASConstraintMaker.h"
#import "View+MASAdditions.h"

@interface LoginViewController ()

@property (strong, nonatomic) LoginView *rootView;

@end

@implementation LoginViewController

#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];

    // build view hierarchy
    [self.view addSubview:self.rootView];
    [self.rootView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (LoginView *)rootView
{
    if (!_rootView) {
        _rootView = [LoginView new];
    }
    return _rootView;
}


@end
