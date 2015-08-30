//
//  LoginClientSpec.m
//  RACUnitTest
//
//  Created by Sam Lau on 8/30/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "LoginClient.h"
#import <ReactiveCocoa.h>

SPEC_BEGIN(LoginClientSpec)

describe(@"LoginClient", ^{
    context(@"when username is samlau@163.com and password is samlau", ^{
        __block BOOL success = NO;
        __block NSError *error = nil;
        
        it(@"should login successfully", ^{
            RACTuple *tuple = [[LoginClient loginWithUsername:@"samlau@163.com" password:@"samlau"] asynchronousFirstOrDefault:nil success:&success error:&error];
            NSDictionary *result = tuple.first;

            [[theValue(success) should] beYes];
            [[error should] beNil];
            [[result[@"result"] should] equal:@"success"];
        });
    });
});

SPEC_END
