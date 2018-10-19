//
//  NetManager.m
//  AFNetworking_3
//
//  Created by lanouhn on 15/12/11.
//  Copyright (c) 2015年 李杨. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager

//单例没有属性时,可以不用创建
//创建单例
//+ (id)shareInstance {
//    static NetManager *manager = nil;
//    //GCD
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        //写只执行一次的代码
//        manager = [[NetManager alloc] init];
//    });
//    return manager;
//}

//AFN是异步连接<系统默认开辟子线程完成网络请求的任务>
//用Block封装AFN的GET请求
+ (void)getRequestWithURL:(NSString *)requestURL withContentTypes:(NSSet *)contentTypes withSuccessResult:(SuccessResult)successResult withErrorResult:(ErrorResult)errorResult {

    //创建一个manager,manager是一个单例
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //设置解析所支持的格式 (如果设置 请求 所支持的格式的话,只需把responseSerializer换成requestSerializer就可以)
    manager.responseSerializer.acceptableContentTypes = contentTypes;

    //把返回的格式设置为二进制格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //把返回格式设置为json格式 (这是系统默认的)
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //参数1: URL;  参数2: 参数(get一般为nil); 参数3: 请求成功后的block 参数4: 请求失败的block
    [manager GET:requestURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //通过block回调到Controller中
        successResult(responseObject);
//        NSLog(@"%@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        //通过block回调到Controller中
        errorResult(error);
//        NSLog(@"%@", error);
    }];
}

//用Block封装AFN的POST请求
+ (void)POSTRequestWithURL:(NSString *)requestURL withParameters:(NSDictionary *)parameters withContentTypes:(NSSet *)contentTypes withSuccessResult:(SuccessResult)successResult withErrorResult:(ErrorResult)errorResult {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer.acceptableContentTypes = contentTypes;
    
    //参数2: 一般是字典类型
    [manager POST:requestURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //通过block回调到Controller中
        successResult(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //通过block回调到Controller中
        errorResult(error);
    }];
}

@end
