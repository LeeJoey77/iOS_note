//
//  AppDelegate.m
//  LessonLabel_TextField
//
//  Created by lanouhn on 15/11/5.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "AppDelegate.h"
#import "LTView.h"

@interface AppDelegate ()//类的延展,用来扩展类的实例变量和方法,只能在本类中访问
@property (nonatomic, retain) UITextField *tempTextField;//存储当前正在编辑的输入框
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //登录界面
    //两个LTView
    //(1)用户名
    LTView *username = [[LTView alloc] initWithFrame:CGRectMake(30, 100, 270, 30)];
    [self.window addSubview:username];
    //设置Label文字
    [username setLabelText:@"用户名:"];
    //设置textField占位符
    [username setPlaceHolder:@"请输入用户名"];
    //设置textField的代理
    [username setDelegate:self];
    [username release];
    //(2)密码
    LTView *passWord = [[LTView alloc] initWithFrame:CGRectMake(30, 180, 270, 30)];
    [self.window addSubview:passWord];
    //设置Label文字
    [passWord setLabelText:@"密码:"];
    //设置textField占位符
    [passWord setPlaceHolder:@"请输入密码"];
    //设置textField的代理
    [passWord setDelegate:self];//self是AppDelegate
    //设置密码类型
    [passWord setSecureTextType:YES];
    [passWord release];
    
    
    //    //三个Button
    //    //(1)登录
    //    UIButton *logInButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    //(2)找回密码
    //    //(3)注册
    
    
    
    
    
    return YES;
}

#pragma mark --- UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *) textField {
    [textField resignFirstResponder];
    NSLog(@"%s %d", __FUNCTION__, __LINE__);
    
    return YES;
}

//当对输入框进行编辑时触发,询问输入框能否被编辑,返回NO的话输入框不能被编辑
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    self.tempTextField = textField;//存储当前正在编辑的输入框
    NSLog(@"%s %d", __FUNCTION__, __LINE__);
    
    return YES;
}

#pragma mark --- 点击空白回收键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    //找到要回收的输入框
    //输入框键盘回收
    [self.tempTextField resignFirstResponder];
    NSLog(@"%s %d", __FUNCTION__, __LINE__);
    
}
- (void)dealloc
{
    [_window release];
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
