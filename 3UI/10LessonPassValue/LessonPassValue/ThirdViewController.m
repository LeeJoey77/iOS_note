//
//  ThirdViewController.m
//  LessonPassValue
//
//  Created by lanouhn on 15/11/11.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "ThirdViewController.h"
#import "ForthViewController.h"
#import "Singleton.h"
@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:250 / 255.0 green:128 / 255.0 blue:255 / 255.0 alpha:1];
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
    ForthViewController *forthVC = [[ForthViewController alloc] init];
    [self.navigationController pushViewController:forthVC animated:YES];
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
    [self.navigationController popToViewController:self.navigationController.viewControllers[1] animated:YES];
}

//创建Label
- (void)setupLabel {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 200, 200, 30)];
    label.text = @"显示下一个界面的内容";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    [label release];
}

//创建textField
- (void)setupTextField {
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(40, 250, 250, 30)];
    textField.backgroundColor = [UIColor greenColor];
    
    //单例传值第四步:取用对象中存储的值
    textField.text = [Singleton mainSingleton].data;

    textField.placeholder = @"输入内容让下一个界面显示";
    [self.view addSubview:textField];
    [textField release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
