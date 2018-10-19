//
//  AppDelegate.m
//  LessonDataPersistence
//
//  Created by lanouhn on 15/11/20.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
//沙盒中文件夹:
//1.Documetens:存放长久保存的数据,苹果建议将程序创建产生的文件以及应用浏览产生的文件数据保存在该目录下，iTunes备份和恢复的时候会包括此目录
//2.Library:
//Caches:存放缓存文件,比如:视频,音频,小说,图片等,用于应用升级或者应用关闭后的数据保存，不会被itunes同步，所以为了减少同步的时间，可以考虑将一些比较大的文件而又不需要备份的文件放到这个目录下。
//Preferences:存放偏好设置,比如应用程序是否是第一次启动,保存用户名和密码等
//3.tmp:存储临时数据,比如下载的zip包,解压之后直接删除,提供一个即时创建临时文件的地方，但不需要持久化，在应用关闭后，该目录下的数据将删除，也可能系统在程序不运行的时候清除。

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
/*
    //数据持久化方式一:通过系统单例NSUserDefaults 直接操作Preferences文件夹

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:YES forKey:@"firstLaunch"];
    [userDefaults setObject:@"apple" forKey:@"userName"];
    [userDefaults setObject:@"lanou" forKey:@"password"];
    //立即同步
    [userDefaults synchronize];

    //1.沙盒文件路径
    NSString *homePath = NSHomeDirectory();
    NSLog(@"%@----homePath", homePath);
    
    //2.应用程序包路径
//bundle是一个目录,其中包含了程序会使用到的资源.这些资源包含了如图像,声音,编译好的代码,storyboard, plist文件,nib文件等
//    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
//    NSLog(@"%@----bundlePath", bundlePath);
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSString *imagePath = [mainBundle pathForResource:@"icon" ofType:@"png"];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:imagePath];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.window addSubview:imageView];
    NSLog(@"%@", imagePath);
*/
    
    
    //需求:如果账号和密码都不为空提示登录成功, 否则提示注册(账号,密码大写和上面区别)
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if (![userDefaults objectForKey:@"ACCOUNT"] || ![userDefaults objectForKey:@"PASSWORD"]) {
        //第一次运行时,沙盒文件为空,需要注册
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"注册" message:@"请输入账号和密码" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        alertView.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
        
        [alertView show];
        [alertView release];
        NSString *homePath = NSHomeDirectory();
        NSLog(@"%@", homePath);
    }else {
        //第二次运行时,沙盒文件中有账号和密码,登录成功
        UIAlertView *alertView1 = [[UIAlertView alloc] initWithTitle:@"登陆成功" message:@"" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alertView1 show];
        [alertView1 release];
    }
    //1.沙盒文件路径
    NSString *homePath = NSHomeDirectory();
    NSLog(@"%@", homePath);
    return YES;
}

#pragma mark --- UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 1:
        {
            NSString *account = [alertView textFieldAtIndex:0].text;
            NSString *password = [alertView textFieldAtIndex:1].text;
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            //将账号和密码存储到本地
            [userDefaults setObject:account forKey:@"ACCOUNT"];
            [userDefaults setObject:password forKey:@"PASSWORD"];
            //立即同步
            [userDefaults synchronize];
            break;
        }
        default:
            break;
    }
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
    self.window = nil;
    [super dealloc];
}
@end
