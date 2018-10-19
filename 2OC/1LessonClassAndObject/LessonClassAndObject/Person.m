//
//  Person.m
//  Note1-ClassAndObject
//
//  Created by apple on 16/8/19.
//  Copyright © 2016年 Lee. All rights reserved.
//

#import "Person.h"

@implementation Person

//实现一个动态方法
- (void)setName:(NSString *)name {
    _name = name;
}

//实现一个静态方法
+ (void)showMessage:(NSString *)info {
    NSLog(@"%@", info);
}

//私有方法
/*
 在ObjC中方法的参数类型、返回值类型需要放到()中，而且参数前必须使用冒号，并且此时冒号是方法名的一部分。当然，上面的方法只有一个参数，假设现在有一个方法可以同时设置年龄和籍贯，可以写成如下形式：
 */
- (void)setAge:(int)age nationality:(NSString *)nationality {
    _age = age;
    _nationality = nationality;
}

//实现age的setter, getter方法
- (int)age {
    return _age;
}

- (void)setAge:(int)age {
    _age = age;
}
@end
