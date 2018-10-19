//  Person.m
//  LessonInherit

#import "Person.h"

@implementation Person
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

//print
- (void)print:(Person *)per {
    NSLog(@"%@ %@ %ld", [per name], [per gender], [per age]);
}

//学习
- (void)study {
    NSLog(@"xiami");
}

//初始化
//重写初始化方法
- (id)init {
    self = [super init];
    if (self) {
        _name = @"李磊";
        _gender = @"男";
        _age = 23;
    }
    return self;
}

//instancetype (完整)初始化方法
//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        //赋值
//        _name = @"wangjian";
//        _gender = @"m";
//        _age = 35;
//    }
//    return self;
//}

//自定义初始化方法
- (id)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age {
    self = [super init];
    if (self) {
        _name = name;
        _gender = gender;
        _age = age;
    }
    return self;
}

//便利构造器 --- 一个便利构造器和一个自定义初始化方法相对应
+ (id)personWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age {
    //便利构造器,封装了对象的创建过程,最终把存储对象的指针进行返回
    Person *per = [[Person alloc] initWithName:name gender:gender age:age];
    return per;
}
























@end
