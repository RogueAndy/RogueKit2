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
        share.jsonManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://0.0.0.0:8000/"] sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
       
    });
    
    return  share;
    
}

#pragma mark - 外部调用静态方法

+ (void)postMethod:(NSString *)method parameters:(NSDictionary *)parameters complete:(void (^)(NSDictionary *response, RogueNetWorkType networkType))complete {

    [[self shareInstance] postMethod:method parameters:parameters complete:complete];

}

+ (void)getMethod:(NSString *)method parameters:(NSDictionary *)parameters complete:(void (^)(NSDictionary *response, RogueNetWorkType networkType))complete {

    [[self shareInstance] getMethod:method parameters:parameters complete:complete];

}

#pragma mark - 动态方法

- (void)postMethod:(NSString *)method parameters:(NSDictionary *)parameters complete:(void (^)(NSDictionary *response, RogueNetWorkType networkType))complete {
    
    [_jsonManager POST:method parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        complete(responseObject, [responseObject[@"status"] isEqualToString:@"1"] ? RogueNetWorkRight : RogueNetWorkWrong);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        complete(@{@"error": @"返回Json出错"}, RogueNetWorkSystemWrong);
    }];
    
}

- (void)getMethod:(NSString *)method parameters:(NSDictionary *)parameters complete:(void (^)(NSDictionary *response, RogueNetWorkType networkType))complete {
    
    [_jsonManager GET:method
           parameters:parameters
             progress:^(NSProgress * _Nonnull downloadProgress) {
                
             }
              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                  complete(responseObject, [responseObject[@"status"] isEqualToString:@"1"] ? RogueNetWorkRight : RogueNetWorkWrong);
              }
              failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                  complete(@{@"error": @"返回Json出错"}, RogueNetWorkSystemWrong);
              }];
    
}

@end
