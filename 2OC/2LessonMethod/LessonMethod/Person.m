//  Person.m
//  LessonMethod

#import "Person.h"

@implementation Person
//2
//对象方法类型:
//1.无参无返回值
- (void)sayHi {
    NSLog(@"Hello World!");
}
//2.无参有返回值
- (CGFloat)giveMeYourWeight {
    return 150;
}
//3.有参无返回值
- (void)setYourHeight:(CGFloat)height {
    _height = height;
}
//4.有参有返回值
//传入年龄,将该年龄加上一定的数值之后返回
- (NSInteger)plusAge:(NSInteger)age plusNumber:(NSInteger)number {
    _age = age + number;
    return _age;
}

//3
//setter 和 getter 方法
//添加给 name 赋值的方法
- (void)setName:(NSString *)name {
    _name = name;
}
//获取 name 的方法
- (NSString *)name {
    return _name;
}
//添加给  gender 赋值的方法
- (void)setGender:(NSString *)gender {
    _gender = gender;
}
//获取 gender 的方法
- (NSString *)gender {
    return _gender;
}
//添加给  gender 赋值的方法
- (void)setAge:(NSInteger)age {
    _age = age;
}
//获取 gender 的方法
- (NSInteger)age {
    return _age;
}
//添加给 height 赋值的方法
- (void)setHeight:(CGFloat)height {
    _height = height;
}
//获取 height 的方法
- (CGFloat)height {
    return _height;
}
//添加给 weight 赋值的方法
- (void)setWeight:(CGFloat)weight {
    _weight = weight;
}
//获取 weight 的方法
- (CGFloat)weight {
    return _weight;
}

//多参赋值,给多个参数赋值
- (void)setName:(NSString *)name gender:(NSString *)gender
  age:(NSInteger)age height:(CGFloat)height weight:(CGFloat)weight {
    _name = name;
    _gender = gender;
    _age = age;
    _height = height;
    _weight = weight;
}

//4
/*
 初始化操作依然还是赋值操作,只不过是在初始化时完成赋值的
 为什么要初始化?
 如果想要在初始化时期就赋一些有意义的值,就需要重写初始化方法或者自定义初始化
 */
//重写初始化方法
- (id)init {
    self = [super init];
    if (self) {
        _name = @"zhangsan";
        _gender = @"man";
        _age = 17;
        _height = 181.5;
        _weight = 60;
    }
    return  self;//在减号方法(实例方法)中,self 代表使用该方法的对象
}

//自定义初始化方法,以 init 开头,之后跟单词 With(W一定要大写)
- (id)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age height:(CGFloat)height weight:(CGFloat)weight {
    //self 在实例方法中,代表调用该方法的对象
    //super 调用父类对某一个方法的实现
    self = [super init];
    //当父类的初始化方法完成之后,再对自身的实例变量进行赋值
    if (self) {
        //赋值
        _name = name;
        _gender = gender;
        _age = age;
        _height = height;
        _weight = weight;
    }
    //返回
    return self;//此时的self 是对实例变量赋完值之后的self
}

//5
//+ 号方法(也可改为 - 号方法)
////求两个数的最大值
//+ (NSInteger)maxValueFornumberone:(NSInteger)one numberTwo:(NSInteger)two {
//    return one > two ? one : two;
//}
//
////求两个素的最小值
//+ (NSInteger)minValueFornumberone:(NSInteger)one numberTwo:(NSInteger)two {
//    return one < two ? one : two;
//}
//
////求两个数的最大公约数
//+ (NSInteger)GCDValueFornumberone:(NSInteger)one numberTwo:(NSInteger)two {
//    while (one % two != 0) {
//        NSInteger number = one % two;
//        one = two;
//        two = number;
//    }
//    return two;
//}
//
//求两个数的最小公倍数
//+ (NSInteger)LCMValueFornumberone:(NSInteger)one numberTwo:(NSInteger)two {
//    NSInteger GCD = [self GCDValueFornumberone:one numberTwo:two];
//    return one * two / GCD;
//}//使用类方法的时候,一定要用类来调用,在类中self 代表当前类, 此时此刻 self 代表Person类



//用 - 号方法实现
//求两个数的最大值
- (NSInteger)maxValueFornumberone:(NSInteger)one numberTwo:(NSInteger)two {
    return one > two ? one : two;
}

//求两个素的最小值
- (NSInteger)minValueFornumberone:(NSInteger)one numberTwo:(NSInteger)two {
    return one < two ? one : two;
}

//求两个数的最大公约数
- (NSInteger)GCDValueFornumberone:(NSInteger)one numberTwo:(NSInteger)two {
    while (one % two != 0) {
        NSInteger number = one % two;
        one = two;
        two = number;
    }
    return two;
}

////求两个数的最小公倍数
//- (NSInteger)LCMValueFornumberone:(NSInteger)one numberTwo:(NSInteger)two {
//    NSInteger GCD = [self GCDValueFornumberone:one numberTwo:two];
//    return one * two / GCD;//self 此时是 - 号方法, 在实例方法中,代表调用该方法的对象
//}

//求两个数的最小公倍数
- (NSInteger)LCMValueFornumberone:(NSInteger)one numberTwo:(NSInteger)two {
    NSInteger GCD = [self GCDValueFornumberone:one numberTwo:two];
    return one * two / GCD;//self 此时是 - 号方法, 在实例方法中,代表调用该方法的对象
}

@end
