//
//  RgTextField.m
//  RogueKitDemo
//
//  Created by Rogue on 16/1/22.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgTextField.h"

@interface RgTextField ()

@property (nonatomic, assign) CGFloat editEdge;

@end

@implementation RgTextField

+ (instancetype)initWithEditEdge:(CGFloat)edge frame:(CGRect)frame {

    RgTextField *text = [[RgTextField alloc] initWithFrame:CGRectZero];
    text.editEdge = edge;
    return text;

}

- (CGRect)editingRectForBounds:(CGRect)bounds {

    return CGRectInset(bounds, _editEdge, 0);

}

- (CGRect)textRectForBounds:(CGRect)bounds {

    return CGRectInset(bounds, _editEdge, 0);

}

- (CGRect)placeholderRectForBounds:(CGRect)bounds {

    return CGRectInset(bounds, _editEdge, 0);

}

@end
