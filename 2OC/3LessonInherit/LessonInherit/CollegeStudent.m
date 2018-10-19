//
//  CollegeStudent.m
//  LessonInherit
//
//  Created by lanouhn on 15/10/16.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "CollegeStudent.h"

@implementation CollegeStudent
//setter
- (void)setInstitue:(NSString *)institue {
    _institue = institue;
}
- (void)setMajor:(NSString *)major {
    _major = major;
}

//getter
- (NSString *)institue {
    return _institue;
}
- (NSString *)major {
    return _major;
}

//学习
- (void)study {
    [super study];
    //super 编译器指令,不代表任何类,作用是通知编译器执行父类中的某个方法
    NSLog(@"QQmusic");
}

//instancetype (完整)初始化方法
- (instancetype)init {
    self = [super init];
    if (self) {
        _name = @"丽妃";
        _gender = @"女";
        _age = 30;
        _number = 12;
        _score = 100;
        _institue = @"外语";
        _major = @"韩语";
    }
    return self;
}

//自定义初始化方法
- (id)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age number:(NSInteger)number score:(CGFloat)score intitue:(NSString *)institue major:(NSString *)major {
    self = [super initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age number:(NSInteger)number score:(CGFloat)score];
    if (self) {
        _institue = institue;
        _major = major;
    }
    return self;
}

//便利构造器 --- 一个便利构造器和一个自定义初始化方法相对应
+ (id)collegeStudentWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age number:(NSInteger)number score:(CGFloat)score intitue:(NSString *)institue major:(NSString *)major {
    CollegeStudent *costu = [[CollegeStudent alloc] initWithName:name gender:gender age:age number:number score:score intitue:institue major:major];
    return costu;
}
@end
