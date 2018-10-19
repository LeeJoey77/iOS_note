//
//  CollegeStudent.h
//  LessonInherit
//
//  Created by lanouhn on 15/10/16.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Student.h"

@interface CollegeStudent : Student
{
    NSString *_institue;
    NSString *_major;
}

//setter
- (void)setInstitue:(NSString *)institue;
- (void)setMajor:(NSString *)major;

//getter
- (NSString *)institue;
- (NSString *)major;

//学习
- (void)study;

//instancetype (完整)初始化方法
- (instancetype)init;

//自定义初始化方法
- (id)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age number:(NSInteger)number score:(CGFloat)score intitue:(NSString *)institue major:(NSString *)major;

//便利构造器 --- 一个便利构造器和一个自定义初始化方法相对应
+ (id)collegeStudentWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age number:(NSInteger)number score:(CGFloat)score intitue:(NSString *)institue major:(NSString *)major;
@end
