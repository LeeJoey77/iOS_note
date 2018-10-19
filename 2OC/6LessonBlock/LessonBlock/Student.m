//
//  Student.m
//  LessonBlock
//
//  Created by lanouhn on 15/10/21.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Student.h"

@implementation Student
//setter
- (void)setName:(NSString *)name {
    _name = name;
}
- (void)setGender:(NSString *)gender {
    _gender = gender;
}
- (void)setAge:(NSInteger)age {
    _age = age;
}

//getter
- (NSString *)name {
    return _name;
}
- (NSString *)gender {
    return _gender;
}
- (NSInteger)age {
    return _age;
}

//自定义初始化
- (id)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age {
    self = [super init];
    if (self) {
        _name = name;
        _gender = gender;
        _age = age;
    }
    return self;
}

//便利构造器
+ (id)studentWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age {
    Student *stu = [[Student alloc] initWithName:name gender:gender age:age];
    return stu;
}

//姓名升序:两个 Student 类型的对象类型比较的方法
- (NSComparisonResult)compareByname:(Student *)student {
    //获取第一个对象的name
    NSString *firstName = [self name];
    NSLog(@"1 %@", firstName);
    //获取第二个对象的name
    NSString *secondName = [student name];
    NSLog(@"2 %@", secondName);
//    if ([firstName compare:secondName] == -1) {
//        return NSOrderedAscending;// -1
//    }else if ([firstName compare:secondName] == 0)
//    {
//        return NSOrderedSame;
//    }else {
//        return NSOrderedDescending;
//    }
    return [firstName compare:secondName];
//    //降序: return -[firstName compare:secondName];
}

//重写描述方法,改变默认描述为我想要的输出内容
- (NSString *)description {
    return [NSString stringWithFormat:@"%@, %@, %ld", _name, _gender, _age];
}

//年龄降序:
- (NSComparisonResult)compareByage:(Student *)stu {
    NSInteger firstAge = [self age];
    NSInteger secondAge = [stu age];
//    if (firstAge < secondAge) {
//        return NSOrderedDescending;
//    }else if (firstAge == secondAge) {
//        return NSOrderedSame;
//    }else {
//        return NSOrderedAscending;
//    }
    
   
    return -[@(firstAge) compare:@(secondAge)];
}

 













@end
