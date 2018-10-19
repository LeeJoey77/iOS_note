//
//  Student.m
//  LessonExtension
//
//  Created by lanouhn on 15/10/22.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Student.h"

//类的延展:只为有源代码的类,扩充功能(实例变量, 方法),延展中的实例变量和方法是本类私有的,只能在本类中访问.

@interface Student ()

{
    NSInteger _age;
}

//sayHi
- (void)sayHi;

@end



@implementation Student
//setter
- (void)setName:(NSString *)name {
    _name = name;
}
- (void)setGender:(NSString *)gender {
    _gender =gender;
}

//getter
- (NSString *)name {
    [self sayHi];
    return _name;
}
- (NSString *)gender {
    return _gender;
}



#pragma mark --- Extension Methods
//sayHi
- (void)sayHi {
    NSLog(@"Hello, junyi");
}





































@end
