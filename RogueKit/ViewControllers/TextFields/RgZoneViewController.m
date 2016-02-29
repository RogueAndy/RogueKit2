//
//  RgZoneViewController.m
//  RogueKitDemo
//
//  Created by Rogue on 16/1/25.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgZoneViewController.h"

@interface RgZoneViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *table;

@end

@implementation RgZoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.title = @"Zone";
    
    [self loadSubView];
    [self loadLayout];
}

- (void)loadSubView {

    _table = [[UITableView alloc] initWithFrame:CGRectZero];
    _table.delegate = self;
    _table.dataSource = self;
    UIView *clearView = [UIView new];
    clearView.backgroundColor = [UIColor clearColor];
    [_table setTableFooterView:clearView];
    [self.view addSubview:_table];

}

- (void)loadLayout {

    [_table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
    }];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 5;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 50;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *identity = @"hahaha";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
    }
    
    return cell;

}

@end
