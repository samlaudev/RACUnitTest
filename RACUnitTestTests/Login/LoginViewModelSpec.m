//
//  LoginViewModelSpec.m
//  RACUnitTest
//
//  Created by Sam Lau on 8/30/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "LoginViewModel.h"
#import <ReactiveCocoa.h>

SPEC_BEGIN(LoginViewModelSpec)

describe(@"LoginViewModel", ^{
    __block LoginViewModel* viewModel = nil;

    beforeEach(^{
        viewModel = [LoginViewModel new];
    });

    afterEach(^{
        viewModel = nil;
    });

    context(@"when username is samlau@163.com and password is freedom", ^{
        __block BOOL result = NO;

        it(@"should return signal that value is YES", ^{
            viewModel.username = @"samlau@163.com";
            viewModel.password = @"freedom";

            [[viewModel isValidUsernameAndPasswordSignal] subscribeNext:^(id x) {
                result = [x boolValue];
            }];

            [[theValue(result) should] beYes];
        });
    });

    context(@"when username is samlau and password is freedom", ^{
        __block BOOL result = YES;

        it(@"should return signal that value is NO", ^{
            viewModel.username = @"samlau";
            viewModel.password = @"freedom";

            [[viewModel isValidUsernameAndPasswordSignal] subscribeNext:^(id x) {
                result = [x boolValue];
            }];

            [[theValue(result) should] beNo];
        });
    });

    context(@"when username is samlau@163.com and password is 12345", ^{
        __block BOOL result = YES;

        it(@"should return signal that value is NO", ^{
            viewModel.username = @"samlau@163.com";
            viewModel.password = @"12345";

            [[viewModel isValidUsernameAndPasswordSignal] subscribeNext:^(id x) {
                result = [x boolValue];
            }];

            [[theValue(result) should] beNo];
        });
    });
});

SPEC_END
