//
//  Person.m
//  LessonProperty
//
//  Created by lanouhn on 15/10/23.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Person.h"
//Xcode 4.4之后:
//1.当让系统自动生成setter 以及 getter 方法实现时,此时系统会自动生成实例变量
//2.如果我们自己重写了setter 和 getter 方法其中之一时,系统还会自动生成实例变量
//3.如果我们自己重写了setter 和 getter ,那么此时系统不再自动生成实例变量,需要我们自己创建实例变量,或者使用@sythesize来生成实例变量, 此时的实例变量是私有的
//@sythesize 在.m文件中的作用:
    //(1)生成setter 和 getter 方法的实现
    //(2)生成内部操作的实例变量
@implementation Person

//@synthesize name, gender, age, weight;

//或:
//@synthesize name = _name, gender = _gender, age = _age, weight = _weight;

//或分开写:
//{
//    @synthesize name = _name;//相当于以下两个方法

//    - (void)setName:(NSString *)name {
//        _name = name;
//    }
//    - (NSString *)name {
//        return _name;
//    }
//
//
//    @synthesize gender = _gender;//相当于以下两个方法
//    - (void)setGender:(NSString *)gender {
//        _gender = gender;
//    }
//    - (NSString *)gender {
//        return _gender;
//    }
//
//
//    @synthesize age = _age;//相当于以下两个方法
//    - (void)setAge:(NSInteger)age {
//        _age = age;
//    }
//    - (NSInteger)age {
//        return _age;
//    }
//
//
//    @synthesize weight = _weight;//相当于以下两个方法
//    - (void)setWeight:(CGFloat)weight {
//        _weight = weight;
//    }
//    - (CGFloat)weight {
//        return _weight;
//    }
//}

//@synthesize name = _name;//同时重写setter 和getter 方法时需要写@synthesize

#pragma mark --- 不同语义特性下的setter 和getter 的内部实现
#if 0
//assign,系统默认
//setter 方法
- (void)setName:(NSString *)name {
    _name = name;
}

//getter 方法
- (NSString *)name {
    return _name;
}
#endif

#if 0
//retain
//setter 方法
- (void)setName:(NSString *)name {
    if (_name != name) {
        [_name release];
        _name = [name retain];
    }
}
//getter 方法
- (NSString *)name {
    return [[_name retain] autorelease];
}
#endif

#if 0
//copy
//setter 方法
- (void)setName:(NSString *)name {
    if (_name != name) {
        [_name release];
        _name = [name copy];
    }
}
//getter
- (NSString *)name {
    return [[_name retain] autorelease];
}
#endif

//自定义初始化
- (id)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age weight:(CGFloat)weight {
    self = [super init];
    if (self) {
        _name = name;
        _gender = gender;
        _age = age;
        _weight = weight;
    }
    return self;
}

@end
