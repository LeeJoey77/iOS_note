//
//  FirstViewController.m
//  LessonPassValue
//
//  Created by lanouhn on 15/11/11.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "Singleton.h"
//代理传值第四步:代理所属的类服从协议
@interface FirstViewController ()<SecondViewContrllerDelegate>

@end

@implementation FirstViewController

//界面传值之一:从前往后传
//属性传值
//一:在后一个界面定义属性(属性类型和传输数据类型一致)
//二:在前一个界面进入后一个界面之前把值传给后一个界面

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:250 / 255.0 green:128 / 255.0 blue:122 / 255.0 alpha:1];
    [self setupButton];
    [self setupLabel];
    [self setupTextField];
}

//创建Label
- (void)setupLabel {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 200, 200, 30)];
    label.text = @"显示下一个界面的内容";
    label.tag = 1111;
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    [label release];
}

//创建textField
- (void)setupTextField {
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(40, 250, 250, 30)];
    textField.backgroundColor = [UIColor greenColor];
    textField.tag = 111;
    textField.placeholder = @"输入内容让下一个界面显示";
    [self.view addSubview:textField];
    [textField release];
}

//创建Button
- (void)setupButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(120, 100, 100, 30);
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"Next" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(handleButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
}

/*
//代理传值
- (void)handleButton:(UIButton *)button {
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    
    //属性传值之二:进入后一个界面之前将值传给下一个界面
    secondVC.data = ((UITextField *)[self.view viewWithTag:111]).text;

    //代理传值第三步:进入后一个界面之前,指定后一个界面的代理为前一个界面
    secondVC.delegate = self;
    [self.navigationController pushViewController:secondVC animated:YES];
    [secondVC release];
}

#pragma mark --- SecondViewControllerDelegate
//代理传值第五步:实现协议中的方法
- (void)passValue:(NSString *)data {
    ((UILabel *)[self.view viewWithTag:1111]).text = data;
}
*/
 
//单例传值
- (void)handleButton:(UIButton *)button {
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    
    //创建单例对象,保存要传输的值
    Singleton *singleton = [Singleton mainSingleton];
    singleton.data = ((UITextField *)[self.view viewWithTag:111]).text;
    
    [self.navigationController pushViewController:secondVC animated:YES];
    //不能在此处手动释放,单例会在运行结束后自动释放,定义Button时,也不能手动释放
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
