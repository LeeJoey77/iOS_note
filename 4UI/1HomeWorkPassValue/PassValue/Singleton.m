//
//  Singleton.m
//  PassValue
//
//  Created by lanouhn on 15/12/24.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton
//便利构造器创建单例
+ (Singleton *)mainSingleton {
    static Singleton *singleton = nil;
    //GCD
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //写只执行一次的代码
        singleton = [[Singleton alloc] init];
    });
    return singleton;
}

@end
