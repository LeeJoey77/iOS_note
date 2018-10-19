//  main.m
//  LessonNSString

#import <Foundation/Foundation.h>
struct student {
    char name[20];
    char gender;
};
typedef struct student Student;
int main(int argc, const char * argv[]) {
   //API:
//    Inherits from 继承自
//    Conforms to 遵守什么协议
//    Framework 属于哪个框架
//    Availability 什么时候可用
//    Declaration in 声明在什么头文件
//    Related document 相关文档
//    Sample code 示例代码
    //苹果帮助文档作用:帮助开发者快速了解类的功能
    
    //对象是堆区空间不能参加运算
    //结构体,指针和基本数据类型都不能存储到 OC 数组中,OC 数组中只能存储对象
    
    //OC字符串类:
    //创建字符串对象
//    //1.使用初始化方法
//    NSString *str = [[NSString alloc] initWithFormat:@"I am %d ,from %s", 23, "Henan"];
//    NSLog(@"%@", str);
//
//    //控制台输入一个数字,打印iPhone的型号:
//    NSInteger a = 0;
//    NSLog(@"请输入一个数字:");
//    scanf("%ld", &a);
//    NSString *str1 = [[NSString alloc] initWithFormat:@"iPhone %ld", a];
//    NSLog(@"%@", str1);
//    
//    char b[10] = {0};
//    NSLog(@"请输入型号:");
//    scanf("%s", b);
//    NSString *string = [[NSString alloc] initWithFormat:@"iPhone %s", b];
//    NSLog(@"%@", string);
//    //2.便利构造器
//    NSString *str = [NSString stringWithFormat:@"I love iOS %d", 3];
//    NSLog(@"%@", str);
    
//    //initWithUTF8String 能够将 C 语言的字符串,转化为 OC 的字符串对象
//    char c[10];
//    NSLog(@"请输入型号:");
//    scanf("%s", c);
//    NSString *string1 = [[NSString alloc] initWithUTF8String:c];//参数必须为变量
//    NSString *string2 = [[NSString alloc] initWithFormat:@"iPhone %@", string1];
//    NSLog(@"%@", string2);

    
//    //3.字符串长度(求集合元素个数用count, 求C语言字符串长度用strlen);
//    NSString *str1 = [NSString stringWithFormat:@"Qunar 12k"];
//    NSUInteger length = [str1 length];//无符号整型
//    NSLog(@"%lu",length);
    
//    //4.判断字符串是否是以 http 开头,以 png结尾,如果是打印这是一个有效的图片链接,如果不是,打印连接出错
//    NSString *str = [NSString stringWithFormat:@"http//www.Qunar.com/picture/frankluozhao.png"];
//    //(1).判断是否是以 http 开头
//    //hasPrefix: 该方法判断字符串是否以某个字符串开头,返回值为 BOOL 类型
//    BOOL isPrefix = [str hasPrefix:@"http"];
//    //(2).判断是否是以 png 结尾
//    //hasSuffix: 该方法判断字符串是否以某个字符串结尾,返回值为 BOOL 类型;
//    BOOL isSulffix = [str hasSuffix:@"png"];
//    //(3).判断输出
//    if (isPrefix && isSulffix) {
//        NSLog(@"这是去哪儿网的图片链接");
//    }else {
//        NSLog(@"连接出错");
//    }
    
//    //5.判断两个字符是否相等
//    NSString *str1 = [NSString stringWithFormat:@"I want to get a job in Qunar"];
//    NSString *str2 = [NSString stringWithFormat:@"Henan university of science and technology"];
//    if ([str1 isEqualToString:str2]) {
//        NSLog(@"两个字符串相等");
//    }else {
//        NSLog(@"两个字符串不等");
//    }
    
//    //6.获取字符串的子串
//    //1.substringToIndex:获取从开头到给定的下标之间的字符串(从 0 开始, 不包括给定下标)
//    NSString *str = [NSString stringWithFormat:@"Henanuniversity"];
//    NSString *former = [str substringToIndex:1];
//    NSLog(@"%@", former);//输出:Henan
//    //2.substringFromIndex:获取从给定下标到结尾之间的字符串(从 0 开始, 包括下标)
//    NSString *latter = [str substringFromIndex:14];
//    NSLog(@"%@", latter);//输出:university
//    //3.获取 anun ,快速创建NSRange 结构体变量
//    NSString *str = [NSString stringWithFormat:@"Henanuniversity"];
//    NSString *newstr = [str substringWithRange:NSMakeRange(3, 4)];//第一个参数开始位数,第二个参数共截取几位
//    NSLog(@"%@", newstr);

//    //7.拼接字符串(通过第三方变量实现,原有字符串并没有改变)
//    NSString *str = [NSString stringWithFormat:@"河科大"];
//    //(1)stringByAppendingString
//    NSString *str1 = [str stringByAppendingString:@"位于洛阳市洛龙区"];
//    NSLog(@"%@", str1);
//    //(2)stringByAppendingFormat
//    NSString *str2 = [str1 stringByAppendingFormat:@"开元大道 %d 号",100];
//    NSLog(@"%@", str2);
    
//    //8.字符串替换
    //把 henan 替换成 zhengzhou
    NSString *str = [NSString stringWithFormat:@"lanouhenan"];
    NSString *newstr = [str stringByReplacingOccurrencesOfString:@"henan"
    withString:@"zhengzhou"];
    [str stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"i"];
    NSLog(@"%@", newstr);
    
//    //9.字符串比较
//    NSString *str1 = [NSString stringWithFormat:@"lebi"];
//    NSString *str2 = [NSString stringWithFormat:@"luyuan"];
//    //NSComparisonResult result = [str1 compare:str2];
//    //NSLog(@"%ld", result);
//    NSMutableArray *mArray = [@[str1, str2] mutableCopy];
//    NSComparisonResult result = [str1 compare:str2];
//    NSLog(@"%@", mArray);
//    //NSComparisonResult 枚举类型,升序值为 -1, 降序值为 1,相同结果为 0
    
//    //10.大小写转换
//    NSString *str = [NSString stringWithFormat:@"henan lanou"];
//    //(1)全部大写
//    NSString *upperStr = [str uppercaseString];
//    NSLog(@"%@", upperStr);
//    //(2)全部小写
//    NSString *lowerStr = [str lowercaseString];
//    NSLog(@"%@", lowerStr);
//    //(3)首字母大写(每个单词首字母,均变为大写)
//    NSString *capitalStr = [str capitalizedString];
//    NSLog(@"%@", capitalStr);
    
    
    //可变字符串与不可变字符串的区别:
    //1.可变字符串继承自不可变字符串,拥有不可变字符串所有的方法
    //2.可变字符串在不可变字符串的基础上,增加了,增,删,改的操作
    //3.可变字符串操作的是字符串本身,不可变字符串操作的是副本(本身不发生改变)

//    //可变字符串:继承自不可变字符串,在其基础上增加了,增,删,改的操作
//    //1.创建可变字符串(对字符串本身的操作)
//    NSMutableString *mStr1 = [[NSMutableString alloc] initWithCapacity:1];//capacity -- 大小,容量
//    NSMutableString *mStr2 = [NSMutableString stringWithCapacity:1];
//    //2.修改可变字符串
//    NSMutableString *mStr3 = [NSMutableString stringWithFormat:@"lanouhenan"];
//    //拼接 "42 班"
//    [mStr3 appendFormat:@"%d 班", 42];
//    NSLog(@"%@", mStr3);
//    [mStr3 appendString:@"panpan"];
//    NSLog(@"%@", mStr3);
//    //3.插入字符串
//    [mStr3 insertString:@"xiaomianbao" atIndex:[mStr3 length]];
//    NSLog(@"%@", mStr3);
//    //4.删除字符串
//    [mStr3 deleteCharactersInRange:NSMakeRange(5, 4)];
//    NSLog(@"%@", mStr3);
//    //5.替换字符串
//    [mStr3 replaceCharactersInRange:NSMakeRange(5, 1) withString:@"zhengzhou"];
//    NSLog(@"%@", mStr3);
//    //6.重置字符串
//    [mStr3 setString:@"I will get a job in Qunar or Huawei with the salary of 12KRMB a month"];
//    NSLog(@"%@", mStr3);
    
    
//****************************************************************************************************************************************************************
//    //笑笑语法:
//    NSString *string = @"iPhone";
//    NSMutableString *mString = [@"iPhone" mutableCopy];
//    NSArray *array = @[@"aa", @"bb", @"bbc"];
//    NSMutableArray *mArray = [@[@"bb", @"ll", @"junyi"] mutableCopy];
//    NSDictionary *dic = @{@"name":@"zhangsan", @"age":@18, @"gender":@"man"};
//    NSMutableDictionary *mDic = [@{@"name":@"zhangsan", @"age":@18, @"gender":@"man"} mutableCopy];
//    //获取数组中的元素
//    NSString *str1 = array[0];
//    NSString *str2 = mArray[0];
//    //获取字典中的元素
//    NSString *name = dic[@"name"];
//    NSNumber *age = mDic[@"age"];


//    //笑笑语法,语法糖 --- 字面量(变量需要加（）,数值可以不加)
//    (1)将基本数据类型转化为OC 的 NSNumber数值对象
//    NSNumber *newNum11 = @('a');//字符
//    NSLog(@"%@", newNum11);
//    NSNumber *newNum12 = @(10);//整型
//    NSLog(@"%@", newNum12);
//    NSNumber *newNum13 = @(YES);//BOOL
//    NSLog(@"%@", newNum13);
//
//    //(2)将 OC 的 NSNumber 数值对象转化为基本数据类型
//    NSNumber *num1 = @(110);
//    int cNum1 = [num1 intValue];
//    NSLog(@"%d", cNum1);
//
//    NSNumber *num2 = @(32.3);
//    float cNum2 = [num2 floatValue];
//    NSLog(@"%.2f", cNum2);
//
//    //(3)比较(变量需要加（）,数值可以不加)
//    NSNumber *numb1 = @10;
//    NSNumber *numb2 = @100;
//    NSComparisonResult result = [numb1 compare:numb2];
//    NSLog(@"%ld", result);//结果类型为枚举类型

    //非对象数据类型(int, float, char, 指针, 结构体, CGfloat, NSInteger, NSRange等)与
    //NSString , NSNumber, NSValue对象类型的相互转化
    //1.结构体,指针和基本数据类型等非对象数据类型都不能存储到 OC 数组中
    //2.OC 数组,字典,集合中只能存储对象,对象是堆区空间,不能参加运算
    
    //基本数值类型 与 NSString 创建的字符串对象转换
//    //(1)基本数据类型转化为字符串对象
//    int a = 10;
//    NSString *str1 = [NSString stringWithFormat:@"%d", a];
//    NSLog(@"%@", str1);
//    float b = 3.14;
//    NSString *str2 = [NSString stringWithFormat:@"%.2f", b];
//    NSLog(@"%@", str2);
//    //(2)OC 的NSString字符串对象转化为基本数据类型
//    NSString *string1 = [NSString stringWithFormat:@"10"];
//    int valu1 = [string1 intValue];
//    NSLog(@"%d", valu1);
//    NSString *string2 = [NSString stringWithFormat:@"20.20"];
//    float valu2 = [string2 floatValue];
//    NSLog(@"%.2f", valu2);
//    NSString *string3 = [NSString stringWithFormat:@"2007"];
//    long valu3 = [string3 integerValue];
//    NSLog(@"%ld", valu3);//Integer 类型用 long 接收
//    //(3)initWithUTF8String 能够将 C 语言的字符串,转化为 OC 的字符串对象
//    char c[10];
//    NSLog(@"请输入型号:");
//    scanf("%s", c);
//    NSString *string = [[NSString alloc] initWithUTF8String:c];//参数必须为变量
//    NSString *str = [[NSString alloc] initWithFormat:@"iPhone %@", string];
//    NSLog(@"%@", str);
    
    //NSValue 数值类,将指针 结构体等转化为对象
//    //1.1将指针变量转化为 NSValue 数值对象
//    int a = 3;
//    int *p = &a;
//    NSValue *value = [NSValue valueWithPointer:p];
//    NSMutableArray *mArray = [@[value] mutableCopy];
//    NSLog(@"%@", mArray);
//    //1.2将 NSValue 对象,转化为指针变量
//    int *newP = [value pointerValue];
//    NSLog(@"%p", newP);
    
//    //2.1将系统 NSRange 结构体变量转化为 NSValue 数值对象
//    NSRange range = {13, 1};
//    NSValue *value = [NSValue valueWithRange:range];
//    NSLog(@"%@", value);
//    //2.2将 NSValue 对象转化为 NSRange 结构体变量
//    NSRange nRange = [value rangeValue];
//    NSLog(@"%lu %lu", nRange.location, nRange.length);
    
//    //2.3将自定义结构体变量转化为 NSValue 对象
//    Student stu = {"lijunyi", 'f'};
//    //Student --- NSValue
//    NSValue *value = [NSValue valueWithBytes:&stu objCType:@encode(Student)];
//    NSLog(@"%@", value);
//    //2.4将NSValue 对象转化为自定义结构体变量
//    //NSValue --- Student
//    Student newStu = {0};
//    [value getValue:&newStu];
//    NSLog(@"%s, %c", newStu.name, newStu.gender);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    return 0;
}
