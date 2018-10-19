//
//  RootViewController.m
//  LessonResponserChain
//
//  Created by lanouhn on 15/11/5.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "RootViewController.h"
#import "ResponderView.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ResponderView *redView = [[ResponderView alloc] initWithFrame:CGRectMake(0, 0, 320, 284)];
    redView.backgroundColor = [UIColor redColor];
    redView.tag = 200;
    [self.view addSubview:redView];
    [redView release];
    ResponderView *yellowView = [[ResponderView alloc] initWithFrame:CGRectMake(0, 284, 320, 284)];
    yellowView.backgroundColor = [UIColor yellowColor];
    yellowView.userInteractionEnabled = NO;
    yellowView.tag = 201;
    [self.view addSubview:yellowView];
    [yellowView release];
    ResponderView *greenView = [[ResponderView alloc] initWithFrame:CGRectMake(50, 50, 220, 184)];
    greenView.backgroundColor = [UIColor greenColor];
    greenView.tag = 202;
    greenView.userInteractionEnabled = NO;
    [yellowView addSubview:greenView];
    [greenView release];
    ResponderView *blueView = [[ResponderView alloc] initWithFrame:CGRectMake(50, 50, 120, 84)];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.tag = 203;
    //关闭用户交互
    blueView.userInteractionEnabled = NO;
    
    [greenView addSubview:blueView];
    [blueView release];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"视图控制器");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
