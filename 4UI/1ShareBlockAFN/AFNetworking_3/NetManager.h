//
//  NetManager.h
//  AFNetworking_3
//
//  Created by lanouhn on 15/12/11.
//  Copyright (c) 2015年 李杨. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

//成功的Block
typedef void(^SuccessResult)(id successResult);
//失败的Block
typedef void(^ErrorResult)(NSError *errorResult);

@interface NetManager : NSObject

//单例没有属性时,可以不用创建
//创建单例
//+ (id)shareInstance;

//GET请求
+ (void)getRequestWithURL:(NSString *)requestURL withContentTypes:(NSSet *)contentTypes withSuccessResult:(SuccessResult)successResult withErrorResult:(ErrorResult)errorResult;


//POST请求
+ (void)POSTRequestWithURL:(NSString *)requestURL withParameters:(NSDictionary *)parameters withContentTypes:(NSSet *)contentTypes withSuccessResult:(SuccessResult)successResult withErrorResult:(ErrorResult)errorResult;

@end
