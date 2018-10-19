//
//  NSString+SayHi.m
//  LessonCategory
//
//  Created by lanouhn on 15/10/22.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "NSString+SayHi.h"

@implementation NSString (SayHi)

- (void)sayHi {
    NSLog(@"hello world!");
}

+ (void)sayHello {
    NSLog(@"你好");
}

//添加获取首字母,不是大写,改成大写
- (NSString *)first {
    NSString *str = [[self substringToIndex:1] uppercaseString];
    return str;
}

//添加获取尾字母,不是小写,改成小写
- (NSString *)last {
    NSInteger length = [self length];
    NSString *str = [[self substringFromIndex:length - 1] lowercaseString];
    return str;
}





























@end
