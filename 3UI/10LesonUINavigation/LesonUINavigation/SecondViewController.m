//
//  SecondViewController.m
//  LesonUINavigation
//
//  Created by lanouhn on 15/11/11.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:128 / 255.0 green:255 / 255.0 blue:122 / 255.0 alpha:1];
//    //视图控制器自带的视图在viewWillAppear中加载
//    NSLog(@"superView = %@", self.view.superview);
    //创建Button,点击Button进入下一界面
    [self setupButton];
    [self configureNavigationBarContent];
}

- (void)configureNavigationBarContent {
    self.navigationItem.title = @"第二个界面";
}
//创建Button
- (void)setupButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(120, 300, 70, 25);
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"next" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(handleButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
}

//Button点击事件
- (void)handleButton:(UIButton *)button {
    //1.创建第三个界面的视图控制器对象
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    //2.通过导航控制器跳转到下一界面(视图控制器的navigationController属性能够获取到管理自身的导航控制器)
    [self.navigationController pushViewController:thirdVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- self.view

//界面切换时,视图的变换过程:
//1.从前一个界面到下一个界面: A push到 B,
//A --- viewWillDisappear,
//B --- viewWillAppear,
//A --- viewDidDisappear,
//B --- viewDidAppeare
//2.从后一个界面返回前一个界面: B pop到 A,
//B --- viewWillDisappear,
//A --- viewWillAppear,
//B --- viewDidDisappear,
//A --- viewDidAppeare

- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    NSLog(@"%s %d", __FUNCTION__, __LINE__);
//    NSLog(@"superView = %@", self.view.superview);
}

- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    NSLog(@"%s %d", __FUNCTION__, __LINE__);
}

- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    NSLog(@"%s %d", __FUNCTION__, __LINE__);
}

- (void)viewDidDisappear:(BOOL)animated {
//    [super viewDidDisappear:animated];
//    NSLog(@"%s %d", __FUNCTION__, __LINE__);
}

@end
