//
//  AppDelegate.m
//  LessonThreadPlus
//
//  Created by lanouhn on 15/12/1.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
{
    NSInteger _totalTickets;//总票数
}

@property (nonatomic, retain) NSLock *lock;
@end

@implementation AppDelegate
//程序:安装在移动设备上的每一个应用,都是一个程序
//进程:正在执行的每一个应用程序就是一个进程,进程相当于一个任务
//线程:执行任务的单元片段叫做线程,也就是任务的真正执行者,只不过系统默认把任务交给一个线程来做,这个线程就是主线程,为了提高用户的体验度,我们需要把耗时的操作交给子线程来做.
//线程互斥:当多个线程同时访问同意资源时,一个线程访问时,其他线程应该等待,此时应该加锁

//当前任务,主线程来完成,未完成之前,不执行后面的代码
- (void)test {
    NSLog(@"test:%@, 是否是主线程%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    for (long i = 0; i < 100; i++) {
        NSLog(@"haha");
    }
}
- (void)test1 {
     NSLog(@"test1:%@, 是否是主线程%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);
    for (int i = 0; i < 100; i++) {
        NSLog(@"淇士");
    }
}
- (void)test2 {
    NSLog(@"RUC");
}
- (void)test4 {
    NSLog(@"河科大");
}
- (void)test5 {
    NSLog(@"544");
}

//卖票
- (void)sellTickets:(NSString *)name {
    @autoreleasepool {
        while (YES) {
            //加锁
            [self.lock lock];
            if (_totalTickets > 0) {
                _totalTickets--;
                NSLog(@"%@卖的票, 剩余票数%ld", name, _totalTickets);
            }else {
                NSLog(@"%@发现票卖完了", name);
                break;
            }
            //解锁
            [self.lock unlock];
        }
    }
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //初始化总票数
    _totalTickets = 30;
    //创建锁
    self.lock = [[[NSLock alloc] init] autorelease];
    //窗口一
    [NSThread detachNewThreadSelector:@selector(sellTickets:) toTarget:self withObject:@"tom"];
    //窗口二
    [NSThread detachNewThreadSelector:@selector(sellTickets:) toTarget:self withObject:@"nick"];
    
    
    
    
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    //打印执行该方法的线程,以及是不是主线程
    NSLog(@"当前线程%@, 是否是主线程%d", [NSThread currentThread], [[NSThread currentThread] isMainThread]);//输出:当前线程<NSThread: 0x7f9d89417010>{number = 1, name = main}, 是否是主线程1
    
    //对于耗时的操作,交给子线程来完成,主线程依旧处理用户交互和界面变化
    //1.创建子线程第一种方式,使用线程类NSThread
//    [NSThread detachNewThreadSelector:@selector(test) toTarget:self withObject:nil];
    //2.创建子线程第二种方式,使用线程类,需要手动开启子线程
//    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(test1) object:nil];
//    //开启线程
//    [thread start];
//    //释放
//    [thread release];
    //3.创建子线程的第三种方式,使用NSObject提供的方法
//    [self performSelectorInBackground:@selector(startTimer) withObject:nil];
    //主线程中开启定时器
    //    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(test2) userInfo:nil repeats:YES];
    
    //4.创建子线程的第四种方式,使用任务队列,任务队列会为队列中的每个任务,合理安排子线程来完成
    //任务创建形式一:
//    NSInvocationOperation *op1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(test4) object:nil];
//    NSInvocationOperation *op2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(test5) object:nil];
//    
    //任务创建形式二:
//    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
//        for (int i = 0; i < 5; i++) {
//            NSLog(@"玉漱蒙毅");
//        }
//    }];
//    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
//        for (int i = 0; i < 5; i++) {
//            NSLog(@"刺客聂隐娘");
//        }
//    }];
    
//    //创建任务队列,将任务添加到任务队列
//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [queue addOperation:op1];
//    [queue addOperation:op2];
//    //1.实现线程同步的第一种方式,设置最大并发数
//    [queue setMaxConcurrentOperationCount:1];
//    //2.实现线程同步的第二种方式,添加依赖关系
//    [op2 addDependency:op1];
//    //释放
//    [queue release];
//    [op1 release];
//    [op2 release];
    //线程同步:任务与任务之间有先后关系,后一个任务的执行,必须等待前一个任务的结束
    //线程并发:任务与任务之间没有先后关系,先执行的任务的线程有可能最后一个完成任务
    
    //主线程跳转到子线程执行任务:直接创建子线程,执行对应的任务即可
    //子线程跳转到主线程执行任务:对于界面的刷新操作交由主线程处理,使用 [self performSelectorOnMainThread:@selector(refreshUI:) withObject:image waitUntilDone:YES]方法来操作
    //创建展示图片的imageView
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    imageView.backgroundColor = [UIColor greenColor];
//    imageView.tag = 100;
//    [self.window addSubview:imageView];
    

    [self.window makeKeyAndVisible];
   
    
    return YES;
}

//系统默认在主线程中开启事件循环,不断监测用户的交互事件,但在子线程中没有开启事件循环(runloop)
//子线程开启定时器
- (void)startTimer {
    @autoreleasepool {
        [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(test2) userInfo:nil repeats:YES];
        //在子线程中,开启事件循环,正是有了事件循环,定时器才能够重复的执行任务
        [[NSRunLoop currentRunLoop] run];
    }
}

//下载图片,在子线程中完成
- (void)downloadImage {
    //子线程中没有自动释放池,便利构造器方法创建的对象要有自动释放池才能释放,因此需要在子线程执行的方法中添加自动释放池
    @autoreleasepool {
        //GET请求,同步连接
        NSString *urlStr = [NSString stringWithFormat:@"http://image.zcool.com.cn/56/13/1308200901454.jpg"];
        NSURL *url = [NSURL URLWithString:urlStr];
        NSURLRequest *requeset = [NSURLRequest requestWithURL:url];
        NSData *data = [NSURLConnection sendSynchronousRequest:requeset returningResponse:nil error:nil];
        UIImage *image = [UIImage imageWithData:data];//imageWithData
        
        //如果要刷新界面(UI),修改界面,应该交由主线程处理
        //子线程跳转到主线程中,执行任务
        [self performSelectorOnMainThread:@selector(refreshUI:) withObject:image waitUntilDone:YES];//waitUntilDone是否等到完成,如果多个参数,可以将多个参数放入字典或数组中,withObject时,填写该容器(字典或数组)即可
    }
}
//刷新界面
- (void)refreshUI:(UIImage *)image {
    UIImageView *imageView = (UIImageView *)[self.window viewWithTag:100];
    imageView.image = image;
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
    self.lock = nil;
    self.window = nil;
    [super dealloc];
}
@end
