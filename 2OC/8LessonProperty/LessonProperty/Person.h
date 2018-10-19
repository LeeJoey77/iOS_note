//
//  Person.h
//  LessonProperty
//
//  Created by lanouhn on 15/10/23.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface Person : NSObject
//成员变量
//{
//    NSString *_name;
//    NSString *_gender;
//    NSInteger _age;
//    CGFloat _weight;
//}



/*
 Xcode4.4版本之前: @property 和 @synthesize的功能是独立分工的

 
 @property 和 @synthesize 的作用:
@property的作用是: 生成成员变量 set/get 方法的声明
@property int age; 它的作用和下面两行代码的作用一致
- (void)setAge:(int)age;
- (int)age;
注意：属性名称不要加前缀_ 否则生成的get/set方法中也会有下划线
 // 属性中带有下划线 _ 那么生成的get/set也会有下划线 _
// @property int _age;
//- (void)set_age:(int)_age;
//- (int)_age;

 
@synthesize的作用
@synthesize age: 实现 @property 声明的 set/get 方法, 生成成员变量 age
如果指定访问成员变量_age的话代码如下：
@synthesize age = _age: 实现 @property 声明的 set/get 方法, 生成成员变量 _age

如果在.h文件中没有定义 _age 成员变量的话，就会在.m文件中自动生成@private类型的成员变量_age
*/

/*
 Xcode4.4之后: @property已经独揽了@synthesize的功能, 主要有三个作用：
 
 (1)生成了成员变量 get/set 方法的声明
 (2)生成了私有的带下划线的的成员变量因此子类不可以直接访问，但是可以通过get/set方法访问。那么如果想让定义的成员变量让子类直接访问那么只能在.h文件中定义成员变量了，因为它默认是@protected
 (3)生成了get/set方法的实现
 
 注意：
 如果已经手动实现了get和set方法的话Xcode不会再自动生成带有下划线的私有成员变量了
 因为xCode自动生成成员变量的目的就是为了根据成员变量而生成get/set方法的
 但是如果get和set方法缺一个的话都会生成带下划线的变量
 */

//属性的定义:@property 属性的类型(与内部操作的实例变量的类型保持一致) 属性名(与内部操作的实例变量名字保持一致)
//属性的属性:
//1.读写特性(readonly 只读,readwrite 读写)
//readonly --- 系统只生成getter方法
//readwrite --- 系统生成setter 和 getter 方法
//系统默认的读写特性是 readwrite
//2.原子特性(nonatomic 非原子性,atomic 原子性):atomic 会保证线程安全,系统默认是atomic,nonatomic 不保证线程安全,但是效率高,系统推荐
//3.语义特性(assign, retain, copy):
//(1)如果属性是非对象类型（比如int，float等）属性的语义设置使用assign
//(2)如果属性是对象类型（比如NSStrng、NSArray等）属性的语义设置使用retain
//(3)如果属性是对象类型并且想得到参数的copy，使用copy关键字

@property (nonatomic, copy) NSString *name;//相当于拥有了以下两个方法的声明
//- (void)setName:(NSString *)name;
//- (NSString *)name;

@property (nonatomic, retain) NSString *gender;//相当于拥有了以下两个方法的声明
//- (void)setGender:(NSString *)gender;
//- (NSString *)gender;

@property NSInteger age;//相当于拥有了以下两个方法的声明
//- (void)setAge:(NSInteger)age;
//- (NSInteger)age;

@property CGFloat weight;//相当于拥有了以下两个方法的声明
//- (void)setWeight:(CGFloat)weight;
//- (CGFloat)weight;

//自定义初始化
- (id)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age weight:(CGFloat)weight;

@end
