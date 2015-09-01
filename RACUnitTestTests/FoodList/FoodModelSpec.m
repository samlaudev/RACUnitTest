//
//  FoodModelSpec.m
//  RACUnitTest
//
//  Created by Sam Lau on 9/1/15.
//  Copyright 2015 Sam Lau. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import <ReactiveCocoa.h>

#import "FoodModel.h"
#import "FoodListClient.h"


SPEC_BEGIN(FoodModelSpec)

describe(@"FoodModel", ^{

    context(@"when JSON data convert to FoodModel", ^{
        __block BOOL successful = NO;
        __block NSError *error = nil;

        it(@"should return FoodModel array", ^{
            // get data from network
            RACSignal *result = [FoodListClient fetchFoodList];
            RACTuple *tuple = [result asynchronousFirstOrDefault:nil success:&successful error:&error];
            NSArray *foodList = tuple.first;

            // assert that foodList can't be empty
            [[theValue(successful) should] beYes];
            [[error should] beNil];
            [[foodList shouldNot] beEmpty];

            // assert that return FoolModel array
            NSArray *foodModelList = [MTLJSONAdapter modelsOfClass:[FoodModel class] fromJSONArray:foodList error:nil];
            [[foodModelList shouldNot] beEmpty];
            [[foodModelList[0] should] beKindOfClass:[FoodModel class]];
        });
    });
});

SPEC_END
