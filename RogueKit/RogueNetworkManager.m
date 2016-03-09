//
//  RogueNetworkManager.m
//  RogueKitDemo
//
//  Created by Rogue on 16/1/21.
//  Copyright © 2016年 Rogue. All rights reserved.
//

#import "RogueNetworkManager.h"
//#import <AFNetworking/AFNetworking.h>

//static RogueNetworkManager *manager = nil;
//static NSString *BaseURL = @"http://localhost:8080/ConnectDemo/";

@interface RogueNetworkManager()

@end

@implementation RogueNetworkManager

//+ (instancetype)shareInstance {
//
//    static dispatch_once_t once;
//    dispatch_once(&once, ^{
//        
//        manager = [[self alloc] init];
//        
//    });
//    
//    return manager;
//
//}
//
//+ (void)sesstionConfigure {
//    
//    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
//
//    [session POST:@"http://localhost:8080/ConnectDemo/getUserWithUserId"
//       parameters:@{@"userid": @"11103080235"}
//constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
//    
//}
//         progress:^(NSProgress * _Nonnull uploadProgress) {
//             
//         }
//          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//              NSLog(@"dwad");
//              NSLog(@"%@", responseObject);
//          }
//          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//              NSLog(@"dawdawwadwa");
//          }];
//
//}
//
//+ (void)apiMethod:(NSString *)method parameters:(NSDictionary *)parameter completeBlock:(void (^)(BOOL status, NSDictionary *responseObj, NSString *responseMessage))complete {
//
//    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
//    
//    [session POST:[BaseURL stringByAppendingString:method] parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        if([[responseObject objectForKey:@"status"] isEqualToString:@"success"]) {
//            complete(YES, responseObject, [responseObject objectForKey:@"message"]);
//        } else {
//            complete(NO, responseObject, [responseObject objectForKey:@"message"]);
//        }
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        complete(NO, nil, @"返回数据失败，报错!");
//    }];
//
//}
//
//+ (void)apiMethod:(NSString *)method stream:(NSData *)datas parameters:(NSDictionary *)parameter completeBlock:(void (^)(BOOL, NSDictionary *, NSString *))complete {
//
//    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
//    
//    
//    [session POST:[BaseURL stringByAppendingString:method] parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
////        [formData appendPartWithFileData:datas name:@"files" fileName:@"files.jpg" mimeType:@"image/jpeg"];
//    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@", responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@", error);
//    }];
//
//}

@end
