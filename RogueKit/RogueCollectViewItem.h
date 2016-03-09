//
//  RogueCollectViewItem.h
//  RogueKitDemo
//
//  Created by Rogue on 16/3/7.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RogueCollectViewItem : UIView

+ (instancetype)initWithFrame:(CGRect)frame index:(NSInteger)index withTitle:(NSString *)title;

@property (nonatomic, strong) void (^longPressBlock)(NSInteger);

@property (nonatomic, strong) void (^deleteBlock)(NSInteger);

@property (nonatomic, strong) void (^touchBlock)(NSInteger);

@end
