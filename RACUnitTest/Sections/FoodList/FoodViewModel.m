//
//  FoodViewModel.m
//  RACUnitTest
//
//  Created by Sam Lau on 9/1/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <ReactiveCocoa.h>

#import "FoodViewModel.h"
#import "FoodListClient.h"
#import "FoodModel.h"

@interface FoodViewModel()

@end

@implementation FoodViewModel

- (instancetype)init
{
    self = [super init];

    if (!self) {
        return nil;
    }

    RAC(self, foodModelList) = [[FoodListClient fetchFoodList] map:^id(RACTuple * tuple) {
        return [MTLJSONAdapter modelsOfClass:[FoodModel class] fromJSONArray:tuple.first error:nil];
    }];

    return self;
}

@end
