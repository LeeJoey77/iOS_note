//
//  SecondViewController.m
//  LessonPassValue
//
//  Created by lanouhn on 15/11/11.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
@class FirstViewController;
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)dealloc {
    self.data = nil;
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:128 / 255.0 green:255 / 255.0 blue:122 / 255.0 alpha:1];
    [self setupNextButton];
    [self setupPreviousButton];
    [self setupLabel];
    [self setupTextField];
}

//创建NextButton
- (void)setupNextButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(120, 100, 100, 30);
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"Next" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(handleNextButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
}

- (void)handleNextButton:(UIButton *)button {
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    [self.navigationController pushViewController:thirdVC animated:YES];
}

//创建PreviousButton
- (void)setupPreviousButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(120, 150, 100, 30);
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"Back" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(handlePreviousButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
}

- (void)handlePreviousButton:(UIButton *)button {
    //代理传值第六步:让代理执行任务
    //安全处理:判断代理是否实现了协议中的方法,防止崩溃
    if ([self.delegate respondsToSelector:@selector(passValue:)]) {
        UITextField *textField = (UITextField *)[self.view viewWithTag:1111];
        //让代理干活,此时把输入框中的内容传过去
        [self.delegate passValue:textField.text];
    }
    
    [self.navigationController popToViewController:self.navigationController.viewControllers[0] animated:YES];
}

//创建Label
- (void)setupLabel {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 200, 200, 30)];
    label.text = self.data;
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    [label release];
}

//创建textField
- (void)setupTextField {
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(40, 250, 250, 30)];
    textField.tag = 1111;//不在同一个界面上的视图的tag值可以相同
    textField.backgroundColor = [UIColor greenColor];
    textField.placeholder = @"输入内容让下一个界面显示";
    [self.view addSubview:textField];
    [textField release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
