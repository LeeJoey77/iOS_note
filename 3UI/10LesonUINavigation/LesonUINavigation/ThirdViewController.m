//
//  ThirdViewController.m
//  LesonUINavigation
//
//  Created by lanouhn on 15/11/11.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "ThirdViewController.h"
#import "ForthViewController.h"
@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:128 / 255.0 green:128 / 255.0 blue:255 / 255.0 alpha:1];
    //创建Button,点击Button进入下一界面
    [self setupButton];
    [self configureNavigationBarContent];
}

- (void)configureNavigationBarContent {
    self.navigationItem.title = @"第三个界面";
}
//创建Button
- (void)setupButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(120, 300, 70, 25);
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"Next" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(handleButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
}

//Button点击事件
- (void)handleButton:(UIButton *)button {
    ForthViewController *forthVC = [[ForthViewController alloc] init];
    [self.navigationController pushViewController:forthVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
