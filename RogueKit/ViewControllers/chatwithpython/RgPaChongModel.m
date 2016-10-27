//
//  RgPaChongModel.m
//  RogueKitDemo
//
//  Created by rogue on 2016/10/27.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgPaChongModel.h"

@implementation RgPaChongModel

+ (instancetype)transformWithDictionary:(NSDictionary *)dictionary {

    RgPaChongModel *model = [RgPaChongModel new];
    model.imgtitle = [dictionary objectForKey:@"imgtitle"];
    model.imgaddress = [dictionary objectForKey:@"imgaddress"];
    model.imgfromurl = [dictionary objectForKey:@"imgfromurl"];
    
    return model;

}

+ (NSArray<RgPaChongModel *> *)transformWithArray:(NSArray *)array {

    NSMutableArray *current = [NSMutableArray new];
    for (NSDictionary *dictionary in array) {
    
        [current addObject:[self transformWithDictionary:dictionary]];
    
    }
    
    return current;

}

@end
