//
//  AppDelegate.m
//  LessonUILabel
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
    
    //墙上贴张纸
    //[UIScreen mainScreen]获取到屏幕对象,然后取bounds,获取到屏幕大小
    UIView *containerView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    containerView.backgroundColor = [UIColor whiteColor];
    [self.window addSubview:containerView];
    [containerView release];
    
    //UIImageView 和UILabel 的用户交互是关闭的
    
    //UILabel (标签):UIView的子类,在UIView的基础上扩充了显示文本的功能
    //UILabel的使用步骤:
        //1.创建控件
        //2.配置属性
        //3.添加到父视图(为了能够看到该视图)
        //4.释放所有权
    //1.创建控件
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 234, 300, 100)];
    //2.配置属性
    //(1)设置背景颜色
    label.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1.0];
    //(2)设置显示的文字
    label.text = @"iHaust henanluoyang luolongquiHaust henanluoyang luolongquiHaust henanluoyang luolongquiHaust henanluoyang luolongqu";
//    label.adjustsFontSizeToFitWidth = YES;
    //(3)设置文本颜色
    label.textColor = [UIColor greenColor];
    //(4)设置字体样式及字体大小
    label.font = [UIFont fontWithName:@"Avenir-HeavyOblique" size:29];
    //使用系统默认字体样式,只调整到字体大小(默认为 17)
    //label.font = [UIFont systemFontOfSize:29];
    
    
    //(5)设置label显示的文字的行数
    label.numberOfLines = 0;//设置为 0 会根据label高度,显示尽可能多的行数
    //(6)行的截取方式
    label.lineBreakMode = NSLineBreakByCharWrapping;
    //(7)设置label的阴影的颜色
    label.shadowColor = [UIColor blueColor];
    //(8)设置阴影偏移量(让文字有立体感)
    label.shadowOffset = CGSizeMake(3, 3);
    //(9)设置文本的对齐方式
    label.textAlignment = NSTextAlignmentCenter;//居中
    
    //以上功能中,那个功能才是最重要的功能?
    //答:显示文字才是最重要的!
    
    //3.添加到父视图
    [containerView addSubview:label];
    //4.释放
    [label release];
    
    
    
    
    
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

- (void)dealloc
{
    [_window release];
    [super dealloc];
}


@end
