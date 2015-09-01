//
//  FoodListViewController.m
//  RACUnitTest
//
//  Created by Sam Lau on 9/1/15.
//  Copyright (c) 2015 Sam Lau. All rights reserved.
//

#import "FoodListViewController.h"
#import "MASConstraintMaker.h"
#import "View+MASAdditions.h"
#import "FoodViewModel.h"
#import "ArrayDataSource.h"
#import "FoodCell.h"
#import "FoodModel.h"

#import <ReactiveCocoa.h>

static NSString *const kFoodCellIdentifier = @"FoodCell";

@interface FoodListViewController()

#pragma mark - UI properties
@property (strong, nonatomic) UITableView *tableView;

#pragma mark - View model
@property (strong, nonatomic) FoodViewModel *foodViewModel;

#pragma mark - Data source
@property (strong, nonatomic) ArrayDataSource *foodListDataSource;

@end

@implementation FoodListViewController

#pragma mark - Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // setup title name and background color
    self.title = @"食物列表";
    self.view.backgroundColor = [UIColor whiteColor];
    // build view hierarchy
    [self buildViewHierarchy];
    // when finish fetching data and reload table view
    [RACObserve(self.foodViewModel, foodModelList) subscribeNext:^(NSArray *items) {
        self.foodListDataSource.items = items;
        [self.tableView reloadData];
    }];
}

- (void)buildViewHierarchy
{
   [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.dataSource = self.foodListDataSource;
        _tableView.rowHeight = 200.0f;

        [_tableView registerClass:[FoodCell class] forCellReuseIdentifier:kFoodCellIdentifier];
    }
    return _tableView;
}

- (FoodViewModel *)foodViewModel
{
    if (!_foodViewModel) {
        _foodViewModel = [FoodViewModel new];
    }
    return _foodViewModel;
}

- (ArrayDataSource *)foodListDataSource
{
    if (!_foodListDataSource) {
        _foodListDataSource = [[ArrayDataSource alloc] initWithItems:self.foodViewModel.foodModelList
                                                      cellIdentifier:kFoodCellIdentifier configureCellBlock:^(FoodCell *cell, FoodModel *model) {
            [cell updateCellWithModel:model];
        }];
    }
    return _foodListDataSource;
}


@end
