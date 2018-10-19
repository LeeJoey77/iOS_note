//
//  RootViewController.m
//  LessonUIPageControl
//
//  Created by lanouhn on 15/11/10.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //UIPageControl 分页控件,提供以下几个功能:
        //1.展示当前页数
        //2.展示当前是第几页
        //3.切换pageControl的当前显示的点,对应显示不同的界面
    
    //1.创建控件
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(20, 100, 280, 40)];
    //2.配置属性
    pageControl.backgroundColor = [UIColor redColor];
    //设置显示的总页数
    pageControl.numberOfPages = 10;
    //设置默认的当前点
    pageControl.currentPage = 0;
    //设置点的颜色
    pageControl.pageIndicatorTintColor = [UIColor greenColor];
    //设置当前展示的点的颜色
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    //添加点击事件
    [pageControl addTarget:self action:@selector(handlePageControl:) forControlEvents:UIControlEventValueChanged];
    //3.添加到父视图
    [self.view addSubview:pageControl];
    //4.释放
    [pageControl release];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- handlePageControl
- (void)handlePageControl:(UIPageControl *)pageControl {
    NSLog(@"%ld", pageControl.currentPage);
}




@end
