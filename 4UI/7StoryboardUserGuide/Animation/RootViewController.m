//
//  RootViewController.m
//  Animation
//
//  Created by lanouhn on 16/1/21.
//  Copyright © 2016年 lanouhn0. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"

@interface RootViewController ()
@property (nonatomic, strong) NSTimer *myTimer;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1.timerWithTimeInterval的两个类方法创建出来的对象如果不用 addTimer:forMode 方法手动加入主循环池中，将不会循环执行。并且如果不手动调用fire，则定时器不会启动。
    //初始化一个Invocation对象
//    NSInvocation * invo = [NSInvocation invocationWithMethodSignature:[[self class] instanceMethodSignatureForSelector:@selector(init)]];
//    [invo setTarget:self];
//    [invo setSelector:@selector(myLog)];
//    NSTimer * atimer = [NSTimer timerWithTimeInterval:1 invocation:invo repeats:YES];
//    //加入主循环池中
//    [[NSRunLoop mainRunLoop]addTimer:atimer forMode:NSDefaultRunLoopMode];
//    //开始循环
//    [atimer fire];
    
    //2.scheduledTimerWithTimeInterval这两个方法不需要手动调用fire，会自动执行，并且自动加入主循环池。
//    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:1 invocation:invo repeats:YES];
    
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(aTimer) userInfo:nil repeats:YES];


}


- (void)myLog {
    NSLog(@"myLog");
}

- (void)aTimer {
    NSLog(@"++++++++");
}

//暂停定时器
- (IBAction)handleFutureButton:(UIButton *)sender {
    self.myTimer.fireDate = [NSDate distantFuture];
}

//开启定时器
- (IBAction)handlePastButton:(UIButton *)sender {
        self.myTimer.fireDate = [NSDate distantPast];
}

//移除定时器
- (IBAction)handleInvalidateButton:(UIButton *)sender {
    if (self.myTimer.isValid) {
        [self.myTimer invalidate];
    }
    self.myTimer = nil;
}
/*
 3、initWithFireDate方法需要手动加入循环池，它会在设定的启动时间启动。
 
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti invocation:(NSInvocation *)invocation repeats:(BOOL)yesOrNo;
 + (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti invocation:(NSInvocation *)invocation repeats:(BOOL)yesOrNo;
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;
- (instancetype)initWithFireDate:(NSDate *)date interval:(NSTimeInterval)ti target:(id)t selector:(SEL)s userInfo:(nullable id)ui repeats:(BOOL)rep NS_DESIGNATED_INITIALIZER;
- (void)fire;
//设置定时器的启动时间，常用来管理定时器的启动与停止
@property (copy) NSDate *fireDate;
//定时器的时间间隔
@property (readonly) NSTimeInterval timeInterval;
//误差
@property NSTimeInterval tolerance;
//让定时器失效
- (void)invalidate;
//定时器是否有效
@property (readonly, getter=isValid) BOOL valid;
//参数信息
@property (nullable, readonly, retain) id userInfo;
*/


//跳转下一页
- (IBAction)handleButtonAction:(UIButton *)sender {
    FirstViewController *firstVC = [self.storyboard instantiateViewControllerWithIdentifier:@"first"];
    firstVC.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    //Modal Presentation Styles（弹出风格）
//    UIModalTransitionStyleCoverVertical = 0,
//    UIModalTransitionStyleFlipHorizontal __TVOS_PROHIBITED,
//    UIModalTransitionStyleCrossDissolve,
//    UIModalTransitionStylePartialCurl
    
//    firstVC.modalPresentationStyle = UIModalPresentationPopover;
    //Modal Transition Style（弹出时的动画风格）
//    UIModalPresentationFullScreen = 0,
//    UIModalPresentationPageSheet NS_ENUM_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED,
//    UIModalPresentationFormSheet NS_ENUM_AVAILABLE_IOS(3_2) __TVOS_PROHIBITED,
//    UIModalPresentationCurrentContext NS_ENUM_AVAILABLE_IOS(3_2),
//    UIModalPresentationCustom NS_ENUM_AVAILABLE_IOS(7_0),
//    UIModalPresentationOverFullScreen NS_ENUM_AVAILABLE_IOS(8_0),
//    UIModalPresentationOverCurrentContext NS_ENUM_AVAILABLE_IOS(8_0),
//    UIModalPresentationPopover NS_ENUM_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED,
//    UIModalPresentationNone NS_ENUM_AVAILABLE_IOS(7_0) = -1,
    [self presentViewController:firstVC animated:YES completion:nil];
    
    
    //文档连接:http://blog.csdn.net/why_ios/article/details/7837227
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
