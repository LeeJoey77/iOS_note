//
//  ForthViewController.m
//  LesonUINavigation
//
//  Created by lanouhn on 15/11/11.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "ForthViewController.h"
#import "FirstViewController.h"
@interface ForthViewController ()

@end

@implementation ForthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:255 / 255.0 green:255 / 255.0 blue:122 / 255.0 alpha:1];
    //创建Button,点击Button进入下一界面
    [self setupButton];
}

//创建Button
- (void)setupButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(120, 300, 70, 25);
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"Return" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(handleButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
}

//Button点击事件
- (void)handleButton:(UIButton *)button {
    //1.返回上一界面
//    [self.navigationController popViewControllerAnimated:YES];
    //2.返回当前控制器所在的导航控制器所管理的根视图控制器
//    [self.navigationController popToRootViewControllerAnimated:YES];
    //3.返回指定的视图控制器
    [self.navigationController popToViewController:self.navigationController.viewControllers[1] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
