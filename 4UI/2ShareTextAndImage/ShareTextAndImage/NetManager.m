//
//  NetManager.m
//  AFNet
//
//  Created by TongLi on 15/12/6.
//  Copyright © 2015年 lanouhn. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager
+ (NetManager *)shareInstance{
    static NetManager *netManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netManager = [[NetManager alloc]init];
        
    });
    return netManager;
}

//get请求
+ (void)getRequestWithURL:(NSString *)requestURL withContentType:(NSString *)contentType withSuccessResult:(SuccessResultBlock)successResult withError:(ErrorResultBlock)errorResult {
    //网络请求操作管理
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //设置请求格式和返回格式(默认分别为http和json)
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    //返回格式设为二进制
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //支持的返回类型
    if (contentType != nil && ![contentType isEqualToString:@""]) {
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:contentType];
    }
    //开始get请求
    [manager GET:requestURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //请求成功
        successResult(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //请求失败
        errorResult(error);
    }];
    
    
}

- (void)postRequestWithURL:(NSString *)requestURL withParameters:(NSDictionary *)parametersDic withContentTypes:(NSString *)contentType  withSuccessResult:(SuccessResultBlock)successResult withError:(ErrorResultBlock)errorResult {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    if (contentType != nil && ![contentType isEqualToString:@""]) {
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:contentType];
    }
    [manager POST:requestURL parameters:parametersDic success:^(AFHTTPRequestOperation *operation, id responseObject) {
        successResult(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        errorResult(error);
    }];
    
}


- (void)downLoadRequestWithURLString:(NSString *)requestURLString withFilePath:(NSString *)filePath withProgressBlock:(ProgressBlock)progressBlock withSuccessResult:(SuccessResultBlock)successResult withError:(ErrorResultBlock)errorResult {
    //创建下载请求。cachePolicy：缓存策略
    NSURLRequest *URLRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:requestURLString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:-1];
    //1.创建请求操作对象
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:URLRequest];
    //2.制定下载的地址
    //参数append，其实就是当再次请求的时候，是从数据后面跟着拼接还是重新覆盖，NO就是重新覆盖，YES就是拼接的意思
    operation.outputStream = [[NSOutputStream alloc]initToFileAtPath:filePath append:NO];
    //3.检测下载进度，（可选）
    //参数1：每次下载的大小；参数2：已经下载的大小；参数3：文件的总大小。
    [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        NSLog(@"a");
        progressBlock(bytesRead, totalBytesRead, totalBytesExpectedToRead);
    }];
    
    //4.下载后的方法
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        //下载成功
        successResult(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //下载失败
        errorResult(error);
    }];
    //开启该任务
    [operation start];
    
}

















@end
