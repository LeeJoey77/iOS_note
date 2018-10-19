//
//  Student.h
//  LessonBlock
//
//  Created by lanouhn on 15/10/21.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    NSString *_name;
    NSString *_gender;
    NSInteger _age;
}

//setter
- (void)setName:(NSString *)name;
- (void)setGender:(NSString *)gender;
- (void)setAge:(NSInteger)age;

//getter
- (NSString *)name;
- (NSString *)gender;
- (NSInteger)age;

//自定义初始化
- (id)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age;

//便利构造器
+ (id)studentWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age;
//姓名升序:两个 Student 类型的对象类型比较的方法
//- (NSComparisonResult)compareByname:(Student *)student;

//年龄降序:
- (NSComparisonResult)compareByage:(Student *)stu;
























@end
