//
//  Person.h
//  Note1-ClassAndObject
//
//  Created by apple on 16/8/19.
//  Copyright © 2016年 Lee. All rights reserved.
//

/*
 在ObjC中定义一个类需要两个文件.h和.m：
 
 .h文件：放类的声明，包括成员变量、属性和方法声明（事实上.h文件不参与编译过程）；关键字@interface声明一个类，同时它必须以@end结束，在这两个关键字中间声明相关成员；在声明Person类的同时可以看到它继承于NSObject，这是ObjC的基类，所有的类最终都继承于这个类（但是需要注意ObjC中的基类或者根类并不只有一个，例如NSProxy也是ObjC的基类），由于这个类在Foundation框架中定义，所以导入了<Foundation/Foundaton.h>（这么描述的意思是导入Foundation框架中的Foundation.h声明文件）；
 .m文件：放属性、方法的具体实现；关键字@implementation用于实现某个类，同时必须以@end结尾，在这两个关键字中间实现具体的属性、方法；由于.m中使用了Person类，所以需要导入声明文件“Person.h”；
 */
#import <Foundation/Foundation.h>//由于使用了NSObject, 所以导入此头文件

//NSObject是基类, Person实现了NSObject
@interface Person : NSObject
{
    /*成员变量必须包含在大括号中
     *注意成员变量不声明任何关键字的话是默认可访问性@Protected
     *注意在ObjC中不管是自定义的类还是系统类对象都必须是一个指针，例如下面的_name
     */
    @private
    NSString *_name;//在ObjC中推荐成员变量名以_开头
    int _age;
    @protected
    NSString *_nationality;
    @public
    NSString *_gender;
    float _height;
}
/*
 成员变量定义在.h文件中，同时必须定义在类后面的{}内。成员的可访问性通过下面三个关键字声明：
 
 @private 私有成员，只有当前类可以访问；
 @protected 受保护成员，只有当前类或子类可以访问（如果没有添加任何修饰则默认为@protected）；
 @public 公共成员，所有类均可访问；
 在ObjC中可访问性修饰符除了这三种，还有一个@package不太常用，它类似于C#中的internal在框架内是公共的，但是框架外是私有的（也就是只能在一个框架内可以访问）。
 那么既然身高是公共的，外界怎么访问呢？
 */

//方法和属性
/*
既然有了上面成员变量，假设现在需要一个对象方法去设置用户姓名，还需一个类方法打印一些信息。

在ObjC中方法分为静态方法和动态方法两种，动态方法就是对象的方法，静态方法就是类方法，这一点跟其他高级语言没有区别。在ObjC中使用“-”定义动态方法，使用“+”定义静态方法。如果一个方法在.h中有声明则该方法是公共方法，如果没有在.h中声明直接在.m中定义则该方法是私有方法，外部无法访问。
 */
//声明一个动态方法，没有返回值
-(void)setName:(NSString *)name;
//声明一个静态方法，没有返回值
+(void)showMessage:(NSString *)info;

//声明age的setter, getter方法
- (int)age;
- (void)setAge:(int)age;

@end

