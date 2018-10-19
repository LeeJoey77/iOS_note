//
//  Person.m
//  LessonKVC
//
//  Created by lanouhn on 15/10/23.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Person.h"

@implementation Person

//当使用KVC 进行赋值时,如果没有根据key 找到对应的属性,此时就会自动调用该方法,我们可以使用该方法为某些特殊的属性进行赋值(比如,id)
//setValue:(id)value forUndefinedKey:(NSString *)Key:
- (void)setValue:(id)value forUndefinedKey:(NSString *)key:
    (NSString *)key {
    if ([key isEqualToString:@"id"]) {
        _ID  = value;
    }
}













@end
