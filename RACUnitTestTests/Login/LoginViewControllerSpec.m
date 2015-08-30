//
//  LoginViewControllerSpec.m
//  RACUnitTest
//
//  Created by Sam Lau on 8/25/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <ReactiveCocoa/UIButton+RACCommandSupport.h>
#import <ReactiveCocoa/RACCommand.h>
#import <ReactiveCocoa/RACSignal.h>
#import <ReactiveCocoa/RACSubscriptingAssignmentTrampoline.h>
#import "LoginViewController.h"
#import "LoginView.h"
#import "LoginViewModel.h"


SPEC_BEGIN(LoginViewControllerSpec)

describe(@"LoginViewController", ^{
    __block LoginViewController *controller = nil;

    beforeEach(^{
        controller = [LoginViewController new];
        [controller view];
    });

    afterEach(^{
        controller = nil;
    });

    describe(@"Root View", ^{
        __block LoginView *rootView = nil;

        beforeEach(^{
            rootView = controller.rootView;
        });

        context(@"when view did load", ^{
            it(@"should bind data", ^{
                rootView.usernameTextField.text = @"samlau";
                rootView.passwordTextField.text = @"freedom";

                [rootView.usernameTextField sendActionsForControlEvents:UIControlEventEditingChanged];
                [rootView.passwordTextField sendActionsForControlEvents:UIControlEventEditingChanged];

                [[controller.loginViewModel.username should] equal:rootView.usernameTextField.text];
                [[controller.loginViewModel.password should] equal:rootView.passwordTextField.text];
            });
        });

    });
});

SPEC_END
