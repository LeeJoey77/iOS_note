//
//  NetManager.h
//  AFNet
//
//  Created by TongLi on 15/12/6.
//  Copyright © 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
typedef  void(^SuccessResultBlock)(id successResult);
typedef  void(^ErrorResultBlock)(NSError *errorResult);

typedef void(^ProgressBlock)(NSInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead);

@interface NetManager : NSObject


+ (NetManager *)shareInstance;
//get请求
+ (void)getRequestWithURL:(NSString *)requestURL withContentType:(NSString *)contentType withSuccessResult:(SuccessResultBlock)successResult withError:(ErrorResultBlock)errorResult;
//post请求
- (void)postRequestWithURL:(NSString *)requestURL withParameters:(NSDictionary *)parametersDic withContentTypes:(NSString *)contentType  withSuccessResult:(SuccessResultBlock)successResult withError:(ErrorResultBlock)errorResult ;

//下载
- (void)downLoadRequestWithURLString:(NSString *)requestURLString withFilePath:(NSString *)filePath withProgressBlock:(ProgressBlock)progressBlock withSuccessResult:(SuccessResultBlock)successResult withError:(ErrorResultBlock)errorResult ;
@end
