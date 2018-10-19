//  Student.h
//  LessonInherit
#import "Person.h"

@interface Student : Person
{
//    NSString *_name;//该实例变量会从父类继承得到,同时,gender age ,
//    也是继承而来,子类会继承父类所有的实例变量和方法
//    OC中只允许单继承
//    NSString *_gender;
//    NSInteger _age;
    NSInteger _number;
    CGFloat _score;
}

//setter
- (void)setName:(NSString *)name;
- (void)setGender:(NSString *)gender;
- (void)setAge:(NSInteger)age;
- (void)setNumber:(NSInteger)number;
- (void)setScore:(CGFloat)score;

//getter
- (NSString *)name;
- (NSString *)gender;
- (NSInteger)age;
- (NSInteger)number;
- (CGFloat)score;

//学习
- (void)study;

//instancetype (完整)初始化方法
//- (instancetype)init;

//自定义初始化方法
- (id)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age number:(NSInteger)number score:(CGFloat)score;

//便利构造器 --- 一个便利构造器和一个自定义初始化方法相对应
+ (id)studentWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age number:(NSInteger)number score:(CGFloat)score;






























@end
