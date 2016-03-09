//
//  RogueCollectView.m
//  RogueKitDemo
//
//  Created by Rogue on 16/3/7.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RogueCollectView.h"
#import "RogueCollectViewItem.h"

typedef NS_ENUM(NSInteger, RgItemStatus) {

    RgNo    = 0,
    RgLongPress = 1,
    RgTouch = 2

};

static NSInteger ItemBeginIndex = 30000;

@interface RogueCollectView()

/**
 *  手指触点所在的临时位置
 */

@property (nonatomic, assign) CGPoint touchCurrentPoint;

@property (nonatomic, assign) RgItemStatus itemStatus;

@property (nonatomic, strong) RogueCollectViewItem *selectedItem;

@property (nonatomic, strong) UIScrollView *scroll;

@property (nonatomic, strong) NSMutableArray<NSString *> *itemDatas;

@end

@implementation RogueCollectView

+ (instancetype)initWithFrame:(CGRect)frame datas:(NSArray<NSString *> *)datas {
    
    RogueCollectView *view = [[RogueCollectView alloc] initWithFrame:frame];
    view.itemDatas = [NSMutableArray arrayWithArray:datas];
    return view;
    
}

- (instancetype)initWithFrame:(CGRect)frame {

    if(self = [super initWithFrame:frame]) {
    
        [self loadDatas];
        [self loadSubView];
        [self loadLayout];
        
    }
    
    self.backgroundColor = [UIColor whiteColor];
    
    return self;

}

- (void)setItemDatas:(NSMutableArray<NSString *> *)itemDatas {

    _itemDatas = itemDatas;
    
    CGFloat width = CGRectGetWidth(self.frame) / 4.0;
    CGFloat height = width;
    if (_itemDatas.count % 4 == 0) {
        _scroll.contentSize = CGSizeMake(CGRectGetWidth(self.frame), height * (_itemDatas.count / 4));
    } else {
        _scroll.contentSize = CGSizeMake(CGRectGetWidth(self.frame), height * (_itemDatas.count / 4 + 1));
    }
    
    NSInteger i = 0;
    __weak RogueCollectView *weakSelf = self;
    for(NSString *title in _itemDatas) {
    
        NSInteger xIndex = i % 4;
        NSInteger yIndex = i / 4;
        
        RogueCollectViewItem *item = [RogueCollectViewItem initWithFrame:CGRectMake(xIndex * width, yIndex * height, width, height) index:i withTitle:title];
        item.tag = ItemBeginIndex + i;
        [_scroll addSubview:item];
        [item setLongPressBlock:^(NSInteger index) {
            weakSelf.selectedItem = [weakSelf.scroll viewWithTag:ItemBeginIndex + i];
            [UIView animateWithDuration:0.25 animations:^{
                weakSelf.selectedItem.transform = CGAffineTransformMakeScale(1.2, 1.2);
                weakSelf.itemStatus = RgLongPress;
            }];
        }];
        
        [item setTouchBlock:^(NSInteger index) {
//            NSLog(@"---------");
        }];
        i++;
        
    }

}

- (void)loadDatas {

    self.itemDatas = RgNo;
    [self addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)]];

}

- (void)loadSubView {

    _scroll = [[UIScrollView alloc] init];
    [self addSubview:_scroll];
    
}

- (void)loadLayout {

    _scroll.frame = self.bounds;

}

- (void)longPressAction:(UILongPressGestureRecognizer *)gesture {

    switch (_itemStatus) {
        case RgNo:
        {
        
            switch (gesture.state) {
                case UIGestureRecognizerStateBegan:
                {
                
                    _itemStatus = RgLongPress;
                    _touchCurrentPoint = [gesture locationInView:gesture.view];
                
                }
                    break;
                    
                case UIGestureRecognizerStateChanged:
                {
                
                    
                
                }
                    break;
                
                case UIGestureRecognizerStateEnded:
                {
                    
                    
                
                }
                    break;
                    
                default:
                    break;
            }
            
        
        }
            break;
            
        case RgLongPress:
        {
        
            switch (gesture.state) {
                case UIGestureRecognizerStateBegan:
                {
                    
                    
                }
                    break;
                    
                case UIGestureRecognizerStateChanged:
                {
                    
//                    CGPoint touchPoint = [gesture locationInView:gesture.view];
                    
                }
                    break;
                    
                case UIGestureRecognizerStateEnded:
                {
                    
                    
                    
                }
                    break;
                    
                default:
                    break;
            }
            
        }
            break;
            
        case RgTouch:
        {
        
            
        
        }
            break;
            
    }

}

@end
