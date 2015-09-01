//
//  FoodListClientSpec.m
//  RACUnitTest
//
//  Created by Sam Lau on 9/1/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <ReactiveCocoa.h>

#import "FoodListClient.h"

SPEC_BEGIN(FoodListClientSpec)

describe(@"FoodListClient", ^{

    context(@"when fetch food list ", ^{
        __block BOOL successful = NO;
        __block NSError *error = nil;

        it(@"should receive data", ^{
            RACSignal *result = [FoodListClient fetchFoodList];
            RACTuple *tuple = [result asynchronousFirstOrDefault:nil success:&successful error:&error];
            NSArray *foodList = tuple.first;

            [[theValue(successful) should] beYes];
            [[error should] beNil];
            [[foodList shouldNot] beEmpty];
        });
    });
});

SPEC_END
