//
//  RgPaChongModel.h
//  RogueKitDemo
//
//  Created by rogue on 2016/10/27.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RogueBaseModel.h"

@interface RgPaChongModel : RogueBaseModel

@property (nonatomic, strong) NSString *imgaddress;

@property (nonatomic, strong) NSString *imgtitle;

@property (nonatomic, strong) NSString *imgfromurl;

+ (instancetype)transformWithDictionary:(NSDictionary *)dictionary;

+ (NSArray<RgPaChongModel *> *)transformWithArray:(NSArray *)array;

@end
