//
//  AppDelegate.m
//  Animation
//
//  Created by lanouhn on 16/1/21.
//  Copyright © 2016年 lanouhn0. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "RootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
    
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
   
    UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    if (![userDefaults boolForKey:@"firstLaunch"]) {//第一次启动时,BOOL为NO
        //把标示符存储到本地
        [userDefaults setBool:YES forKey:@"firstLaunch"];
        //立即同步
        [userDefaults synchronize];
        
        ViewController *viewVC = [storyBoard instantiateViewControllerWithIdentifier:@"guide"];
        self.window.rootViewController = viewVC;
    }else {
        RootViewController *rootVC = [storyBoard instantiateViewControllerWithIdentifier:@"root"];
        self.window.rootViewController = rootVC;
        [self.window makeKeyAndVisible];
        
        //设置一个图片;
        UIImageView *niceView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        niceView.image = [UIImage imageNamed:@"10013-11122119534217.jpg"];
        //添加到场景
        [self.window addSubview:niceView];
        //放到最顶层;
        [self.window bringSubviewToFront:niceView];
        [UIView transitionWithView:niceView duration:5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            niceView.transform = CGAffineTransformScale(niceView.transform, 1.5, 1.5);
        } completion:^(BOOL finished) {
            [niceView removeFromSuperview];
        }];
    }
     /**/
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

@end
