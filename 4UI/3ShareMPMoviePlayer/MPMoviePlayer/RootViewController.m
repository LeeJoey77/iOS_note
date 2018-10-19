//
//  RootViewController.m
//  MPMoviePlayer
//
//  Created by lanouhn on 15/12/8.
//  Copyright (c) 2015年 王硕. All rights reserved.
//

#import "RootViewController.h"
#import "SingleViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 100, 60, 50);
    [button setTitle:@"跳转" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(handlePush:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    
}


- (void)handlePush:(UIButton *)sender {
    SingleViewController *single = [[SingleViewController alloc] init];
    [self.navigationController pushViewController:single animated:YES];
    [single release];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
