//  Person.h
//  LessonMethod
#import <Foundation/Foundation.h>
@interface Person : NSObject
//1
//实例变量可见度
{
    //如果不写可见度,系统默认为 protected,
    //只能在本类和子类中能够访问到,在main() 函数以及其他类中访问不到
    //@public//实例变量的可见度,公开的,在本类,子类,其他类都能访问到
    NSString *_name;//姓名
    NSString *_gender;//性别
    //@protected//受保护的,默认的,在本类,子类中可以访问到
    NSInteger _age;//年龄
    CGFloat _height;//身高
    //@private//私有的,只能在本类中访问到
    CGFloat _weight;//体重
}
/*
  系统默认的实例变量的可见度是protected(受保护的),
  1.为什么不默认 @public ?
    @public 会造成实例变量到处都能访问到,违背了封装(隐藏内部实现)的概念;
  2.为什么不默认 @private ?
    @private 子类都无法访问该类的实例变量,违背了继承(子类继承以及可以
    访问父类的内容)的概念
  3.系统默认了 @protected 怎么对实例变量赋值?
    通过方法,把要赋的值传到该类的内部,即可完成赋值.
*/

//2
//方法
/*
  方法:分为两类,类方法(静态方法,加号方法),实例方法(动态方法,减号方法);
  类方法:方法标示符为 + ,因此被称作 + 号方法,只能由类来调用
  注意:类方法中不能使用实例变量,因为类不占空间
  实例变量:方法标识符为 -,因此被称作 - 号方法,只能由该类的对象来调用
*/

//对象方法类型:
//1.无参无返回值
- (void)sayHi;
//2.无参有返回值
- (CGFloat)giveMeYourWeight;
//3.有参无返回值
- (void)setYourHeight:(CGFloat)height;
//4.有参有返回值
//传入年龄,将该年龄加上一定的数值之后返回
- (NSInteger)plusAge:(NSInteger)age plusNumber:(NSInteger)number;
//注意:一个方法中有多少个冒号' : ',就有多少个参数
//注意:方法的返回值使用 return 返回

//3
/*
  为单一实例变量赋值的方法,称作 setter 方法(设置器)
  获取单一实例变量的方法,称作 getter 方法(访问器).
  每一个实例变量都有一对 setter 和 getter 方法.
*/
//实例变量可见度为 protected 时:
//添加给 name 赋值的方法
- (void)setName:(NSString *)name;
//获取 name 的方法
- (NSString *)name;

//添加给  gender 赋值的方法
- (void)setGender:(NSString *)gender;
//获取 gender 的方法
- (NSString *)gender;

//添加给  age赋值的方法
- (void)setAge:(NSInteger)age;
//获取 age 的方法
- (NSInteger)age;
   
//添加给 height 赋值的方法
- (void)setHeight:(CGFloat)height;
//获取 height 的方法
- (CGFloat)height;

//添加给 weight 赋值的方法
- (void)setWeight:(CGFloat)weight;
//获取 weight 的方法
- (CGFloat)weight;

//多参赋值,给多个参数赋值
- (void)setName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age height:(CGFloat)height weight:(CGFloat)weight;

//4
//初始化操作依然还是赋值操作,只不过是在初始化时完成赋值的
//重写初始化方法
- (id)init;//id 对象类型的泛型, 相当于void *

//自定义初始化方法,以 init 开头,之后跟单词 With(W一定要大写)
- (id)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age height:(CGFloat)height weight:(CGFloat)weight;

//5
//+ 号方法(也可改为 - 号方法)
//求两个数的最大值
//+ (NSInteger)maxValueFornumberone:(NSInteger)one numberTwo:(NSInteger)two;
//
////求两个素的最小值
//+ (NSInteger)minValueFornumberone:(NSInteger)one numberTwo:(NSInteger)two;
//
////求两个数的最大公约数
//+ (NSInteger)GCDValueFornumberone:(NSInteger)one numberTwo:(NSInteger)two;
//
////求两个数的最小公倍数
//+ (NSInteger)LCMValueFornumberone:(NSInteger)one numberTwo:(NSInteger)two;


//用 - 号方法实现
//求两个数的最大值
- (NSInteger)maxValueFornumberone:(NSInteger)one numberTwo:(NSInteger)two;

//求两个素的最小值
- (NSInteger)minValueFornumberone:(NSInteger)one numberTwo:(NSInteger)two;

//求两个数的最大公约数
- (NSInteger)GCDValueFornumberone:(NSInteger)one numberTwo:(NSInteger)two;

//求两个数的最小公倍数
- (NSInteger)LCMValueFornumberone:(NSInteger)one numberTwo:(NSInteger)two;













   
@end
