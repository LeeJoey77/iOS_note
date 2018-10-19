//
//  RootViewController.m
//  ToolBar
//
//  Created by lanouhn on 15/12/14.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "RootViewController.h"
#import "ToolViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.title = @"ToolBar";
    //配置toolBar
    [self configureToolBar];
}

//配置toolBar
- (void)configureToolBar {
    //让toolBar显示,默认高度49
    self.navigationController.toolbarHidden = NO;
    //设置属性
    self.navigationController.toolbar.tintColor = [UIColor greenColor];
    //
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:nil action:nil];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:nil action:nil];
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:nil action:nil];
    //UIBarButtonSystemItemFlexibleSpace控制间隔
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    //自定义barBuItem
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(120, 300, 100, 30);
    [button setTitle:@"我的" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithCustomView:button];
    //添加到toolBar
    NSArray *array = @[space, item1, space, item2, space, item3, btn];
    self.toolbarItems = array;
    
}

- (void)handleButtonAction:(UIButton *)sender {
    ToolViewController *toolVC = [[ToolViewController alloc] init];
    [self.navigationController pushViewController:toolVC animated:YES];
    [toolVC release];
}

//视图出现时,让toolBar显示
- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.toolbarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
