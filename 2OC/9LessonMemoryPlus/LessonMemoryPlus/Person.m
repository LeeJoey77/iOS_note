//
//  Person.m
//  LessonMemoryPlus
//
//  Created by lanouhn on 15/10/29.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Person.h"

@implementation Person
//自定义初始化
- (id)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age {
    self = [super init];
    if (self) {
        //自定义初始化方法,内部要使用setter方法来进行赋值,因为setter方法中有内存管理
        self.name = name;
        self.gender = gender;
        self.age = age;
    }
    return self;
}

//便利构造器
+ (id)personWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age {
    Person *per = [[Person alloc] initWithName:name gender:gender age:age];
    NSLog(@"%lu", [per retainCount]);
    return [per autorelease];
}

- (void)dealloc
{   //什么时候要对实例变量在dealloc方法中进行release操作?
    //当实例变量的语义特性设置为retain或copy时.
    [_name release];//在对象销毁前,将实例变量的引用计数- 1, 处理setter方法中的内存泄露问题
    [_gender release];
    [super dealloc];//调用父类
    NSLog(@"引用计数为 0");
}

@synthesize name = _name;
- (void)setName:(NSString *)name {
    if (_name != name) {//避免重复操作
        [_name release];//解决内存泄露问题
        _name = [name retain];//解决野指针问题
    }
}

//[[_name retain] autorelease]; 苹果推荐的getter方法的安全处理机制
- (NSString *)name {
    return [[_name retain] autorelease];
}

//@synthesize name = _name;
//#if 0
////当属性的语义特性设置为assign时,setter 以及getter 的内部实现如下
////assign 不适用于对象类型的属性,是因为,内部进行的是直接赋值,这样容易引起野指针错误
//- (void) setName:(NSString *)name {
//    _name = name;
//}
//
//-(NSString *)name {
//    return _name;
//}
//#endif
//
//#if 0
//- (void)setName:(NSString *)name {
//    if (_name != name) {//避免重复操作
//        [_name release];//解决内存泄露问题
//        _name = [name retain];//解决野指针问题
//    }
//}
//
////[[_name retain] autorelease]; 苹果推荐的getter方法的安全处理机制
//- (NSString *)name {
//    return [[_name retain] autorelease];
//}
//#endif
//
//#if 1
//- (void)setName:(NSString *)name {
//    if (_name != name) {
//        [_name release];
//        _name = [name copy];
//    }
//}
//
//- (NSString *)name {
//    return [[_name retain] autorelease];
//}
//#endif


@end
