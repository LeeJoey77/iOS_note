//
//  AppDelegate.m
//  LessonUIViewLayout
//
//  Created by lanouhn on 15/10/30.
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
   
    //视图间的层级关系
    //1.子视图肯定会在父视图的前面
    //2.兄弟视图之间如果有重叠的部分,则后添加的视图View2 会覆盖先添加的视图View1,并且如果View2 和View1 的子视图View1.1 有重叠部分,则不管View2 和View1.1谁先添加,View2 一定会覆盖View1.1
    //3.如果要插入或者改变子视图的层级关系,都需要父视图来出面管理
    //4.如果想从父视图移除,自己移除即可
    //5.父视图通过数组来管理子视图的层级关系
//    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 70, 70)];
//    redView.backgroundColor = [UIColor redColor];
//    [self.window addSubview:redView];
//    [redView release];
//    
//    UIView *yellowView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 70, 70)];
//    yellowView.backgroundColor = [UIColor yellowColor];
//    [self.window addSubview:yellowView];
//    [yellowView release];
//    
//    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 70, 70)];
//    blueView.backgroundColor = [UIColor blueColor];
//    [self.window addSubview:blueView];
//    [blueView release];
//    
//    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(120, 200, 70, 70)];
//    greenView.backgroundColor = [UIColor greenColor];
//    [self.window addSubview:greenView];
//    [greenView release];
//    
//    UIView *brownView = [[UIView alloc] initWithFrame:CGRectMake(70, 250, 70, 70)];
//    brownView.backgroundColor = [UIColor brownColor];
//    [self.window addSubview:brownView];
//     [brownView release];
//    
//    UIView *grayView = [[UIView alloc] initWithFrame:CGRectMake(30, 300, 70, 70)];
//    grayView.backgroundColor = [UIColor grayColor];
//    [self.window addSubview:grayView];
//    [grayView release];
//    
//    [self.window exchangeSubviewAtIndex:0 withSubviewAtIndex:4];
//    
//    //将指定的视图移动到最后面
//    [self.window sendSubviewToBack:grayView];
//    //将指定的视图移动到最前面
//    [self.window bringSubviewToFront:grayView];
//    //删除指定视图
//    [grayView removeFromSuperview];

    
//    //创建一个宽高为200的视图,添加到屏幕中心 --- 5s模拟器
//    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(60, 184, 200, 200)];
//    greenView.backgroundColor = [UIColor greenColor];
//    [self.window addSubview:greenView];
//    [greenView release];
//    
//    //创建红色视图,添加到centerView视图上,中心位置
//    //视图的frame是相对于父视图的坐标系的位置
//    //一个视图自身坐标系的坐标原点默认在该视图的左上角
//    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(200, 100, 100, 100)];
//    redView.backgroundColor = [UIColor redColor];
//    [greenView addSubview:redView];
//    [redView release];
//    
//    CGRect bounds = greenView.bounds;
//    //将greenView的坐标原点由(0, 0)改为(10, 10)
//    bounds.origin.x = 100;
//    bounds.origin.y = 100;
//    greenView.bounds = bounds;
//    NSLog(@"%.2f, %.2f, %.2f, %.2f", bounds.origin.x, bounds.origin.y, bounds.size.width, bounds.size.height);
    
    //验证bounds特性
    //验证bounds特性
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(60, 184, 200, 200)];
    NSLog(@"%.2f %.2f %.2f %.2f", view.frame.origin.x, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
    view.bounds = CGRectMake(0, 0, 100 , 100 );
    view.bounds = CGRectMake(50, 50, 100, 100);//调整bounds的size时,中心点不变(中心点为frame确定的中心点),视图进行比例放缩,左上角点的位置随之改变
    view.backgroundColor = [UIColor blueColor];
    [self.window addSubview:view];
    [view release];

    
    //视图的位置是相对于父视图坐标原点的位置.
    //UIView重要属性:
        //1.frame 包含origin(左上角的坐标), size(矩形的大小),frame的origin变化,本视图在其父视图上的位置会变化
        //2.bounds 包含origin, size, bounds变化,本视图在其父视图上中心点位置不变,
            //bounds.origin发生变化,自身坐标系的坐标原点发生变化,子视图位置变化,但本视图中心点位置不变
            //bounds.size变化,本视图以中心点进行等比例放缩
        //3.center 视图相对于父视图坐标系的中心点的坐标位置
            //center变,frame也变;frame变,center也变
 
    //center是相对于其父视图
//    CGPoint point = redView.center;
//    NSLog(@"%.2f %.2f", point.x, point.y);
//
//    CGPoint point1 = greenView.center;
//    NSLog(@"%.2f %.2f", point1.x, point1
//          .y);
    
    //马赛克
//    for (int i = 0; i < 40; i++) {
//        for (int j = 0; j < 71; j++) {
//            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i * 8, j * 8, 8, 8)];
//            view.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1.0];
//            [self.window addSubview:view];
//            [view release];
//            
//        }
//    }
// 
    
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
