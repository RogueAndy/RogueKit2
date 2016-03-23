
//
//  RogueCollectViewItem.m
//  RogueKitDemo
//
//  Created by Rogue on 16/3/7.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RogueCollectViewItem.h"

@interface RogueCollectViewItem ()

@property (nonatomic, assign) NSInteger itemIndex;

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation RogueCollectViewItem

+ (instancetype)initWithFrame:(CGRect)frame index:(NSInteger)index withTitle:(NSString *)title {

    RogueCollectViewItem *item = [[RogueCollectViewItem alloc] initWithFrame:frame];
    item.itemIndex = index;
    item.titleLabel.text = title;
    return item;

}

- (instancetype)initWithFrame:(CGRect)frame {

    if(self = [super initWithFrame:frame]) {
    
        [self loadDatas];
        [self loadSubView];
        [self loadLayout];
        
    }
    
    return self;
    
}

- (void)loadDatas {

    self.userInteractionEnabled = YES;
    self.layer.borderColor = [UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1].CGColor;
    self.layer.borderWidth = 0.5;
    
//    [self addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)]];
//    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touch:)]];

}

- (void)loadSubView {

    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame)-20, CGRectGetHeight(self.frame) - 20)];
//    _titleLabel.center = self.center;
    _titleLabel.font = [UIFont systemFontOfSize:13];
    [self addSubview:_titleLabel];
    
}

- (void)loadLayout {

    

}

- (void)longPress:(UILongPressGestureRecognizer *)gesture {

    if (_longPressBlock) {
    
        _longPressBlock(_itemIndex);
        
    }
    
}

- (void)touch:(UITapGestureRecognizer *)gesture {

    if (_touchBlock) {
    
        _touchBlock(_itemIndex);
        
    }

}

@end
