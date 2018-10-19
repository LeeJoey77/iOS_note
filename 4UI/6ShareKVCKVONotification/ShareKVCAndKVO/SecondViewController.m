//
//  SecondViewController.m
//  ShareKVCAndKVO
//
//  Created by lanouhn on 15/12/24.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(140, 200, 70, 30);
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"click" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
    
}

- (void)handleButtonAction:(UIButton *)sender {
    //发送通知
    //参数:1.通知名 2.发送者 3.需要传递的信息,字典类型
    [[NSNotificationCenter defaultCenter] postNotificationName:@"Class 42" object:self userInfo:[NSDictionary dictionaryWithObject:[UIColor redColor] forKey:@"color"]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
