//
//  Contact.m
//  LessonSqlite
//
//  Created by lanouhn on 15/11/23.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "Contact.h"

@implementation Contact
//自定义初始化方法
- (id)initWithID:(NSInteger)ID name:(NSString *)name gender:(NSString *)gender age:(NSString *)age phone:(NSString *)phone image:(UIImage *)image {
    self = [super init];
    if (self) {
        self.ID = ID;
        self.name = name;
        self.gender = gender;
        self.age = age;
        self.phone = phone;
        self.image = image;
    }
    return self;
}

//便利构造器
+ (id)contactWithID:(NSInteger)ID name:(NSString *)name gender:(NSString *)gender age:(NSString *)age phone:(NSString *)phone image:(UIImage *)image {
    return [[[Contact alloc] initWithID:ID name:name gender:gender age:age phone:phone image:image] autorelease];
}

- (void)dealloc
{
    self.name = nil;
    self.gender = nil;
    self.age = nil;
    self.phone = nil;
    self.image = nil;
    [super dealloc];
}
@end
