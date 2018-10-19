//
//  FirstViewController.m
//  LesonUINavigation
//
//  Created by lanouhn on 15/11/11.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //设置self.view 的背景颜色,不包括状态和导航条(状态条高度为 20,导航条高度为 44)
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    //配置导航条公共属性
    [self configureNavigationBarCommonProperty];
    
    //自定义本页面导航条
    [self configureNavigationBarContent];
    
    //创建Button,点击Button进入下一界面
    [self setupButton];

}

//配置导航条的公共属性(用self.navigationController.  设置的属性都是公共属性)
- (void)configureNavigationBarCommonProperty {
    //1.修改导航条颜色,不设置时看到的是有毛玻璃效果的导航栏的背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor purpleColor];
    //2.修改导航条的渲染颜色(leftBarButtonItem 和rightBarButtonItem 的颜色,默认为蓝色)
    self.navigationController.navigationBar.tintColor = [UIColor greenColor];
    //3.关闭导航条的毛玻璃效果
    //设置导航栏的背景颜色(不是导航条的颜色),透过毛玻璃看到的颜色
    self.navigationController.navigationBar.backgroundColor = [UIColor yellowColor];
    self.navigationController.navigationBar.translucent = YES;
    //4.隐藏,导航条设置为隐藏时,self.view.backgroundColor 设置的是全屏的颜色
    //        self.navigationController.navigationBarHidden = YES;
    //5.导航条设置图片
    //    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"32064.png"] forBarMetrics:UIBarMetricsDefault];
    //状态条高度20,导航条高度44
    //当图片尺寸小于44或者大于44且小于64时,图片呈现平铺状态充满整个状态条和导航条的整块64的区域
    //当图片等于44时,图片只显示在导航条上
    //当图片尺寸等于64时,图片会显示在状态条和导航条上
}

//自定义本页面导航条
- (void)configureNavigationBarContent {
    //1.配置导航条的title
    self.navigationItem.title = @"第一个界面";
    //2.修改导航条上title的颜色和文字大小(针对所有界面的导航条进行的修改)
    NSDictionary *dic = @{NSForegroundColorAttributeName:[UIColor redColor], NSFontAttributeName:[UIFont systemFontOfSize:20]};//默认为黑色
    self.navigationController.navigationBar.titleTextAttributes = dic;
    //3.配置导航条的titleView
//    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"消息", @"电话"]];
//    self.navigationItem.titleView = segmentedControl;
    //4.配置left
    //系统
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(handleLeftBarAction:)];
    //自定义
//    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"add_contact"] style:UIBarButtonItemStylePlain target:self action:@selector(handleLeftAction:)];
    
    self.navigationItem.leftBarButtonItem = left;
    
    //5.配置right
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(handleRightBarAction:)];
    self.navigationItem.rightBarButtonItem = right;
//    [segmentedControl release];
    [left release];
    [right release];
}

//leftBarButtonItem
- (void)handleLeftBarAction:(UIBarButtonItem *)buttonItem {
    NSLog(@"left");
}


//rightBarButtonItem
- (void)handleRightBarAction:(UIBarButtonItem *)buttonItem {
    NSLog(@"right");
}

//创建Button
- (void)setupButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(140, 300, 70, 25);
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"Next" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(handleButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
}

//Button点击事件
- (void)handleButton:(UIButton *)button {
    //1.创建第二个界面的视图控制器对象
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    //2.通过导航控制器进入下一个页面(视图控制器的navigationController属性能够获取到管理自身的导航控制器)
    [self.navigationController pushViewController:secondVC animated:YES];
    //3.释放
    [secondVC release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- self.view
- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    NSLog(@"%s %d", __FUNCTION__, __LINE__);
}

- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    NSLog(@"%s %d", __FUNCTION__, __LINE__);
}

- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    NSLog(@"%s %d", __FUNCTION__, __LINE__);
}

- (void)viewDidDisappear:(BOOL)animated {
//    [super viewDidDisappear:animated];
//    NSLog(@"%s %d", __FUNCTION__, __LINE__);
}

@end
