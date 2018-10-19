//
//  RootViewController.m
//  LessonTouch
//
//  Created by lanouhn on 15/11/5.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "RootViewController.h"
#import "TouchView.h"
#import "PanView.h"
#import "PinchView.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    TouchView *centerView = [[TouchView alloc] initWithFrame:CGRectMake(60, 184, 200, 200)];
//    centerView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:centerView];
//    [centerView release];
    
//    PanView *centerView = [[PanView alloc] initWithFrame:CGRectMake(60, 184, 200, 200)];
//    centerView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:centerView];
//    [centerView release];
    
//    PinchView *centerView = [[PinchView alloc] initWithFrame:CGRectMake(60, 184, 200, 200)];
//    centerView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:centerView];
//    [centerView release];
    
    
    //验证bounds特性
    PinchView *view = [[PinchView alloc] initWithFrame:CGRectMake(60, 184, 200, 200)];
    NSLog(@"%.2f %.2f %.2f %.2f", view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
    view.bounds = CGRectMake(0, 0, 100 , 100 );
   view.bounds = CGRectMake(50, 50, 100, 100);//调整bounds的size时,中心点不变(中心点为frame确定的中心点),视图进行比例放缩,左上角点的位置随之改变
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    [view release];
//    PinchView *view1 = [[PinchView alloc] init];//视图用父类的init 初始化,frame为0
//    NSLog(@"%.2f %.2f %.2f %.2f", view1.frame.origin.x, view1.frame.origin.y, view1.frame.size.width, view1.frame.size.height);//输出:0.00 0.00 0.00 0.00
//    view1.frame = CGRectMake(0, 210, 210 , 210 );
//    view1.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:view1];
//    [view1 release];
    [self creatPlistFileWithArr:@[@"adfa", @"dafa"]];
}

-(void)creatPlistFileWithArr:(NSArray *)array{
    //将字典保存到document文件->获取appdocument路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    //要创建的plist文件名 -> 路径
    NSString *filePath = [docPath stringByAppendingPathComponent:@"cityPlist.plist"];
    //将数组写入文件
    [array writeToFile:filePath atomically:YES];
    //读取文件
    NSArray *plistArr = [NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"读取 写入的plist 文件:%@",plistArr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
