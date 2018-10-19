//
//  RootViewController.m
//  LessonUIViewController
//
//  Created by lanouhn on 15/11/4.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

//视图控制器不是视图,是用来管理视图的,因此在屏幕上看不到视图控制器只不过自身携带了一个视图(根视图),而这个视图能够被看到

#import "RootViewController.h"
#import "LogInView.h"
//视图控制器的延展
@interface RootViewController ()

@end

//视图控制器类的实现部分
@implementation RootViewController

//loadView用来加载视图控制器的根视图
//当访问的视图控制器的根视图时,一旦发现根视图为空,立即调用loadView方法来加载根视图
//如果要自定义视图控制器的根视图,只需要重写loadView方法,将自己创建的视图指定为根视图即可

//- (void)loadView {//只有在自定义时才需要重写loadView
//    [super loadView];//不知道方法功能时,调用父类方法
//    self.view.backgroundColor = [UIColor redColor];
//    NSLog(@"%s %d", __FUNCTION__, __LINE__);
//    
//    //自定义
//    LogInView *logInView = [[[LogInView alloc] initWithFrame:[[UIScreen mainScreen] bounds] ] autorelease];
//    //指定自定义的logInView为当前视图控制器的根视图
//    self.view = logInView;//将创建的logInView,设置为根视图
//    NSLog(@"%s %d", __FUNCTION__, __LINE__);
//
//    
//}

//当loadView方法执行完毕后,立即执行viewDidLoad方法
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    self.view.alpha = 0.5;
    NSLog(@"%s %d", __FUNCTION__, __LINE__);

}

//当视图控制器收到内存警告时触发
//释放掉之前开辟但是未使用的空间,以及可重建的对象
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    //当视图控制器的根视图成功创建,并且不在当前window上显示时,才能够移除
    if ([self isViewLoaded] && self.view.window) {
        [self.view release];//移除根视图
    }
}

#pragma mark --- 监测和处理屏幕旋转
//1.设置屏幕支持旋转方向
- (NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;//支持四个方向旋转
}

//2.当开始旋转时触发的方法
//经常用来暂停音频视频播放,以及关闭用户交互
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willRotateToInterfaceOrientation:toInterfaceOrientation duration:duration];
    //当我们不知道从父类继承而来的方法内部怎么实现的时候,应该首先调用父类对该方法的实现
    NSLog(@"millionaire");
}

//3.当旋转结束时触发
//经常用于继续音频,视频的播放,以及打开用户交互
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    [super didRotateFromInterfaceOrientation:fromInterfaceOrientation];
    NSLog(@"my money");
}

//4.当将要开始旋转做动画时触发,经常用来在旋转时添加自定义动画
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [super willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
    NSLog(@"He is her lobster!");
}

//5.
//当旋转时,视图控制器触发的方法,用于重新布局视图控制器根视图(View)上的子视图
- (void)viewWillLayoutSubviews {
    NSLog(@"");
}

@end
