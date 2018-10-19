//
//  Student.m
//  LessonProperty
//
//  Created by lanouhn on 15/10/23.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Student.h"

@implementation Student

- (id)copyWithZone:(NSZone *)zone {
    Student *stu = [[Student allocWithZone:zone] init];
    stu.name = self.name;
    stu.gender = self.gender;
    stu.age = self.age;
    self.score = self.score;
    return stu;
}

//自定义初始化
- (id)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age score:(CGFloat)score {
    self = [super init];
    if (self) {
        _name = name;
        _gender = gender;
        _age = age;
        _score = score;
    }
    return self;
}

//便利构造器
+ (id)studentWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age score:(CGFloat)score {
    Student *stu = [[Student alloc] initWithName:name gender:gender age:age score:score];
    return stu;
}


//sayHello
- (NSString *)sayHello {
    return @"hello";
}











@end
