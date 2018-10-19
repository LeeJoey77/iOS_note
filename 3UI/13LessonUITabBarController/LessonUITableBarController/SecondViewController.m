//
//  SecondViewController.m
//  LessonUITableBarController
//
//  Created by lanouhn on 15/11/18.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"第二个界面即将出现");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"第二个界面已经出现");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"第二个界面即将消失");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"第二个界面已经消失");
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
