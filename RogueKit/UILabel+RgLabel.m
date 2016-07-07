//
//  UILabel+RgLabel.m
//  RogueKitDemo
//
//  Created by Rogue on 16/7/7.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "UILabel+RgLabel.h"

@implementation UILabel (RgLabel)

- (CGFloat)height {
    
    CGSize size = self.frame.size;
    
    if([NSValue valueWithCGSize:size] == [NSValue valueWithCGSize:CGSizeZero]) {
    
        size = [[UIScreen mainScreen] bounds].size;
        
    }
    
    return [self sizeThatFits:CGSizeMake(size.width, CGFLOAT_MAX)].height;

}

@end
