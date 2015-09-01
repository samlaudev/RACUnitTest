//
//  FoodModel.m
//  RACUnitTest
//
//  Created by Sam Lau on 9/1/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "FoodModel.h"

@implementation FoodModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
            @"foodImageURL": @"food_url",
            @"foodPrice": @"price",
            @"saleNumber": @"sale_number"
    };
}

@end
