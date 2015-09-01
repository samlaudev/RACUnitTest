//
//  FoodListClient.h
//  RACUnitTest
//
//  Created by Sam Lau on 9/1/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RACSignal;

@interface FoodListClient : NSObject

+ (RACSignal *)fetchFoodList;

@end
