//
//  RgNetWorkObject.m
//  RogueKitDemo
//
//  Created by Rogue on 16/3/17.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RgNetWorkObject.h"
#import <AFNetworking/AFNetworking.h>

static RgNetWorkObject *share = nil;

@interface RgNetWorkObject()

@property (nonatomic, strong) AFHTTPSessionManager *jsonManager;

@end

@implementation RgNetWorkObject

+ (instancetype)shareInstance {

    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        share = [[self alloc] init];
        share.jsonManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://localhost:8080/ConnectDemo/"] sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        
    });
    
    return  share;
    
}

+ (void)postMethod:(NSString *)method parameters:(NSDictionary *)parameters complete:(void (^)(NSDictionary *response, RogueNetWorkType networkType))complete {

    [[self shareInstance] postMethod:method parameters:parameters complete:complete];

}

- (void)postMethod:(NSString *)method parameters:(NSDictionary *)parameters complete:(void (^)(NSDictionary *response, RogueNetWorkType networkType))complete {

    [_jsonManager POST:method parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {

    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        complete(responseObject, [responseObject[@"status"] isEqualToString:@"success"] ? RogueNetWorkRight : RogueNetWorkWrong);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        complete(@{@"error": @"返回Json出错"}, RogueNetWorkSystemWrong);
    }];
    
}

@end
