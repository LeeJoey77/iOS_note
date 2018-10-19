//
//  RootViewController.m
//  AFNetworking_3
//
//  Created by lanouhn on 15/12/11.
//  Copyright (c) 2015年 李杨. All rights reserved.
//

#import "RootViewController.h"
#import "AFNetworking.h"
#import "NetManager.h" //引入网络封装层

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [btn setTitle:@"GET网络请求" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 50)];
    [btn2 setTitle:@"POST网络请求" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor blackColor];
    [btn2 addTarget:self action:@selector(btn2Action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];

}

#pragma mark --- 利用AFN进行GET请求
- (void)btnAction:(UIButton *)sender {

    //创建一个manager,manager是一个单例
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];  //创建的manager是一个单例
     
    //设置解析所支持的格式(如果设置请求所支持的格式的话,只需把responseSerializer换成requestSerializer就可以)
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    //设置返回格式
    //(1)二进制格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //(2)Json格式  (这是系统默认的)
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //参数1: URL;  参数2: 参数(get一般为nil); 参数3: 请求成功后的block 参数4: 请求失败的block
    [manager GET:@"http://mobileapp.roadqu.com/api/mobile/qunawan/tour/featuredthemeslist?token=5664fb54a9504&a_t=1449754266780&sign=c3ec5e14e564b35382697d3264c9b7af92c1cfca" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
    
    
    //Block封装的AFN - GET请求
//    NetManager *netmanager = [NetManager shareInstance]; //直接调用方法.节约资源
    [NetManager getRequestWithURL:@"http://www.51zhjt.com:8080/VSCS-WIC/service/getUserSignOff.htm?sessionKey=cd6420fba2d9bb9a1f7a3f99b88aaa9c" withContentTypes:nil withSuccessResult:^(id successResult) {  //withContentTypes 如果是text/html,直接把nil换成[NSSet setWithObject:@"text/html"]就可以了
        //请求成功
        NSLog(@"%@", successResult);
    } withErrorResult:^(id errorResult) {
        //请求失败
        NSLog(@"%@", errorResult);
    }];
}


#pragma mark --- 利用AFN进行POST请求
- (void)btn2Action:(UIButton *)sender {
    /*
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    //参数2: 一般是字典类型
    [manager POST:@"http://zzx.zhengzhoubus.com/WifiBusInterface/transfer/station!getStationLike.action" parameters:@{@"stationName":@"七里河"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
  */
    
    //Block封装的AFN - POST请求
//    NetManager *netmanager = [NetManager shareInstance]; //直接调用方法.节约资源
    [NetManager POSTRequestWithURL:@"http://zzx.zhengzhoubus.com/WifiBusInterface/transfer/station!getStationLike.action" withParameters:@{@"stationName":@"七里河"} withContentTypes:nil withSuccessResult:^(id successResult) {
        //请求成功
        NSLog(@"%@", successResult);
    } withErrorResult:^(id errorResult) {
        //请求失败
        NSLog(@"%@", errorResult);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
