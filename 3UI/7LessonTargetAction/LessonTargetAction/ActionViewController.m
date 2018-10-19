//
//  ActionViewController.m
//  LessonTargetAction
//
//  Created by lanouhn on 15/11/6.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "ActionViewController.h"
#import "UIColor+RandomColor.h"
#import "ActionView.h"
@interface ActionViewController ()

@end

@implementation ActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //redView --- 点击视图,改变视图颜色
    ActionView *redView = [[ActionView alloc] initWithFrame:CGRectMake(60, 50, 200, 100)];
    redView.backgroundColor = [UIColor redColor];
    redView.tag = 200;
    //给redView添加点击事件
    [redView addTarget:self action:@selector(changeSelfColor:)];
    [self.view addSubview:redView];
    [redView release];
    
    //greenView --- 点击视图,改变父视图颜色
    ActionView *greenView = [[ActionView alloc] initWithFrame:CGRectMake(60, 180, 200, 100)];
    greenView.backgroundColor = [UIColor greenColor];
    greenView.tag = 201;
    //给greenView添加点击事件
    [greenView addTarget:self action:@selector(changeSuperViewColor:)];
    [self.view addSubview:greenView];
    [greenView release];
    
    //blueView --- 点击视图,改变视图位置
    ActionView *blueView = [[ActionView alloc] initWithFrame:CGRectMake(60, 310, 200, 100)];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.tag = 202;
    //给blueView添加点击事件
    [blueView addTarget:self action:@selector(changeSelfCenter:)];
    [self.view addSubview:blueView];
    [blueView release];
    
    //grayView --- 点击视图,改变自身视图大小
    ActionView *grayView = [[ActionView alloc] initWithFrame:CGRectMake(60, 440, 200, 100)];
    grayView.backgroundColor = [UIColor grayColor];
    grayView.tag = 203;
    [self.view addSubview:grayView];
    [grayView release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- target/action
//红色视图
- (void)changeSelfColor:(ActionView *)aView {
    aView.backgroundColor = [UIColor randomColor];
}

//绿色视图
- (void)changeSuperViewColor:(ActionView *)aView {
    aView.superview.backgroundColor = [UIColor randomColor];
    //或
    //self.view.backgroundColor = [UIColor randomColor];
}

//蓝色视图
- (void)changeSelfCenter:(ActionView *)aView {
    aView.center = CGPointMake(arc4random() % (220 - 100 + 1) + 100, arc4random() % (518 - 50 + 1) + 50);
}
@end
