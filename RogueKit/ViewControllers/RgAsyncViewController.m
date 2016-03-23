    //
//  RgAsyncViewController.m
//  RogueKitDemo
//
//  Created by Rogue on 16/3/17.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgAsyncViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface RgAsyncViewController ()<ASTableViewDelegate, ASTableViewDataSource>

@property (nonatomic, strong) ASTableView *table;

@end

@implementation RgAsyncViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadSubView];
    [self loadLayout];
}

- (void)loadSubView {

    _table = [[ASTableView alloc] initWithFrame:CGRectZero];
    _table.asyncDataSource = self;
    _table.asyncDelegate = self;
    [self.view addSubview:_table];

}

- (void)loadLayout {

    [_table mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top).offset(80);
        make.bottom.equalTo(self.view.mas_bottom);
    }];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 2;

}


@end
