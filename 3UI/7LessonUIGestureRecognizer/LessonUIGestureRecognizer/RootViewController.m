//
//  RootViewController.m
//  LessonUIGestureRecognizer
//
//  Created by lanouhn on 15/11/6.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "RootViewController.h"
#import "UIColor+RandomColor.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建视图,添加到根视图
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0, 30, [UIScreen mainScreen].bounds.size.width, 500)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    [redView release];


    //轻拍手势
    /*
    {
    //1.创建轻拍手势对象
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    //2.将手势添加到视图上
    [redView addGestureRecognizer:tapGesture];
    //设置轻拍的次数
    tapGesture.numberOfTapsRequired = 1;
    //设置触摸的点数
    tapGesture.numberOfTouchesRequired = 1;
    //3.释放
    [tapGesture release];
    }
    */
    
    //长按手势
    /*
    {
    //1.创建长按手势
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(hanleLongPress:)];
    //2.添加到视图
    [redView addGestureRecognizer:longPress];
    //设置长按手势的时间
    longPress.minimumPressDuration = 1.0;
    //3.释放
    [longPress release];
    }
    */
  
    //轻扫手势
    /*
    {
    //1.创建轻扫手势对象
    UISwipeGestureRecognizer *rightSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGesture:)];
    //设置轻扫方向
    rightSwipeGesture.direction = UISwipeGestureRecognizerDirectionRight;
    //2.添加到视图
    [redView addGestureRecognizer:rightSwipeGesture];
    //3.释放
    [rightSwipeGesture release];
    
    //1.创建轻扫手势对象
    UISwipeGestureRecognizer *leftSwipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeGesture:)];
    //设置清扫方向
    leftSwipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    //2.添加到视图
    [redView addGestureRecognizer:leftSwipeGesture];
    //3.释放
    [leftSwipeGesture release];
    }
    */

    //平移手势
    
    {
    //1.创建平移手势对象
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    //2.添加到视图
    [redView addGestureRecognizer:panGesture];
    //3.释放
    [panGesture release];
    }
    /**/
    
    //捏合手势
    /*
    {
    //1.创建捏合手势
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchGesture:)];
    //2.添加到视图
    [redView addGestureRecognizer:pinchGesture];
    //3.释放
    [pinchGesture release];
    }
    */
    
    //旋转手势
    /*
    {
    //1.创建旋转手势对象
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotationGesture:)];
    //2.添加到视图
    [redView addGestureRecognizer:rotationGesture];
    //3.释放
    [rotationGesture release];
    }
    */
    
    //屏幕边缘平移手势
    /*
    {
    //1.创建屏幕边缘手势对象
    UIScreenEdgePanGestureRecognizer *edgePanGesture = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(hanleEdgePanGesture:)];
    //设置屏幕边界
    edgePanGesture.edges = UIRectEdgeLeft;
    //2.添加到视图
    [redView addGestureRecognizer:edgePanGesture];
    //3.释放
    [edgePanGesture release];
    }
    */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark --- handle Gesture Action

//轻拍
- (void)handleTapGesture:(UITapGestureRecognizer *)tapGesture {
    tapGesture.view.backgroundColor = [UIColor randomColor];
}

//长按
- (void)hanleLongPress:(UILongPressGestureRecognizer *)longPress {
    //当手势识别器识别到长按时,触发改变颜色的操作
    if (longPress.state == UIGestureRecognizerStateBegan) {
        longPress.view.backgroundColor = [UIColor randomColor];

    }
}

//轻扫
- (void)handleSwipeGesture:(UISwipeGestureRecognizer *)swipeGesture {
    if (swipeGesture.direction == UISwipeGestureRecognizerDirectionRight) {
        swipeGesture.view.backgroundColor = [UIColor randomColor];
    }
    if (swipeGesture.direction == UISwipeGestureRecognizerDirectionLeft) {
        swipeGesture.view.superview.backgroundColor = [UIColor randomColor];
    }
    
}

//平移
- (void)handlePanGesture:(UIPanGestureRecognizer *)panGesture {
    //1.获取平移增量
    CGPoint point = [panGesture translationInView:panGesture.view];
//    //2.改变视图位置
//    panGesture.view.center = CGPointMake(panGesture.view.center.x + point.x, panGesture.view.center.y + point.y);
//    //3.将之前的增量清零
//    [panGesture setTranslation:CGPointZero inView:panGesture.view];

    //2.改变视图位置
    //仿射变换
    //CGAffineTransformTranslate 每次变化都以上次位置为基准进行变化
    panGesture.view.transform = CGAffineTransformTranslate(panGesture.view.transform, point.x, point.y);
    //3.将之前的增量清零
    [panGesture setTranslation:CGPointZero inView:panGesture.view];
}

//捏合手势
- (void)handlePinchGesture:(UIPinchGestureRecognizer *)pinchGesture {
    //仿射变换
    pinchGesture.view.transform = CGAffineTransformScale(pinchGesture.view.transform, pinchGesture.scale, pinchGesture.scale);
    //将之前的缩放比例设置为 1
    pinchGesture.scale = 1.0;
}

//旋转手势
- (void)handleRotationGesture:(UIRotationGestureRecognizer *)rotationGesture {
    rotationGesture.view.transform = CGAffineTransformRotate(rotationGesture.view.transform, rotationGesture.rotation);
    rotationGesture.rotation = 0;
}

//屏幕边缘平移手势
- (void)hanleEdgePanGesture:(UIScreenEdgePanGestureRecognizer *)edgePanGesture {
    //获取平移增量
    CGPoint point = [edgePanGesture translationInView:edgePanGesture.view];
    //平移视图
    edgePanGesture.view.transform = CGAffineTransformTranslate(edgePanGesture.view.transform, point.x, 0);
    //将之前增量清零
    [edgePanGesture setTranslation:CGPointZero inView:edgePanGesture.view];
}
@end
