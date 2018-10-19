//
//  Business.m
//  LessonNetwork
//
//  Created by lanouhn on 15/11/25.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "Business.h"

@implementation Business

//使用KVC进行赋值时,如果Model中的属性名与KVC赋值是的字典的key不匹配,就会来调用该方法,如果此时Model中没有写该方法的话,就会崩溃, 即使空实现,也能防止该崩溃.
- (void)setValue:(id)value forUndefinedKey:(NSString *)key  {
    
}

//使用该方法时,要调用对父类对该方法的实现
- (void)setValue:(id)value forKey:(NSString *)key {
    [super setValue:value forKey:key];
}

- (void)dealloc
{
    self.name = nil;
    self.address = nil;
    self.telephone = nil;
    [super dealloc];
}
@end
