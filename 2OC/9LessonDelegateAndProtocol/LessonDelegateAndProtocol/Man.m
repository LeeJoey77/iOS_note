//
//  Man.m
//  LessonDelegateAndProtocol
//
//  Created by lanouhn on 15/10/28.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Man.h"

@implementation Man
//自定义初始化
- (id)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age {
    self = [super init];
    if (self) {
        _name = name;
        _gender = gender;
        _age = age;
    }
    return self;
}
//便利构造器
+ (id)manWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age {
    Man *man = [[Man alloc] initWithName:name gender:gender age:age];
    return man;
}



#pragma mark --- WomanDelegate
//洗衣
- (void)washClothes {
    NSLog(@"男的你还不想洗衣服!");
}
//做饭
- (void)cook {
    NSLog(@"我能调凉菜! 顿顿吃凉菜吧");
}
//扫地
- (void)cleanHouse {
    NSLog(@"男人嘛,干些力所能及的,扫个地而已");
}

//生孩子
- (void)giveBirthToChild {
    NSLog(@"............");
}

@end
