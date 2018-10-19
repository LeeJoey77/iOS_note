//
//  Singleton.m
//  LessonPassValue
//
//  Created by lanouhn on 15/11/11.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

//不能在此处手动释放,单例会在运行结束后自动释放,
+ (Singleton *)mainSingleton {
    //静态变量
    static Singleton *singleton = nil;
    if (!singleton) {
        singleton = [[Singleton alloc] init];
    }
    return singleton;
}

@end
