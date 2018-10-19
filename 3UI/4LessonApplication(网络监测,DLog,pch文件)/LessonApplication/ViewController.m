//
//  ViewController.m
//  LessonApplication
//
//  Created by apple on 16/6/16.
//  Copyright © 2016年 lanouhn. All rights reserved.
//  ---监测网络状态

#import "ViewController.h"
#import "Reachability.h"

@interface ViewController ()
@property (nonatomic, strong) Reachability *conn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    // Do any additional setup after loading the view.
    
    //监测网络状态
//    [self checkNetworkStatus];
}

- (void)checkNetworkStatus {
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    
    NetworkStatus status = [reach currentReachabilityStatus];
    if (status == NotReachable) {
        NSLog(@"无网络连接,请检查你的网络设置");
    }
    if (status == ReachableViaWiFi) {
        NSLog(@"wifi");
    }
    if (status == ReachableViaWWAN) {
        NSLog(@"移动数据流量");
    }
    /*
     NotReachable = 0,
     ReachableViaWiFi,
     ReachableViaWWAN
    */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
