//
//  Person.h
//  LessonProtocol
//
//  Created by lanouhn on 15/10/22.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RentProtocol.h"
@interface Person : NSObject <RentProtocol>
{
    NSString *_name;
    NSString *_gender;
}

//setter
- (void)setName:(NSString *)name;
- (void)setGender:(NSString *)gender;

//getter
- (NSString *)name;
- (NSString *)gender;

//自定义初始化方法
- (id)initWithName:(NSString *)name gender:(NSString *)gender;

//便利构造器
+ (id)personWithName:(NSString *)name gender:(NSString *)gender;
@end
