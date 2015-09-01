//
//  FoodModel.h
//  RACUnitTest
//
//  Created by Sam Lau on 9/1/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <Mantle.h>

@interface FoodModel : MTLModel <MTLJSONSerializing>

/*
 @brief 食物图片URL
 */
@property (copy, nonatomic) NSString *foodImageURL;
/*
 @brief 食物价格
 */
@property (copy, nonatomic) NSString *foodPrice;
/*
 @brief 销量
 */
@property (copy, nonatomic) NSString *saleNumber;

@end
