//
//  FoodListClient.m
//  RACUnitTest
//
//  Created by Sam Lau on 9/1/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <ReactiveCocoa.h>
#import <AFHTTPSessionManager+RACSupport.h>

#import "FoodListClient.h"
#import "URLHelper.h"

@implementation FoodListClient

+ (RACSignal *)fetchFoodList
{
    return [[[AFHTTPSessionManager manager] rac_GET:[URLHelper URLWithResourcePath:@"/v1/foodlist"] parameters:nil] replayLazily];
}


@end
