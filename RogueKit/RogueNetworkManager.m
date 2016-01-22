//
//  RogueNetworkManager.m
//  RogueKitDemo
//
//  Created by Rogue on 16/1/21.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RogueNetworkManager.h"
#import <AFNetworking/AFNetworking.h>

static RogueNetworkManager *manager = nil;

@interface RogueNetworkManager()



//@property (nonatomic, st

@end

@implementation RogueNetworkManager

+ (instancetype)shareInstance {

    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        manager = [[self alloc] init];
        
    });
    
    return manager;

}

+ (void)sesstionConfigure {
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];

    [session POST:@"http://localhost:8080/ConnectDemo/getUserWithUserId"
       parameters:@{@"userid": @"11103080235"}
constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    
}
         progress:^(NSProgress * _Nonnull uploadProgress) {
             
         }
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NSLog(@"dwad");
              NSLog(@"%@", responseObject);
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              NSLog(@"dawdawwadwa");
          }];

}

@end
