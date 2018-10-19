//
//  main.m
//  LessonMemory
//
//  Created by lanouhn on 15/10/28.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {

//    //创建Person对象
    Person *per = [[Person alloc] initWithName:@"zhangziyi" gender:@"woman" age:36];
    //retainCount 系统提供的,查看某一空间的引用计数方法
    NSUInteger count = [per retainCount];//retainCount NSUInteger无符号长整型
    NSLog(@"%lu", count);//引用计数0 -- 1
        
    //retain 让对象(堆区空间)的引用计数 + 1
    Person *per1 = [per retain];//引用计数1 -- 2
    NSLog(@"%lu", [per1 retainCount]);
    [per1 release];
    [per release];
    [per class];
    NSLog(@"%@", per1);
//    NSLog(@"%lu", [per retainCount]);
    
//
//    Person *per2 = [per1 retain];//引用计数2 -- 3
//    NSLog(@"%lu", [per retainCount]);
//    NSLog(@"%lu", [per1 retainCount]);
//    NSLog(@"%lu", [per2 retainCount]);
//    
//    //release 让对象(堆区空间)的引用计数立即 - 1
//    [per release];
//    NSLog(@"%lu", [per retainCount]);
//    NSLog(@"%lu", [per1 retainCount]);
//    NSLog(@"%lu", [per2 retainCount]);
//    [per1 release];
//    NSLog(@"%lu", [per retainCount]);
//    NSLog(@"%lu", [per1 retainCount]);
//    NSLog(@"%lu", [per2 retainCount]);
//    
//    [per2 release];//使用dealloc 判断引用计数是否为零
//    NSLog(@"%lu", [per retainCount]);//当对象的引用计数为零之后再去使用retainCount计算空间的引用计数就是一种错误的用法,错误的用法就会得到错误的结果
    //谁让引用计数 + 1,谁就有责任让引用计数 - 1
    //引用计数为零之后,系统收回堆区空间,再用per, per1, per2去访问已经释放的堆区空间,就是野指针
    //谁才有引用计数的概念? --- 堆区的对象才有引用计数的概念
    //谁才有引用计数? --- 堆区的对象才有引用计数
    
    
//
//    //创建Person对象
//    Person *per = [[Person alloc] initWithName:@"zhangziyi" gender:@"woman" age:36];//引用计数0 -- 1
//    NSLog(@"%lu", [per retainCount]);
//    
//    
//    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
//    
//    //autorelease 在未来某一时刻 - 1
//    [per autorelease];//将对象per 放到离该对象最近的自动释放池中
//    NSLog(@"%lu", [per retainCount]);
//    
//    [pool release];//在自动释放池销毁时,会给自己内部要进行autorelease的对象发送一个release消息,让该对象的引用计数 -1
    
//    @autoreleasepool {
//        @autoreleasepool {
//            @autoreleasepool {
//                [per autorelease];
//            }
//        }
//    }
    
    /*
        for (long i = 0; i < 10000; i++) {
            if (i == 999) {
                NSLog(@"%ld", i);
            }
                @autoreleasepool {
                    Person *per1 = [Person personWithName:@"" gender:@"" age:2];
                    NSLog(@"%ld", per1.age);
//                    Person *per = [[Person alloc] init];
//                    NSLog(@"%lu", [per retainCount]);
//                    [per autorelease];//每次开辟的空间即对象都被放入自动释放池中,不存在内存泄露
                }
        }
*/
  /*
    //copy
    @autoreleasepool {
        //创建Person对象
        Person *per = [[Person alloc] initWithName:@"shuqi" gender:@"woman" age:18];
        //copy会使对象的引用计数加一,但是,该实现原理与retain不同,是由于创建了新的对象才引起的引用计数的增加,而retain是在原有对象的基础上引起引用计数的增加
        //当一个类服从了NSCopying协议,并且实现了copyWithZone方法,之后这个类才能够使用copy
//        Person *per1 = [per copy];//NSCopying 协议
//        NSLog(@"%lu", [per retainCount]);
//        NSLog(@"%lu", [per1 retainCount]);
        [per release];
//        [per1 release];
    }
   */
    //内存管理原则:
        //1.当你对一个对象进行了alloc, retain, copy操作,你就要对该对象负责,要对该对象进行释放(release, 或autorelease)
        //2.在一个方法内部,要保证对象的引用计数 + - 相等.
    
   //内存问题:
        //1.野指针错误:对象被释放后,此时空间已经被系统回收,如果此时再去访问该块空间,就会引起野指针错误,不会立即崩溃,但有安全隐患
        //2.过度释放:对一块已经释放过并且归还系统的空间,再次释放,就会引起过度释放问题,会造成程序立即崩溃
        //3.内存泄露:对一块拥有权限的空间,在使用完之后,没有进行释放,系统无法将该块空间回收,就会引起内存泄露问题,不会立即crash,存在安全隐患

    
    
    
    return 0;
}
