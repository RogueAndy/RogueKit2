//
//  RgFMDBViewController.m
//  RogueKitDemo
//
//  Created by Rogue on 16/3/24.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgFMDBViewController.h"
#import <FMDBMigrationManager/FMDBMigrationManager.h>
#import <FMDB/FMDB.h>

@implementation RgFMDBViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    UIButton *storeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [storeButton setBackgroundColor:[UIColor redColor]];
    [storeButton addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    storeButton.frame = CGRectMake(20, 100, 60, 40);
    [self.view addSubview:storeButton];
    
    UIButton *printButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [printButton setBackgroundColor:[UIColor blueColor]];
    [printButton addTarget:self action:@selector(printAction) forControlEvents:UIControlEventTouchUpInside];
    printButton.frame = CGRectMake(110, 100, 60, 40);
    [self.view addSubview:printButton];
    
    UIButton *removeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [removeButton setBackgroundColor:[UIColor orangeColor]];
    [removeButton addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    removeButton.frame = CGRectMake(200, 100, 100, 40);
    [self.view addSubview:removeButton];
    
    UIButton *qianyiButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [qianyiButton setBackgroundColor:[UIColor grayColor]];
    [qianyiButton addTarget:self action:@selector(qianyiAction) forControlEvents:UIControlEventTouchUpInside];
    qianyiButton.frame = CGRectMake(200, 100, 100, 40);
    [self.view addSubview:qianyiButton];
    
}

- (void)leftAction {

    NSLog(@"左边");
    
    [self createSQLiteTable];
//    FMDatabase *database = [[FMDatabase alloc] initWithPath:@""];

}

- (void)printAction {

    NSLog(@"中间");
    [self queryData];

}

- (void)rightAction {

    NSLog(@"右边");
    [self insertData];

}

- (void)qianyiAction {

    NSLog(@"迁移");
    
    FMDBMigrationManager *manager = [FMDBMigrationManager managerWithDatabaseAtPath:[[self getSQLitePath] stringByAppendingPathComponent:@"person"] migrationsBundle:[NSBundle mainBundle]];
    NSError *error;
    BOOL resultState = NO;
    if (!manager.hasMigrationsTable) {
        resultState =[manager createMigrationsTable:&error];
    }
    resultState = [manager migrateDatabaseToVersion:UINT16_MAX progress:nil error:&error];
    NSLog(@"Has `schema_migrations` table?: %@", manager.hasMigrationsTable ? @"YES" : @"NO");
    NSLog(@"Origin Version: %llu", manager.originVersion);
    NSLog(@"Current version: %llu", manager.currentVersion);
    NSLog(@"All migrations: %@", manager.migrations);
    NSLog(@"Applied versions: %@", manager.appliedVersions);
    NSLog(@"Pending versions: %@", manager.pendingVersions);

}

#pragma mark - 创建数据库 sqlite

- (void)createSQLiteTable {
    
    FMDatabase *database = [FMDatabase databaseWithPath:[self getSQLitePath]];
    if(![database open]) {
    
        NSLog(@"------打开数据库失败");
        
    }
    
    if([database executeUpdate:@"create table if not exists person(age integer, name text, sex text)"]) {
        
        NSLog(@"-----新建数据库");
        
    } else {
        
        NSLog(@"-----数据库已存在");
        
    }
    
    [database close];
    
}

- (void)queryData {

    FMDatabase *database = [FMDatabase databaseWithPath:[self getSQLitePath]];
    if([database open]) {
    
        FMResultSet *rs = [database executeQuery:@"select * from person"];
        while ([rs next]) {
            
            NSLog(@"%@ --- %@", [rs stringForColumn:@"name"], [rs stringForColumn:@"sex"]);
            
        }
        
        [rs close];
        [database close];
        
    }
    
}

- (void)insertData {

    FMDatabase *database = [FMDatabase databaseWithPath:[self getSQLitePath]];
    if(![database open]) {
    
        NSLog(@"插入数据失败");
        return ;
    
    }
    [database beginTransaction];
    [database executeUpdate:@"insert into person (age, name, sex) values(?, ?, ?)", @"18", @"大钟哥", @"男"];
    [database commit];
    [database close];

}


#pragma mark - 数据库 sqlite 的路径

- (NSString *)getSQLitePath {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [[paths firstObject] stringByAppendingPathComponent:@"rogue"];
    return path;
    
}

@end
