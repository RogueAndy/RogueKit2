//
//  RgWebViewController.h
//  RogueKitDemo
//
//  Created by Rogue on 16/3/24.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import <TOWebViewController/TOWebViewController.h>

@interface RgWebViewController : TOWebViewController

+ (instancetype)initWithModel:(NSDictionary *)model;

- (void)refreshWebViewController;

@end
