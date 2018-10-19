//
//  AppDelegate.m
//  LessonUITableBarController
//
//  Created by lanouhn on 15/11/18.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "ForthViewController.h"
#import "FifthViewController.h"
#import "SixthViewController.h"
@interface AppDelegate () <UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    //UITabBar 高度49
    //UITabBarController(标签视图控制器),用来管理具有<并列关系>(不是层级关系)的视图控制器,多个界面同时存在
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    firstVC.tabBarItem.title = @"消息";
    firstVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_mainframe"];
    //角标
    firstVC.tabBarItem.badgeValue = @"New";
    //设置选中之后的图片
    firstVC.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_badge"];
    //设置唯一标示 --- tag值
    firstVC.tabBarItem.tag = 100;
    
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    secondVC.tabBarItem.title = @"通讯录";
    secondVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_contacts"];
    secondVC.tabBarItem.badgeValue = @"1";
    secondVC.tabBarItem.tag = 200;
    
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    thirdVC.tabBarItem.title = @"发现";
    thirdVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_discover"];
    
    
    UINavigationController *thirdNVC = [[UINavigationController alloc] initWithRootViewController:thirdVC];
    
    
    ForthViewController *forthVC = [[ForthViewController alloc] init];
    forthVC.tabBarItem.title = @"我的";
    forthVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_me"];

    FifthViewController *fifthVC = [[FifthViewController alloc] init];
    fifthVC.tabBarItem.title = @"下载";
    fifthVC.tabBarItem.image = [UIImage imageNamed:@"qr_toolbar_online_download_hl"];
    SixthViewController *sixthVC = [[SixthViewController alloc] init];
    sixthVC.tabBarItem.title = @"工具";
    sixthVC.tabBarItem.image = [UIImage imageNamed:@"qr_toolbar_light_up_hl"];

    //创建标签视图控制器对象
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    
    //1.配置标签视图控制器所管理的多个视图控制器
    NSArray *controllerArray = @[firstVC, secondVC, thirdNVC, forthVC, fifthVC, sixthVC];
    tabBarVC.viewControllers = controllerArray;
    //2.修改标签栏颜色
    tabBarVC.tabBar.barTintColor = [UIColor whiteColor];
    //3.修改标签栏的渲染颜色
    tabBarVC.tabBar.tintColor = [UIColor redColor];
    //4.设置默认选择的标签
//    tabBarVC.selectedIndex = 1;
    //设置默认选择的视图控制器
//    tabBarVC.selectedViewController = thirdVC;
    //5.设置背景图片
//    tabBarVC.tabBar.backgroundImage = [UIImage imageNamed:@"320x49"];
    //6.设置代理
    tabBarVC.delegate = self;
   
    //将UITabBarController指定为window的根视图控制器
    self.window.rootViewController = tabBarVC;
    //释放
    [firstVC release];
    [secondVC release];
    [thirdVC release];
    [forthVC release];
    [fifthVC release];
    [sixthVC release];
    [tabBarVC release];
    
    
    return YES;
}

- (void)dealloc
{
    self.window = nil;
    [super dealloc];
}

#pragma mark --- UITabBarControllerDelegate协议,以下,原有方法                               
//@optional
//询问标签是否可选中
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    return YES;
}

//@optional
//当标签选中之后触发
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    //当选中第一个标签时,去掉角标
    if (100 == viewController.tabBarItem.tag || 200 == viewController.tabBarItem.tag) {
        viewController.tabBarItem.badgeValue = nil;
    }
}

//@optional
//将要开始自定义标签视图控制器所管理的多个视图控制器时触发(点击more中的Edit按钮,将要开始编辑标签栏时触发)
- (void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray *)viewControllers {
    NSLog(@"开始编辑");
}

//@optional
//完成标签栏编辑时触发
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
    NSLog(@"编辑结束");
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

@end
