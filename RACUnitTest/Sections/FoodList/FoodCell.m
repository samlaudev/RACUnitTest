//
//  FoodCell.m
//  RACUnitTest
//
//  Created by Sam Lau on 9/1/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "FoodCell.h"
#import "FoodModel.h"
#import "MASConstraintMaker.h"
#import "View+MASAdditions.h"

#import <UIImageView+WebCache.h>

@interface FoodCell()

#pragma mark - UI properties
/*
 @brief 食物图片
 */
@property (strong, nonatomic) UIImageView *foodImageView;
/*
 @brief 食物价格
 */
@property (strong, nonatomic) UILabel *foodPriceLabel;
/*
 @brief 食物销量
 */
@property (strong, nonatomic) UILabel *saleNumberLabel;
/*
 @brief 分隔界限view
 */
@property (strong, nonatomic) UIView *seperateView;

@end

@implementation FoodCell

#pragma mark - Views hierarchy and layout
- (void)addSubviews
{
    [self.contentView addSubview:self.foodImageView];
    [self.contentView addSubview:self.foodPriceLabel];
    [self.contentView addSubview:self.saleNumberLabel];
}

- (void)defineLayout
{
    [self.foodImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.top.equalTo(self.contentView);
        make.bottom.equalTo(self.contentView).with.offset(-50.0f);
    }];

    [self.foodPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(20.0f);
        make.top.equalTo(self.foodImageView.mas_bottom).with.offset(15.0f);
    }];

    [self.saleNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).with.offset(-20.0f);
        make.top.equalTo(self.foodPriceLabel);
    }];
}

#pragma mark - Views Lazy Initialization
- (UIImageView *)foodImageView
{
    if (!_foodImageView) {
        _foodImageView = [UIImageView new];
    }
    return _foodImageView;
}

- (UILabel *)foodPriceLabel
{
    if (!_foodPriceLabel) {
        _foodPriceLabel = [UILabel new];
        _foodPriceLabel.font = [UIFont systemFontOfSize:16.0f];
    }
    return _foodPriceLabel;
}

- (UILabel *)saleNumberLabel
{
    if (!_saleNumberLabel) {
        _saleNumberLabel = [UILabel new];
        _saleNumberLabel.font = [UIFont systemFontOfSize:16.0f];
    }
    return _saleNumberLabel;
}


#pragma mark - Update UI method
-(void)updateCellWithModel:(FoodModel *)model
{
    if(model) {
        [self.foodImageView sd_setImageWithURL:[NSURL URLWithString:model.foodImageURL]];
        self.foodPriceLabel.text = [NSString stringWithFormat:@"价格%@元", model.foodPrice];
        self.saleNumberLabel.text = [NSString stringWithFormat:@"已售%@份", model.saleNumber];
    }
}



@end
