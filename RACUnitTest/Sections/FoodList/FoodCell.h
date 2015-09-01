//
//  FoodCell.h
//  RACUnitTest
//
//  Created by Sam Lau on 9/1/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import <SHPAbstractTableViewCell.h>
#import <UIKit/UIKit.h>

@class FoodModel;

@interface FoodCell : SHPAbstractTableViewCell

#pragma mark - Update UI method
-(void)updateCellWithModel:(FoodModel *)model;

@end
