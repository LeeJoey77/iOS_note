//
//  AppDelegate.m
//  LessonApplication
//
//  Created by lanouhn on 15/11/3.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "Reachability.h"

#define IS_IOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)
@interface AppDelegate ()
@property (nonatomic, strong) Reachability *hostReach;
@end

@implementation AppDelegate

//当应用程序加载时触发,在该方法中创建window窗口对象,让window成为应用程序主窗口并且可视
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];//不设置background为黑色
    [self.window makeKeyAndVisible];//不设置屏幕为黑色

    ViewController *vc = [[ViewController alloc] init];
    self.window.rootViewController = vc;
    
    //验证机制:验证一个方法的触发时机
    //__FUNCTION__ 打印当前方法的方法名
    //__LINE__ 打印当前方法所在行
    NSLog(@"%s %d", __FUNCTION__, __LINE__);
 
    //UIApplication的应用级操作
    [self applicationAction];
    
    
    //开启网络状况的监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    self.hostReach = [Reachability reachabilityForInternetConnection];
    //开始监听，会启动一个run loop
    [self.hostReach startNotifier];
    
    return YES;
}

- (void)dealloc
{   [_window release];
    [super dealloc];
    [self.hostReach stopNotifier];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)reachabilityChanged:(NSNotification *)note
{
    Reachability *currReach = [note object];
    NSParameterAssert([currReach isKindOfClass:[Reachability class]]);
    
    //对连接改变做出响应处理动作
    NetworkStatus status = [currReach currentReachabilityStatus];
    if(status == NotReachable)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"网络连接异常" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        [alert release];
        return;
    }
    if (status == ReachableViaWiFi || status == ReachableViaWWAN) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"网络连接信息" message:@"网络连接正常" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
}

- (void)applicationAction {
    UIApplication *application = [UIApplication sharedApplication];
    //1.设置icon上的数字图标
    if (IS_IOS8) {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        [application registerForRemoteNotifications];
    }
    application.applicationIconBadgeNumber = 7;
    //2.设置摇动手势的时候，是否支持redo,undo操作
    /**/
    //摇动手势，是否支持redo undo操作。
    //3.0以后引进，缺省YES
    application.applicationSupportsShakeToEdit =YES;
    
    //3.判断程序运行状态
    
    //判断程序运行状态，在2.0以后引入
    
    if(application.applicationState ==UIApplicationStateInactive){
        NSLog(@"程序在运行状态");
    }
    
    //4.阻止屏幕变暗进入休眠状态
    //阻止屏幕变暗，慎重使用,缺省为no 2.0
    application.idleTimerDisabled =YES;
    
    //慎重使用本功能，因为非常耗电。
    
    //5.显示联网状态
    
    //显示联网标记 2.0
    application.networkActivityIndicatorVisible =YES;
    
    //6.在map上显示一个地址
    
    NSString* addressText =@"1 Infinite Loop, Cupertino, CA 95014";
    // URL encode the spaces
    addressText =  [addressText stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    NSString* urlText = [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@", addressText];
    
    [application openURL:[NSURL URLWithString:urlText]];
    
    //7.发送电子邮件
    
    NSString *recipients =@"mailto:first@example.com?cc=second@example.com,third@example.com&subject=Hello from California!";
    NSString *body =@"&body=It is raining in sunny California!";
    
    NSString *email = [NSString stringWithFormat:@"%@%@", recipients, body];
    email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    [application openURL:[NSURL URLWithString:email]];
    
    //8.打电话到一个号码
    
    // Call Google 411
    [application openURL:[NSURL URLWithString:@"tel://8004664411"]];
    
    //9.发送短信
    // Text to Google SMS
    [application openURL:[NSURL URLWithString:@"sms://466453"]];
    
    //10.打开一个网址
    
    // Lanuch any iPhone developers fav site
    [application openURL:[NSURL URLWithString:@"http://blog.csdn.net/lvxiangan/article/details/19076911"]];
}

//当有电话进入时,会触发的方法
//applicationWillResignActive;
//当电话挂断时,会触发的方法
//applicationDidBecomeActive;


//当应用程序将要取消活跃状态时触发
//使用该方法暂停掉正在执行的任务,并让定时器无效,暂停游戏等
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    NSLog(@"%s %d", __FUNCTION__, __LINE__);

}

//当应用程序进入后台时触发
//释放共享资源,保存用户数据,让timer无效,当应用程序退出时,该方法会被applicationWillTerminate:方法替代
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"%s %d", __FUNCTION__, __LINE__);
}

//当应用程序将要进入前台时触发
//继续进入后台时被暂停的任务
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"%s %d", __FUNCTION__, __LINE__);
}

//当应用程序成为活跃状态时触发
//重新启动当应用程序进入不活跃状态(休眠)时暂停的任务,如果之前应用程序在后台,此时可以在该方法中进行刷新界面的操作
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"%s %d", __FUNCTION__, __LINE__);
}

//当应用程序将要结束时触发
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"%s %d", __FUNCTION__, __LINE__);

}

@end
