//
//  DataValidationSpec.m
//  RACUnitTest
//
//  Created by Sam Lau on 8/27/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "DataValidation.h"


SPEC_BEGIN(DataValidationSpec)

describe(@"DataValidation", ^{
    context(@"when email is samlau@163.com", ^{
        it(@"should return YES", ^{
            BOOL result = [DataValidation isValidEmail:@"samlau@163.com"];
            [[theValue(result) should] beYes];
        });
    });
    
    context(@"when email is samlau163.com", ^{
        it(@"should return YES", ^{
            BOOL result = [DataValidation isValidEmail:@"samlau163.com"];
            [[theValue(result) should] beNo];
        });
    });
    
    context(@"when password is sam", ^{
        it(@"should return NO", ^{
            BOOL result = [DataValidation isValidPassword:@"sam"];
            [[theValue(result) should] beNo];
        });
    });
    
    context(@"when password is samlau", ^{
        it(@"should return YES", ^{
            BOOL result = [DataValidation isValidPassword:@"samlau"];
            [[theValue(result) should] beYes];
        });
    });
});

SPEC_END
