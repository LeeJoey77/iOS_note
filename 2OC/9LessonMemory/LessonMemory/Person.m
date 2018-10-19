//
//  Person.m
//  LessonMemory
//
//  Created by lanouhn on 15/10/28.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Person.h"

@implementation Person

//当对一个对象拷贝时,会自动调用该方法
//该方法的作用:1.创建对象  2.复制内容
- (id)copyWithZone:(NSZone *)zone {
    //1.创建对象
    Person *newPer = [[Person allocWithZone:zone] init];
    //2.复制内容
    newPer.name = self.name;
    newPer.gender = self.gender;
    newPer.age = self.age;                                                                                    
    return newPer;
}




//自定义初始化
- (id)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age {
    self = [super init];
    if (self) {
        self.name = name;
        self.gender = gender;
        self.age = age;
    }
    return self;
}
//便利构造器
+ (id)personWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age {
    Person *per = [[Person alloc] initWithName:name gender:gender age:age];
    return [per autorelease];
}

//当该类的对象的引用计数为零时,自动调用该方法,切记:不要手动调用!!!
- (void)dealloc
{
    [super dealloc];//注意:一定不要忘记使用[super dealloc].
    _name = nil;
    _gender = nil;
    NSLog(@"哎呦,我被回收了!");
}








@end
