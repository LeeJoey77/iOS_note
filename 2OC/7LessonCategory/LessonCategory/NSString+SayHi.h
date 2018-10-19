//
//  NSString+SayHi.h
//  LessonCategory
//
//  Created by lanouhn on 15/10/22.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>
//分类(类目, category),为没有源代码的类(如:NSString)扩充方法,并且只能扩充方法,不能扩充属性
//一旦添加方法,这些方法就是该类自己的方法,就可以根据具体的方法( + 号 或者 - 号方法)由类或者对象来调用
@interface NSString (SayHi)

- (void)sayHi;

+ (void)sayHello;

//添加获取首字母,不是大写,改成大写
- (NSString *)first;


//添加获取尾字母,不是小写,改成小写
- (NSString *)last;


































@end
