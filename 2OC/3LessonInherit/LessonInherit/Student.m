//  Student.m
//  LessonInherit

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
- (void)setNumber:(NSInteger)number {
    _number = number;
}
- (void)setScore:(CGFloat)score {
    _score = score;
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
- (NSInteger)number {
    return _number;
}
- (CGFloat)score {
    return _score;
}

//学习
- (void)study {
    [super study];
    NSLog(@"kugou");
}

//instancetype (完整)初始化方法
- (instancetype)init {
    self = [super init];
    if (self) {
        //赋值
        _name = @"蒙毅";
        _gender = @"男";
        _age = 30;
        _number = 12;
        _score = 77.77;
    }
    return self;
}

//自定义初始化方法
- (id)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age number:(NSInteger)number score:(CGFloat)score {
    self = [super initWithName:name gender:gender age:age];//调用Person类的 initWithName 方法
    if (self) {
        //赋值,子类使用父类的初始化方法,只需要使用自身的实例变量赋值即可
        _number = number;
        _score = score;
    }
    return self;
}
//或
//- (id)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age number:(NSInteger)number score:(CGFloat)score {
//    self = [super init];//调用Person类的 instancetype方法
//    if (self) {
//        //赋值,子类使用父类的初始化方法,只需要使用自身的实例变量赋值即可
//        _name = name;
//        _gender = gender;
//        _age = age;
//        _number = number;
//        _score = score;
//    }
//    return self;
//}

//便利构造器 --- 一个便利构造器和一个自定义初始化方法相对应
+ (id)studentWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age number:(NSInteger)number score:(CGFloat)score {
    Student *stu =  [[Student alloc] initWithName:name gender:gender age:age number:number score:score];
    return stu;
}




















@end
