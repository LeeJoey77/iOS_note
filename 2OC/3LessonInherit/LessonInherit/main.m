//  main.m
//  LessonInherit

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
#import "CollegeStudent.h"
#import "Zombie.h"
#import "CommonZombie.h"
#import "ConeHeadZombie.h"
#import "BacketZombie.h"
int main(int argc, const char * argv[]) {
    //1.OC 中没有绝对的private
    //2.子类可以继承父类所有的特征(实例变量)和行为(方法)
    //3.子类中的实例变量不能重写,方法可以重写
    /*4.继承总结:
       ①继承的内容:父类所有的实例变量和方法.
       ②继承到的内容的所有权:继承过来的内容就是自己的,只不过源于父类.
       ③OC只允许单继承,也就是说一个类只能有一个父类
       ④继承具有传递性: A 继承自 B ,B 继承自 C ,A 拥有 B 和 C 的所有内容,
       ⑤继承不具备互逆性:不能继承A 继承B ,B又继承A
       ⑥继承过来的内容要有意义
       ⑦继承属于面向对象的三大特性之一,最大的优势是简化代码
       ⑧NSObject 是 OC 中没有父类的类,称作根类(祖宗)*/
    //5.重写父类继承来的方法:
      //1.完全采用父类对该方法的实现
      //2.完全采用自己对该方法的实现
      //3.既保留有父类对该方法的实现,也有本类对该方法的实现
    
    //创建 Person 类的对象
//    Person *per = [[Person alloc] init];//重写的初始化
//    Person *per1 = [[Person alloc] initWithName:@"huojin"];
//    创建 Student 类的对象
//    Student *stu = [[Student alloc] init];
//    [stu print:stu];//输出:李磊 男 23 ,  调用父类 Person 的 print 方法
//    [stu setName:@"lijiahui"];
//    [stu setGender:@"male"];
//    [stu setAge:23];
//    [stu setNumber:121404050112];
//    [stu setScore:77.77];
//    NSLog(@"%@ %@ %ld %ld %.2f", [stu name], [stu gender], [stu age], [stu number], [stu score]);
    
//    创建 CollgeStudent 类的对象
//    CollegeStudent *costu = [[CollegeStudent alloc] init];
//    [costu print:costu];//输出:李磊 男 23,   调用父类 Person 的 print 方法
//    [costu setName:@"lijiahui"];
//    [costu setGender:@"male"];
//    [costu setAge:23];
//    [costu setScore:77.77];
//    [costu setNumber:12];
//    [costu setInstitue:@"information"];
//    [costu setMajor:@"InternetOfThings"];
//    NSLog(@"%@ %@ %ld %ld %.2f %@ %@", [costu name], [costu gender], [costu age], [costu number], [costu score], [costu institue], [costu major]);
    
//    学习
//    [costu study];//输出: xiami kugou QQmusic

//    instancetype (完整)初始化方法
//    Person *per = [[Person alloc] init];
//    NSLog(@"%@ %@ %ld", [per name], [per gender], [per age]);
//    
//    Student *stu = [[Student alloc] init];
//    NSLog(@"%@ %@ %ld %ld %.2f", [stu name], [stu gender], [stu age], [stu number], [stu score]);
//    
//    CollegeStudent *costu = [[CollegeStudent alloc] init];
//    NSLog(@"%@ %@ %ld %ld %.2f %@ %@", [costu name], [costu gender], [costu age], [costu number], [costu score], [costu institue], [costu major]);
    
//    自定义初始化方法
//    Person *per1 = [[Person alloc] initWithName:@"蒙毅" gender:@"男" age:35];
//    NSLog(@"%@ %@ %ld", [per1 name], [per1 gender], [per1 age]);
//    
//    Student *stu = [[Student alloc] initWithName:@"hanmei" gender:@"f" age:20 number:1 score:99];
//    NSLog(@"%@ %@ %ld %ld %.2f", [stu name], [stu gender], [stu age], [stu number], [stu score]);
//    
//    CollegeStudent *costu = [[CollegeStudent alloc] initWithName:@"yangmi" gender:@"female" age:27 number:12 score:10 intitue:@"表演" major:@"影视"];
//    NSLog(@"%@ %@ %ld %ld %.2f %@ %@", [costu name], [costu gender], [costu age], [costu number], [costu score], [costu institue], [costu major]);
    
//    //便利构造器 --- 一个便利构造器和一个自定义初始化方法相对应
//    Person *per = [Person personWithName:@"machao" gender:@"male" age:20];
//    NSLog(@"%@ %@ %ld", [per name], [per gender], [per age]);
//    
//    Student *stu = [Student studentWithName:@"huangbo" gender:@"male" age:35 number:2 score:88];
//    NSLog(@"%@ %@ %ld %ld %.2f", [stu name], [stu gender], [stu age], [stu number], [stu score]);
//    
//    CollegeStudent *costu = [CollegeStudent collegeStudentWithName:@"li" gender:@"male" age:23 number:12 score:99 intitue:@"信工" major:@"物联网"];
//    NSLog(@"%@ %@ %ld %ld %.2f %@ %@", [costu name], [costu gender], [costu age], [costu number], [costu score], [costu institue], [costu major]);
//    
    
    
    
    
 
    
    
    return 0;
}
