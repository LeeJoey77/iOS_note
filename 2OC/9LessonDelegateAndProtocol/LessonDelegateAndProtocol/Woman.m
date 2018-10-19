//
//  Woman.m
//  LessonDelegateAndProtocol
//
//  Created by lanouhn on 15/10/28.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Woman.h"

@implementation Woman

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
+ (id)womanWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age {
    Woman *woman = [[Woman alloc] initWithName:name gender:gender age:age];
    return woman;
}


//地脏了
- (void)floorDirty {
    //让代理干活
    [self.delegate cleanHouse];
}
//衣服脏了
- (void)clothesDirty {
    [self.delegate washClothes];
}
//饿了
- (void)hungry {
    [self.delegate cook];
}
//optional
//生孩子
- (void)lonely {
    //判断代理是否答应(实现相应的方法 --- giveBirthToChild)干这件事,如果代理实现了这个方法(giveBirthToChild),那么此时让代理去干活(触发该方法 --- giveBirthToChild)即可
    if ([self.delegate respondsToSelector:@selector(giveBirthToChild)]) {
        [self.delegate giveBirthToChild];
    }
    
}

@end
