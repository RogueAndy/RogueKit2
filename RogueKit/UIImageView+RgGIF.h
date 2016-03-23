//
//  UIImageView+RgGIF.h
//  RogueKitDemo
//
//  Created by Rogue on 16/3/21.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (RgGIF)

/**
 *  根据动态图的名字，来生成对应的动态 imageView
 *
 *  @param name 动态图名称
 *
 *  @return 实体
 */

+ (instancetype)initWithGIFName:(NSString *)name;

@end
