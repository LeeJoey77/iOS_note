//
//  FirstViewController.m
//  ShareKVCAndKVO
//
//  Created by lanouhn on 15/12/24.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

//创建firstVC时,给firstVC添加观察者
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //添加观察者
        //参数:1.观察者 2.响应方法 3.通知名 4.发送者,一般为nil,即不指定发送者,可以接受任何通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeColor:) name:@"Class 42" object:nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //如果在AppDelegate里设置背景色, 则在创建firstVC时, 已经调用viewDidLoad 方法
    //在viewDidLoad 里设置backgroundColor,创建firstVC时, 没有调用viewDidLoad 方法
    self.view.backgroundColor = [UIColor purpleColor];

}

//通知的响应方法
- (void)changeColor:(NSNotification *)sender {
    NSLog(@"%@", sender);
    self.view.backgroundColor = [sender.userInfo objectForKey:@"color"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
