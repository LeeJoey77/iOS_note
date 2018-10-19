//
//  Contact.m
//  LessonDataPersistence
//
//  Created by lanouhn on 15/11/20.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "Contact.h"

@implementation Contact
//自定义初始化
- (instancetype)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age phone:(NSString *)phone {
    self = [super init];
    if (self) {
        self.name = name;
        self.gender = gender;
        self.age = age;
        self.phone = phone;
    }
    return self;
}

#pragma mark --- NSCoding协议
//当第一个对象进行归档时,自动调用该方法,为该对象的实例变量进行归档操作
- (void)encodeWithCoder:(NSCoder *)aCoder {
    //内部要对每一个实例变量进行归档操作
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_gender forKey:@"gender"];
    [aCoder encodeObject:@(_age) forKey:@"age"];
    [aCoder encodeObject:_phone forKey:@"phone"];
}

//当对一个对象进行反归档时,自动调用该方法,为对象的实例变量进行反归档操作
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.gender = [aDecoder decodeObjectForKey:@"gender"];
        self.age = [[aDecoder decodeObjectForKey:@"age"] integerValue];
        self.phone = [aDecoder decodeObjectForKey:@"phone"];
    }
    return self;
}

- (void)dealloc
{
    self.name = nil;
    self.gender = nil;
    self.phone = nil;
    [super dealloc];
}
@end
