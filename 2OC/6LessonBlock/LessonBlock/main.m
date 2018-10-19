
//  main.m
//  LessonBlock

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
   
  //数组排序
    //初级排序:
    
//    NSMutableArray *mArray = [@[@"jiji", @"gege", @"mm", @"lili", @"toss", @"lili"] mutableCopy];
//    [mArray sortUsingSelector:@selector(compare:)];//compare 字符串比较函数
//    NSLog(@"%@", mArray);
    Student *stu1 = [Student studentWithName:@"lily" gender:@"f" age:12];
    Student *stu2 = [Student studentWithName:@"ross" gender:@"m" age:22];
    Student *stu3 = [Student studentWithName:@"rachel" gender:@"f" age:21];
    Student *stu4 = [Student studentWithName:@"monica" gender:@"f" age:21];
    Student *stu5 = [Student studentWithName:@"joey" gender:@"m" age:20];
    NSArray *array = @[stu1, stu2, stu3, stu4, stu5];
    
    //姓名升序
    NSArray *sortNameArray = [array sortedArrayUsingSelector:@selector(compareByname:)];
    NSLog(@"%@", sortNameArray);
    //年龄降序
    NSArray *sortAgeArray = [array sortedArrayUsingSelector:@selector(compareByage:)];
    NSLog(@"%@", sortAgeArray);
    

    
    
    //Block 块语法:可以在函数内定义的匿名函数
    //Block 类型:int (^)(int a, int b) --- 作为类型时,变量名可以省略
    //Block 变量:sumValueBlock  --- 相当于方法名
    //Block 初值:^int(int a, int b) {return a + b}; --- 此时的返回值类型 int可以省略
    //以求两个数的和为例:
//    int (^sumValueBlock)(int a, int b) = ^int(int a, int b) {
//        return a + b;
//    };
//   //如何调用 Block
//   int sum = sumValueBlook(3, 5);
//    NSLog(@"%d", sum);
//    //重命名
//    typedef int (^SumBlock)(int , int);//SumBlock = int (^)(int a, int b)
//    SumBlock sumValue = ^(int a, int b) {
//        return a + b;
//    };
//    int result = sumValue(3, 9);
//    NSLog(@"%d", result);
//    
//    //1.定义 Block 输出 I Love iOS!
//    void (^printBlock)() = ^void() {
//        NSLog(@"I Love iOS");
//    };
//    printBlock();
//    //2.定义 Block 将 int 型, 转化为 OC 的字符串
//    NSString *(^transform)(int a) = ^NSString *(int a) {
//        NSString *str = [NSString stringWithFormat:@"%d", a];
//        return str;
//    };
//    NSString *str = transform(3333338);
//    NSLog(@"%@", str);
//    
//    //定义 Block 实现两个字符串对象的比较
//    NSComparisonResult (^compare)(NSString *, NSString *) = ^ (NSString *str1, NSString *str2) {
//        NSComparisonResult result = [str1 compare:str2];
//        return result;
//    };
//    NSComparisonResult resu = compare(@"ross", @"joey");
//    NSLog(@"%ld", resu);
//    
//    
//    
    //数组排序高级
//    NSArray *array1 = @[@"aa", @"joey", @"ross", @"li"];
//    NSArray *sortArray = [array1 sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
//        NSString *str1 = (NSString *)obj1;
//        NSString *str2 = (NSString *)obj2;
//        return [str1 compare:str2];//把 Block 的初值做回调函数的参数
//    }];
//    NSLog(@"%@", sortArray);
//
//    Student *stu11 = [Student studentWithName:@"lily" gender:@"f" age:12];
//    Student *stu22 = [Student studentWithName:@"ross" gender:@"m" age:22];
//    Student *stu33 = [Student studentWithName:@"rachel" gender:@"f" age:21];
//    Student *stu44 = [Student studentWithName:@"monica" gender:@"f" age:21];
//    Student *stu55 = [Student studentWithName:@"joey" gender:@"m" age:20];
//    NSMutableArray *mArray = [@[stu11, stu22, stu33, stu44, stu55] mutableCopy];
//    //实现姓名降序
//    NSArray *decArray = [mArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
//        Student *stu1 = (Student *)obj1;
//        NSLog(@"1 %@", [stu1 name]);
//        Student *stu2 = (Student *)obj2;
//        NSLog(@"2 %@", [stu2 name]);
//        return [[stu1 name] compare:[stu2 name]];
//    }];
//    NSLog(@"%@", decArray);
    
     
    
    


    return 0;
}
