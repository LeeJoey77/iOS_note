//  Person.h
//  LessonInherit

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    NSString  *_name;
    NSString  *_gender;
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

//print
- (void)print:(Person *)per;

//学习
- (void)study;

//初始化
/*id 与 instancetype 的区别:
 1.相同点:都可以作为方法的返回值类型
 2.不同点:①instancetype 可以返回和方法所在类相同的类型的对象,
           id 只能返回未知类(泛型)的对象
         ②instancetype 只能作为返回值,而id 不仅可以作为返回值,
           还可以作为参数的类型*/

//重写初始化方法
//- (id)init;

//instancetype (完整)初始化方法
- (instancetype)init;

//自定义初始化方法
- (id)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age;

//便利构造器 --- 一个便利构造器和一个自定义初始化方法相对应
+ (id)personWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age;




























@end
