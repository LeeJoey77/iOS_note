//
//  ViewController.m
//  ProjectBlockDemo
//
//  Created by lanouhn on 15/12/9.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "ViewController.h"
#import "BlockViewController.h"


#define NSLog(format, ...) do { \
fprintf(stderr, "<%s : %d> %s\n", \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], \
__LINE__, __func__); \
(NSLog)((format), ##__VA_ARGS__); \
fprintf(stderr, "-------\n"); \
} while (0)

//MyBlock --- void (^)()
typedef void (^MyBlock1)();

typedef NSString *(^Blaaa)();
//MyNewBlock1 --- int(^)(int, int)
typedef int (^MyNewBlock2)(int, int);

//MyBlock --- void (^)(NSString *)
typedef void (^MyBlock)(NSString *);

@interface ViewController ()
@property (strong, nonatomic) IBOutlet  UIView *button;
@property (nonatomic, copy) MyBlock myBlock3;//block作为属性
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //Block代码块,有个标示 ^
    //Block有两个重要元素,参数和返回值
    //1.无参无返回值:
    //声明:
    void (^myBlock1)() = ^{
        NSLog(@"A 段项目");
    };
    //调用
    myBlock1();
    
    //2.有参无返回值(Block类型中可以只写参数类型,不写参数)
    void (^myBlock2)(int, int) = ^(int value1, int value2){
        NSLog(@"%d", value1 + value2);
    };
    myBlock2(2, 3);
    
    //3.无参有返回值
    NSString *(^myBlock3)() = ^{
        return @"block";
    };
    NSString *string = myBlock3();
    NSLog(@"%@", string);
    
    //4.有参有返回值
    //返回值类型: NSString *
    //形参: (NSString *, NSString *)
    //函数名: myBlock4
    NSString *(^myBlock4)(NSString *, NSString *) = ^(NSString *str1, NSString *str2){
        return [str1 stringByAppendingString:str2];
    };
    NSString *str = myBlock4(@"I love", @" you!");
    NSLog(@"%@", str);
    
    //重定义
    MyNewBlock2 block1 = ^(int value1, int value2){
        return value1 + value2;
    };
    int sum = block1(2, 3);
    NSLog(@"%d", sum);
    
    //1.在block内部调用外部定义的变量, 是将外部变量拷贝了一份,两者的地址不同
    //2.block内部只能访问外部变量,不能修改外部变量
    //3.如果想让block内部的变量得到原本, 那么就要在前面加 __block(两个下划线)
    int a1 = 10;
    MyBlock1 myBlock5 = ^{
//        a1++;               //Block内部不能修改外部变量
        NSLog(@"a1 = %d", a1);//后调用, a1 = 10
        NSLog(@"%p", &a1);
    };
    a1 ++;
    NSLog(@"a1 == %d", a1);//先调用, a1 == 11
    NSLog(@"%p", &a1);
    //调用
    myBlock5();
    
    __block int a = 10;
    MyBlock1 myBlock6 = ^{
        a++;
        int b = a;
        NSLog(@"a = %d", b);
        NSLog(@"这是一个Block");
    };
    //调用
    myBlock6();
    
    //block循环引用  ----- 某些情况下,在block内部使用self 会产生循环引用
    //myBlock3 定义为属性会产生循环引用
//    self.myBlock3 = ^(NSString *str) {
//        self.view.backgroundColor = [UIColor redColor];
//    };
//    _myBlock3(@"haah");

    //解决循环引用   ----- 在ARC情况下,用 __weak, MRC情况下用 __block
    //弱引用(ARC下): __weak, 引用计数不加 1
    //强引用: 类似于 retain, copy, 引用计数加 1
    __weak ViewController *VC = self;
    self.myBlock3 = ^(NSString *str) {
        VC.view.backgroundColor = [UIColor redColor];
    };
    _myBlock3(@"haha");
}

//block当参数的使用
//定义一个方法,带block参数
- (void)loginWithUserID:(NSString *)userID withPassword:(NSString *)password withResult:(MyBlock)result {
    
    if ([userID isEqualToString:@"123"] && [password isEqualToString:@"123"]) {
        //登录成功
        result(@"登陆成功");//调用block
    }else {
        //登陆成功
        result(@"登陆失败,请重新输入");//调用block
    }
}

- (IBAction)handleButtonAction:(UIButton *)sender {
    
    //调用login方法
    [self loginWithUserID:@"123" withPassword:@"123" withResult:^(NSString *resultStr) {
        NSLog(@"%@", resultStr);
    }];
    
    BlockViewController *blockVc = [self.storyboard instantiateViewControllerWithIdentifier:@"Block"];
    blockVc.aBlock = ^(NSString *param1, NSString *param2) {
        self.title = [NSString stringWithFormat:@"%@%@", param1, param2];
    };
    [self.navigationController pushViewController:blockVc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
