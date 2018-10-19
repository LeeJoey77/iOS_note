//
//  ForthViewController.m
//  LessonPassValue
//
//  Created by lanouhn on 15/11/11.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "ForthViewController.h"
@interface ForthViewController ()

@end

@implementation ForthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:250 / 255.0 green:255 / 255.0 blue:122 / 255.0 alpha:1];
    [self setupButton];
    [self setupLabel];
    [self setupTextField];
}

//创建Button
- (void)setupButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(120, 100, 100, 30);
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"Back" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(handleButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
}

- (void)handleButton:(UIButton *)button {
[self.navigationController popToViewController:self.navigationController.viewControllers[2] animated:YES];}

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
    textField.placeholder = @"输入内容让下一个界面显示";
    [self.view addSubview:textField];
    [textField release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
