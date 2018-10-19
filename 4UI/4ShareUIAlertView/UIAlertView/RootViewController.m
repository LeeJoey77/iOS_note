//
//  RootViewController.m
//  UIAlertView
//
//  Created by lanouhn on 15/11/9.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()<UIAlertViewDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 200, 100, 50);
    [button setTitle:@"click here" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(upButton:) forControlEvents:UIControlEventTouchDown];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)upButton:(UIButton *)sender {
    //1.创建对象
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"确认删除?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    //2.配置警示框属性
    //(1)设置警示框样式,共四种(一次只能显示一种)
//    alertView.alertViewStyle = UIAlertActionStyleDefault;//无文本框
//    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;//一个文本输入框
//    alertView.alertViewStyle = UIAlertViewStyleSecureTextInput;//一个密码输入框
    alertView.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;//一个文本框和一个密码输入框
    //(2)添加Button,可以添加多个,下标根据添加顺序确定
    NSInteger index = [alertView addButtonWithTitle:@"返回"];//添加按钮
    NSLog(@"%ld", index);
    [alertView addButtonWithTitle:@"返回1"];
    [alertView addButtonWithTitle:@"返回2"];
    NSString *buttonTitle = [alertView buttonTitleAtIndex:2];
    NSLog(@"%@", buttonTitle);
    
    //3.展示
    [alertView show];
    //4.释放
    [alertView release];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"%ld", buttonIndex);
}

//alertView即将消失时执行的事件
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"即将消失");
}

//alertView已经消失时执行的事件
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"消失了");
}

//alertView已经显示时执行的事件
- (void)didPresentAlertView:(UIAlertView *)alertView {
    NSLog(@"已经显示");
}

//alertView即将显示时执行的事件
- (void)willPresentAlertView:(UIAlertView *)alertView {
    NSLog(@"即将显示");
}




@end
