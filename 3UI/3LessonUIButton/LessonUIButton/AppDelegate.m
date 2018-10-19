//
//  AppDelegate.m
//  LessonUIButton
//
//  Created by lanouhn on 15/11/2.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    UIView *containerView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    containerView.backgroundColor = [UIColor whiteColor];
    [self.window addSubview:containerView];
    [containerView release];
    
    //UIButton:是iOS中用来响应用户点击事件的控件,是UIControl的子类
    //UIButton使用步骤:
        //1.创建控件
        //2.设置属性
        //3.添加到父视图
    
    //1.创建对象
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //UIButtonTypeSystem该属性适用于设置文字时
    //UIButtonTypeCustom该属性适用于设置图片时
    //2.设置属性
    //(1)设置背景颜色
//    button.backgroundColor = [UIColor greenColor];
    //(2)设置frame
    button.frame = CGRectMake(10, 100, 300, 50);
    //(3)设置button上显示的文字
//    [button setTitle:@"你点我呀!" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //(4)设置button的图片
    [button setImage:[UIImage imageNamed:@"login_btn_normal"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"login_btn_press"] forState:UIControlStateHighlighted];
    
    //(5)添加button的响应事件
    //target:指定事件的响应对象
    //action:指定响应对象要去调用的方法,处理button的点击事件
    //controlEvents:事件的触发时机
    //注意:handleButtonAction:方法的参数可有可无,如果有只有一个,因为参数为调用addTarget:action:forControlEvents:方法的对象
    [button addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    //3.添加到父视图
    [containerView addSubview:button];
    

    return YES;
}

- (void)handleButtonAction:(UIButton *)sender {
    NSLog(@"成功!");
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)dealloc
{
    [_window release];
    [super dealloc];
}
@end
