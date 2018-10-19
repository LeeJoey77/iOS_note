//  main.m
//  LessonMethod

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    //指针类型的清零为 NULL,整型清空为 0
    //消息发送机制: [receiver message]
    //对消息发送机制的理解:
    //1.receiver 接收到消息 message
    //2.receiver 找到 message 方法,并执行

//2
    Person *per = [[Person alloc] init];//开辟堆区空间,初始化
//    per->_name = @"Rachel";
//    per->_gender = @"f";
//    [per sayHi];
//    CGFloat weight = [per giveMeYourWeight];
//    NSLog(@"%.2f", weight);
//    [per setYourHeight:7.7];
//    NSInteger age  = [per plusAge:18 plusNumber:200];
//    NSLog(@"%ld", age);
//    Student *stu = [[Student alloc] init];
//    [stu myName];
//    NSString *gender = [stu myGender];
//    NSLog(@"%@", gender);//对象的输出用' %@ '
//    [stu myAge:23];
//    CGFloat score = [stu myScore:77 credit:0.77];
//    NSLog(@"%.2f", score);

//3
    //setter 和 getter方法
    [per setName:@"daofeng"];
    NSString *name = [per name];
    NSLog(@"%@", name);
    
    [per setGender:@"f"];
    NSLog(@"%@", [per gender]);
    
    [per setAge:23];
    NSLog(@"%ld", [per age]);
    
    [per setHeight:77.8];
    NSLog(@"%.2f", [per height]);
    
    [per setWeight:140];
    NSLog(@"%.2f", [per weight]);
    
//    [per setName:@"nike" gender:@"m" age:23 height:77 weight:85];
//    NSLog(@"%@ %@ %ld %.2f %.2f", [per name], [per gender], [per age], [per height], [per weight]);

//4
    //初始化操作依然还是赋值操作,只不过是在初始化时完成赋值的
    //重写初始化方法
//    Person *per = [[Person alloc] init];
//    NSLog(@"%@ %@ %.2f %.2f", [per name], [per gender], [per height], [per weight]);
    
    //自定义初始化方法
    //使用初始化方法 init 或者是自定义的初始化方法时,可以在初始化时,给我的对象赋一些有意义的值,
    //但是如果之后发现这些值需要修改,那么就可以使用 setter 方法进行修改,同理,我也可使用getter
    //方法来获取相应的实例变量的值
//    Person *person = [[Person alloc] initWithName:@"tom" gender:@"man" age:15 height:32.2 weight:23.2];
//    NSLog(@"%@ %@ %ld %.2f %.2f", [person name], [person gender], [person age], [person height], [person weight]);
//    [person setName:@"zengrong"];
    
//5
    // + 号方法的调用(也可改为 - 号方法)
//    NSInteger max = [Person maxValueFornumberone:3 numberTwo:5];
//    NSLog(@"%ld", max);
//    NSInteger min = [Person minValueFornumberone:3 numberTwo:5];
//    NSLog(@"%ld", min);
//    NSInteger GCD = [Person GCDValueFornumberone:3 numberTwo:9];
//    NSLog(@"%ld", GCD);
//    NSInteger LMC = [Person LCMValueFornumberone:3 numberTwo:5];
//    NSLog(@"%ld", LMC);
    
    //用 - 号方法实现
//    NSInteger max = [per maxValueFornumberone:3 numberTwo:5];
//    NSLog(@"%ld", max);
//    NSInteger min = [per minValueFornumberone:3 numberTwo:5];
//    NSLog(@"%ld", min);
//    NSInteger GCD = [per GCDValueFornumberone:3 numberTwo:9];
//    NSLog(@"%ld", GCD);
//    NSInteger LMC = [per LCMValueFornumberone:3 numberTwo:5];
//    NSLog(@"%ld", LMC);

      
    
    //输出方法
    //接口:
    // - (void)print:(Person *)per;
    //实现:
//     - (void)print:(Person *)per {
//          _name = [per setName:@"li"];
//          _gender = [per setGender:@"man"];
//          _age = [per setAge:22];
//          _heigth = [per setHeight:23];
//          _weigth = [per setWeight:34];
//       }
    //调用:
//    [per print:per];
 
    
    return 0;
}
