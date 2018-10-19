//
//  Singleton.m
//  LessonThread
//
//  Created by lanouhn on 15/12/1.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton
+ (id)mainSingleton {
    static Singleton *singleton = nil;
//    @synchronized(self) {//防止单例重复创建
//        if (!singleton) {
//            singleton = [[Singleton alloc] init];
//        }
//    }
    
    //GCD
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //写只执行一次的代码(单例的创建)
        singleton = [[Singleton alloc] init];
        NSLog(@"%p+++++++++", singleton);
    });
    return singleton;
}
@end
