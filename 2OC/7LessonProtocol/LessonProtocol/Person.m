//
//  Person.m
//  LessonProtocol
//
//  Created by lanouhn on 15/10/22.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Person.h"

@interface Person () 

@end

@implementation Person
//setter
- (void)setName:(NSString *)name {
    _name = name;
}
- (void)setGender:(NSString *)gender {
    _gender = gender;
}

//getter
- (NSString *)name {
    return _name;
}
- (NSString *)gender {
    return _gender;
}

//自定义初始化方法
- (id)initWithName:(NSString *)name gender:(NSString *)gender {
    self = [super init];
    if (self) {
        _name = name;
        _gender = gender;
    }
    return self;
}

//便利构造器
+ (id)personWithName:(NSString *)name gender:(NSString *)gender {
    Person *per = [[Person alloc] initWithName:name gender:gender];
    return per;
}



#pragma mark --- RentProctocal
//打扫卫生
//@required//必须要实现的方法(系统默认)
- (void)cleanHouse {
    NSLog(@"一屋不扫何以扫天下!");

}
//交房租
- (void)payRentMoney {
    NSLog(@"可以不交吗");
}
//爱护公物
- (void)protectPublicThings {
    NSLog(@"爱护公物人人有责");
}
//交水电费
//@optional//可选择的,可做可不做
- (void)payElectAndWater {
    NSLog(@"呵呵");
}





























@end
