//
//  RogueUserObject.m
//  RogueKitDemo
//
//  Created by Rogue on 16/3/23.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RogueUserObject.h"
#import <objc/runtime.h>

@implementation RogueUserObject

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if(self = [super init]) {
        
        Class selfClass = self.class;
        
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList(selfClass, &count);
        for(int i = 0; i < count; i++) {
            
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivars[i])];
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
            
        }
        
        [selfClass superclass];
        free(ivars);
        
    }
    
    return self;
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    Class selfClass = self.class;
    
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(selfClass, &count);
    
    for(int i = 0; i < count; i++) {
        
        Ivar ivar = ivars[i];
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        id value = [self valueForKey:key];
        [aCoder encodeObject:value forKey:key];
        
    }
    
    selfClass = [selfClass superclass];
    free(ivars);
    
}

@end
