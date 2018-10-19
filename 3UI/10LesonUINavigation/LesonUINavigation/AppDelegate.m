//
//  AppDelegate.m
//  LesonUINavigation
//
//  Created by lanouhn on 15/11/11.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor yellowColor];
    [self.window makeKeyAndVisible];
    
    //NavigationController(导航视图控制器):管理有层级关系的单视图控制器的多视图控制器
    //1.创建单视图控制器对象
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    //2.创建导航视图控制器对象,并且制定导航控制器的根视图控制器
    UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:firstVC];
    //3.将导航控制器设置为window的根视图控制器
    self.window.rootViewController = navigationVC;
    //4.释放
    [firstVC release];
    [navigationVC release];
    
    //导航控制器工作原理:
    //导航控制器以栈的形式管理视图控制器,当进入下一个界面时,该视图控制器入栈,当返回上一个界面时,该视图控制器出栈,入栈前,视图控制器开辟空间,出栈后,视图控制器空间被系统回收,屏幕永远显示的是导航控制器的栈顶元素.
    
    
    
    
    
    
    
    
    
    
    return YES;
}

- (void)dealloc
{
    self.window = nil;
    [super dealloc];
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
