//
//  ViewController.m
//  TwoStoryBoard
//
//  Created by lanouhn on 15/12/28.
//  Copyright © 2015年 李杨. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//跳转到第二个控制器的点击事件
- (IBAction)toSecondVCActon:(UIButton *)sender {
    //找到对应的Storyboard
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"TwoStoryboard" bundle:nil];
    //找到对应的视图控制器
    //storyboard入口对应的控制器
    SecondViewController *secondVC = [storyBoard instantiateInitialViewController];
    [self presentViewController:secondVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
