//
//  AppDelegate.m
//  LessonUIView
//
//  Created by lanouhn on 15/10/30.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //UIWindow 应用程序窗口,用于将内容展示给用户
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor greenColor];
    //让window成为应用程序的主窗口,并且可视
    [self.window makeKeyAndVisible];

    
    //快速创建结构体变量
    //CGRect --- CGRectMake()
    //CGPoint --- CGPointMake()
    //CGSize --- CGSizeMake()
    
    //在屏幕上能够看到的矩形区域都是视图,都是UIView或者UIView的子类
    
    //1.创建UIView对象
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 100, 100)];
    //2.设置UIView的背景颜色
    redView.backgroundColor = [UIColor redColor];
    //3.添加到父视图
    [self.window addSubview:redView];
    //4.释放所有权
    [redView release];
    
    
    //练习:自己创建一个UIView对象,添加到window,并显示
    //创建对象
//    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 150, 150)];
//    //配置属性
//    //(1)配置背景颜色
//    blueView.backgroundColor = [UIColor blueColor];
//    //(2)透明度 0.0 -- 1.0
//    blueView.alpha = 0.5;
//    //(3)隐藏
//    //view.hidden = YES;
//    //(4)tag
//    blueView.tag = 250;//最好设置在100以上
//    //添加到父视图
//    [self.window addSubview:blueView];
//    //释放
//    [blueView release];


    
    //UIView的几个重要的属性:
    //1.backgroundColor 背景颜色
    //2.hidden 显隐性
    //3.alpha 透明度
    //4.tag 标签,唯一标示指定的视图
    //5.superView 获取父视图,一个视图只能有一个父视图
    //6.subViews 获取所有的子视图,使用数组进行管理,子视图的添加是有顺序的,添加的顺序对应上数组中元素的下标
    
    //获取blueView
//    //(1)通过tag值
//    UIView *blueView1 = [self.window viewWithTag:250];
//    blueView1.alpha = 1.0;
    //(2)通过父视图的子视图数组
//    UIView *blueView2 = [self.window.subviews lastObject];
//    UIView *blueView5 = [self.window.subviews objectAtIndex:1];
//    blueView5.alpha = 0.5;
//    //(3)通过redView(兄弟视图)
//    UIView *blueView3 = [redView.superview viewWithTag:250];//redView.superview 相当于 self.window
//    blueView3.alpha = 0.8;
//    UIView *blueView4 = [redView.superview.subviews lastObject];
//    blueView4.alpha = 0.3;
    
    
    return YES;
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

//重写dealloc方法
- (void)dealloc
{
    [_window release];
    [super dealloc];
}














@end
