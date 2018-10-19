//
//  main.m
//  LessonApplication
//
//  Created by lanouhn on 15/11/3.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        //UIApplicationMain()函数的任务:
            //1.创建应用程序对象 --- UIApplication 类型的对象
            //2.创建应用程序代理对象,指定应用程序代理,应用程序代理用来监测应用程序的执行状态
            //3.创建事件循环(runloop, 死循环),监测用户对屏幕的操作,一旦发现用户操作程序,应用程序必须立即作出响应.由于用户操作应用程序的时间未知,因此需要一直进行监听,直到应用程序退出
        
        /*
         应用程序启动之后，先创建Application，再创建它的代理，之后创建UIwindow。UIWindow继承自UIview。
         
         UIWindow是一种特殊的UIView，通常在一个app中只会有一个UIWindow
         
         iOS程序启动完毕后，创建的第一个视图控件就是UIWindow，接着创建控制器的view，最后将控制器的view添加到UIWindow上，于是控制器的view就显示在屏幕上了
         
         一个iOS程序之所以能显示到屏幕上，完全是因为它有UIWindow。也就说，没有UIWindow，就看不见任何UI界面
         
         补充：UIWindow是创建的第一个视图控件（创建的第一个对象是UIapplication）
         */
        
        /*
        argc和argv：来自于main()接受的两个参数；
        
        第三个参数：主要类(principal class)，必须是UIApplication或其子类的名字，它代表着当前iPhone程序本身，这个程序会去读info.plist文件获取配置信息，其中包括主nib文件的值，一般为MainWindow(.xib)；如果该参数为nil，则默认为@"UIApplication"；
        
        第四个参数：代理类(delegate class)，MainWindow.xib文件中遵循UIApplicationDelegate的类的类名，因为UIApplication定义了一个delegte变量，这个变量应该遵循UIApplicationDelegate，负责控制程序的运行，如果主nib文件没有这个类，你应该自定义一个这样的类，并将第四个参数改为这个类的类名，否则这个程序不知道如何进行运作，因为前三个参数代表应用程序本身，它除了把应用的事件循环启动起来，并读取info.plist里的配置信息，不做其它任何事情。如果该参数为nil，则程序假设程序的代理来自Main nib文件。
         */
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
