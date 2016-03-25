//
//  RgKeyChainViewController.m
//  RogueKitDemo
//
//  Created by Rogue on 16/3/24.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgKeyChainViewController.h"
#import <UICKeyChainStore/UICKeyChainStore.h>

@implementation RgKeyChainViewController

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
    
//    [self loadDatas];
    
}

- (void)leftAction {

//    UICKeyChainStore *keyChain = [UICKeyChainStore keyChainStoreWithService:@"com.rogue.RogueKitDemo"];
//    [keyChain setString:@"存储第一条数据" forKey:@"first"];
//    [keyChain setString:@"存储第二条数据" forKey:@"second"];
    
    [UICKeyChainStore setString:@"存储第三条数据" forKey:@"third"];
    
    UICKeyChainStore *newKey = [UICKeyChainStore keyChainStoreWithService:@"com.sxit"];
    [newKey setString:@"第二个服务" forKey:@"third"];

}

- (void)printAction {

    UICKeyChainStore *keyChain = [UICKeyChainStore keyChainStoreWithService:@"com.rogue.RogueKitDemo"];
    NSLog(@"%@\n%@\n%@", keyChain[@"first"], keyChain[@"second"], [UICKeyChainStore stringForKey:@"third"]);
    
    UICKeyChainStore *newKey = [UICKeyChainStore keyChainStoreWithService:@"com.sxit"];
    NSLog(@"%@----%@", [UICKeyChainStore stringForKey:@"third"], newKey[@"third"]);

}

- (void)rightAction {

//    UICKeyChainStore *keyChain = [UICKeyChainStore keyChainStoreWithService:@"com.rogue.RogueKitDemo"];
//    [keyChain removeAllItems];
//    [keyChain removeItemForKey:@"first"];
    [UICKeyChainStore removeItemForKey:@"third"];
}

- (void)testUserDefaults {

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setObject:@"今天" forKey:@"today"];
//    [defaults setObject:@"明天" forKey:@"tomorrow"];
    [defaults synchronize];
 
    NSLog(@"%@", [defaults objectForKey:@"today"]);
}

- (void)loadDatas {
    
    UICKeyChainStore *keyChain = [UICKeyChainStore keyChainStoreWithService:@"com.example.github-token"];
//    [keyChain setString:@"今天哈哈哈哦哦哦心情不好呀才怪" forKey:@"today"];
//    [keyChain setString:@"what a fuck day,hahaha,no" forKey:@"english"];
    NSString *token = keyChain[@"today"];
    NSLog(@"%@\n%@", token, keyChain[@"english"]);
    
}

@end
