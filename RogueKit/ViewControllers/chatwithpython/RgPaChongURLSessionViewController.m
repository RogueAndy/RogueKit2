//
//  RgPaChongURLSessionViewController.m
//  RogueKitDemo
//
//  Created by rogue on 2016/11/16.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgPaChongURLSessionViewController.h"
//#import "RgNetWorkObject.h"
#import "RgPaChongModel.h"
#import "UIImageView+AFNetworking.h"


@interface RgPaChongSessionCell : UITableViewCell

@property (nonatomic, strong) UIImageView *headImage;

@property (nonatomic, strong) UILabel *headLabel;

@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation RgPaChongSessionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self loadSubview];
        [self loadLayout];
        
    }
    
    return self;
    
}

- (void)loadSubview {
    
    self.headImage = [[UIImageView alloc] init];
    self.headLabel = [[UILabel alloc] init];
    self.contentLabel = [[UILabel alloc] init];
    
    self.headLabel.textColor = [UIColor colorWithRed:50/255.f green:50/255.f blue:50/255.f alpha:1];
    self.contentLabel.textColor = [UIColor colorWithRed:150/255.f green:150/255.f blue:150/255.f alpha:1];
    self.headLabel.font = [UIFont systemFontOfSize:14];
    self.contentLabel.font = [UIFont systemFontOfSize:13];
    
    [self.contentView addSubview:self.headImage];
    [self.contentView addSubview:self.headLabel];
    [self.contentView addSubview:self.contentLabel];
    
}

- (void)loadLayout {
    
    self.headImage.frame = CGRectMake(20, 15, 90, 50);
    self.headLabel.frame = CGRectMake(self.headImage.frame.origin.x + self.headImage.frame.size.width + 10, self.headImage.frame.origin.y, 180, 20);
    self.contentLabel.frame = CGRectMake(self.headLabel.frame.origin.x, self.headLabel.frame.origin.y + self.headLabel.frame.size.height + 5, self.headLabel.frame.size.width, 25);
    
}

- (void)setModel:(RgPaChongModel *)model {
    
    [self.headImage setImageWithURL:[NSURL URLWithString:model.imgtitle] placeholderImage:[UIImage imageNamed:@"ddd.jpg"]];
    self.headLabel.text = model.imgaddress;
    
}

@end






@interface RgPaChongURLSessionViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *table;

@property (nonatomic, strong) NSMutableArray<RgPaChongModel *> *models;

@end

@implementation RgPaChongURLSessionViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIButton *showPaChong = [UIButton buttonWithType:UIButtonTypeCustom];
    showPaChong.backgroundColor = [UIColor orangeColor];
    [showPaChong addTarget:self action:@selector(pachongAction:) forControlEvents:UIControlEventTouchUpInside];
    showPaChong.frame = CGRectMake(20, 100, CGRectGetWidth(self.view.frame) - 40, 40);
    [self.view addSubview:showPaChong];
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc] initWithTitle:@"换一批" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction:)];
    self.navigationItem.rightBarButtonItem = rightBar;
    
    self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 64)];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview:self.table];
    
}

- (void)pachongAction:(UIButton *)sender {
    
//    NSLog(@"-----------准备 显示爬虫数据");
//    [RgNetWorkObject postMethod:@"showPaChongToIOS/"
//                     parameters:nil
//                       complete:^(NSDictionary *response, RogueNetWorkType networkType) {
//                           
//                           NSLog(@"%@", response);
//                           
//                       }];
    
    
}

- (void)rightAction:(UIBarButtonItem *)sender {
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSString *urlString = @"http://0.0.0.0:8000/showPaChongToIOS/";
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    request.HTTPMethod = @"POST";
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"%@", dictionary);
        
    }];
    
    [dataTask resume];
    
    
//    __weak RgPaChongViewController *weakSelf = self;
//    [RgNetWorkObject postMethod:@"showPaChongToIOS/"
//                     parameters:nil
//                       complete:^(NSDictionary *response, RogueNetWorkType networkType) {
//                           
//                           if(!weakSelf.models) {
//                               
//                               weakSelf.models = [NSMutableArray new];
//                               
//                           }
//                           
//                           [weakSelf.models removeAllObjects];
//                           [weakSelf.models addObjectsFromArray:[RgPaChongModel transformWithArray:[response objectForKey:@"imgurls"]]];
//                           [weakSelf.table reloadData];
//                           
//                       }];
    
}

#pragma mark - TableView Delegate


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.models.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identity = @"rgpachongcell";
    RgPaChongSessionCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if(!cell) {
        
        cell = [[RgPaChongSessionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
        
    }
    
    [cell setModel:[self.models objectAtIndex:indexPath.row]];
    
    return cell;
    
}

@end
