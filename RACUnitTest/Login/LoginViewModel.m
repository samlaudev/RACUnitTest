//
//  LoginViewModel.m
//  RACUnitTest
//
//  Created by Sam Lau on 8/25/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <ReactiveCocoa/RACCommand.h>
#import <ReactiveCocoa.h>
#import "LoginViewModel.h"
#import "DataValidation.h"
#import "LoginClient.h"

@implementation LoginViewModel

- (RACCommand *)loginCommand
{
    if (!_loginCommand) {
        _loginCommand = [[RACCommand alloc] initWithEnabled:[self isValidUsernameAndPasswordSignal] signalBlock:^RACSignal *(id input) {

            return [LoginClient loginWithUsername:self.username password:self.password];
        }];
    }
    return _loginCommand;
}

- (RACSignal *)isValidUsernameAndPasswordSignal
{
    return [RACSignal combineLatest:@[RACObserve(self, username), RACObserve(self, password)] reduce:^(NSString *username, NSString *password) {
         return @([DataValidation isValidEmail:username] && [DataValidation isValidPassword:password]);
    }];
}


@end
