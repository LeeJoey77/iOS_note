//
//  RootViewController.m
//  LessonCartoon
//
//  Created by lanouhn on 15/12/2.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "RootViewController.h"
#import "UITextField+Shake.h"
@interface RootViewController ()

//用storyboard创建的属性指向的地址不为空, 手动创建的属性指向空地址
@property (nonatomic, retain) UITextField *textField;
@property (nonatomic, retain) UIButton *button1;
@property (nonatomic, retain) UIButton *button2;
@property (nonatomic, retain) UIImageView *redView;
@property (nonatomic, retain) UIImageView *ballon;
@property (nonatomic, retain) UIImageView *cloud;
@property (nonatomic, retain) UIView *yellowView;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupViews];
}

- (void)setupViews {
    UIImageView *imageViewBG = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imageViewBG.image = [UIImage imageNamed:@"bg-sunny"];
    imageViewBG.userInteractionEnabled = YES;
    [self.view addSubview:imageViewBG];
    [imageViewBG release];
    
    self.redView = [[UIImageView alloc] initWithFrame:CGRectMake(105, 300, 170, 170)];
    _redView.backgroundColor = [UIColor redColor];
    _redView.userInteractionEnabled = YES;
    [imageViewBG addSubview:_redView];
    [_redView release];
    
    self.yellowView = [[UIView alloc] initWithFrame:CGRectMake(105, 300, 170, 170)];
    self.yellowView.tag = 100;
    _yellowView.backgroundColor = [UIColor yellowColor];
    [_yellowView release];
   
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 335, 30)];
    self.textField.backgroundColor = [UIColor whiteColor];
    [imageViewBG addSubview:_textField];
    [_textField release];
    
    self.button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    _button1.frame = CGRectMake(20, 150, 335, 30);
    _button1.backgroundColor = [UIColor greenColor];
    [_button1 setTitle:@"弹簧效果" forState:UIControlStateNormal];
    [_button1 addTarget:self action:@selector(handleButton1Action:) forControlEvents:UIControlEventTouchUpInside];
    [imageViewBG addSubview:_button1];
    [_button1 release];
    
    self.ballon = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
    _ballon.image = [UIImage imageNamed:@"balloon"];
    _ballon.userInteractionEnabled = YES;
    [self.view addSubview:_ballon];
    [_ballon release];
    
    self.cloud = [[UIImageView alloc] initWithFrame:CGRectMake(-120, 450, 120, 90)];
    _cloud.image = [UIImage imageNamed:@"bg-sunny-cloud-1"];
    _cloud.userInteractionEnabled = YES;
    [self.view addSubview:_cloud];
    [_cloud release];
    
    self.button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    _button2.frame = CGRectMake(20, 550, 335, 35);
    _button2.backgroundColor = [UIColor orangeColor];
    _button2.alpha = 0.8;
    [_button2 setTitle:@"开始动画" forState:UIControlStateNormal];
    [_button2 addTarget:self action:@selector(handleButton2Action:)
      forControlEvents:UIControlEventTouchUpInside];
    [imageViewBG addSubview:_button2];
    [_button2 release];
}

- (void)handleButton1Action:(UIButton *)sender {
    
}

- (void)handleButton2Action:(UIButton *)sender {
    [self handlePropertyAnimation];//属性动画
    
    [self handlePropertyAnimationBlock];//iOS4之后Block形式
    
    [self handleTransition];//UIView 过渡动画
    
    [self handleUIViewAndCALayer];//UIView和CALayer
    
    [self handleBasicAnimation];//基本属性动画
    
    [self handleKeyFrameAnimation];//关键帧动画
    
    [self handleCATransition];//CA过渡动画
    
    [self handleGroupAnimation];//分组动画
}

#pragma mark --- UIView 动画
//UIView属性动画,更改属性值产生的动画效果
//能够做动画的属性:frame center bounds alpha transform backgroundColor
- (void)handlePropertyAnimation {
    //iOS4之前如果想做动画,必须放在开始和提交中间才行
    //开始动画
    [UIView beginAnimations:nil context:nil];
    
    //1.设置动画持续时间 --- 以秒为单位(默认0.2)
    [UIView setAnimationDuration:4];
    //2.设置动画代理 --- 但是不需要服从协议
    [UIView setAnimationDelegate:self];
    //3.设置动画结束后会触发的方法
    [UIView setAnimationDidStopSelector:@selector(handleDidStopAnimation)];
    //4.设置动画延迟的时间 --- 以秒为单位(默认为0)
    //5.设置动画从当前状态发生变化
    [UIView setAnimationBeginsFromCurrentState:NO];
    //6.设置动画是否反转
    [UIView setAnimationRepeatAutoreverses:YES];
    //7.设置动画重复次数
    [UIView setAnimationRepeatCount:1];
    //8.设置动画变化的曲线
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    //对属性更改是有效值,最终会对视图做出修改
    
    
    //center --- 视图位置
    CGPoint center = self.redView.center;
    center.y += 150;
    self.redView.center = center;
    //alpha --- 透明度
    self.redView.alpha = 0.2;
    //transform --- 旋转缩放
    //旋转
    self.redView.transform = CGAffineTransformRotate(self.redView.transform, 1.5);
    //缩放
    self.redView.transform = CGAffineTransformScale(self.redView.transform, 0.5, 0.5);
    
    //提交动画
    [UIView commitAnimations];
}

//动画结束之后触发 --- 让视图恢复到最初状态
- (void)handleDidStopAnimation {
    //center
    self.redView.center = self.view.center;
    //alpha
    self.redView.alpha = 1.0;
    //transform
    self.redView.transform = CGAffineTransformIdentity;
}

//iOS4之后基于Block的动画效果 --- 推荐使用
- (void)handlePropertyAnimationBlock {
    /*
    //1.最简单的Block动画,Duration时长单位是秒
    [UIView animateWithDuration:4 animations:^{
        //center --- 视图位置
        CGPoint center = self.redView.center;
        center.y += 150;
        self.redView.center = center;
        //alpha --- 透明度
        self.redView.alpha = 0.2;
        //transform --- 旋转缩放
        self.redView.transform = CGAffineTransformRotate(self.redView.transform, 1.58);
        self.redView.transform = CGAffineTransformScale(self.redView.transform, 0.5, 0.5);
    }];
    */
    
    /*
    //2.Block形式升级版 --- 可以检测动画结束
    [UIView animateWithDuration:4 animations:^{
        //center --- 视图位置
        CGPoint center = self.redView.center;
        center.y += 150;
        self.redView.center = center;
        //alpha --- 透明度
        self.redView.alpha = 0.2;
        //transform --- 旋转缩放
        self.redView.transform = CGAffineTransformRotate(self.redView.transform, 1.58);
            self.redView.transform = CGAffineTransformScale(self.redView.transform, 0.5, 0.5);

    } completion:^(BOOL finished) {
        [self handleDidStopAnimation];
    }];
    */
    
    
    //3.Block形式加强版 --- 不仅可以捕获动画结束时机,还可以配置多个参数
    [UIView animateWithDuration:4 delay:0 options:UIViewAnimationOptionAutoreverse animations:^{
        //center --- 视图位置
        CGPoint center = self.redView.center;
        center.y += 150;
        self.redView.center = center;
        //alpha --- 透明度
        self.redView.alpha = 0.2;
        //transform --- 旋转缩放
        self.redView.transform = CGAffineTransformRotate(self.redView.transform, 1.58);
        self.redView.transform = CGAffineTransformScale(self.redView.transform, 0.5, 0.5);

    } completion:^(BOOL finished) {
        [self handleDidStopAnimation];
    }];
    
    
    /*
    //4.弹簧效果
    //参数:(1)持续时间 (2)延迟时间 (3)弹簧强度0.0 -- 1.0 (4)开始变化速度 (5)动画效果参数 (6)动画代码 (7)结束
    [UIView animateWithDuration:3 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:7.7 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        //更改button1属性
        //center
        CGPoint center = self.button1.center;
        center.y += 50;
        self.button1.center = center;
        //transform --- 缩放
        self.button1.transform = CGAffineTransformScale(self.button1.transform, 1.2, 1.2);
    } completion:^(BOOL finished) {
        [self handleDidStopAnimation];
    }];
     */
}

//过度动画 --- 界面间过渡
- (void)handleTransition {
    //1.只产生动画效果,界面没有切换
    [UIView transitionWithView:self.redView duration:3 options:UIViewAnimationOptionTransitionCurlUp animations:^{
           self.redView.transform = CGAffineTransformRotate(self.redView.transform, M_PI_2);//M_PI_2 旋转90度, M_PI_4 旋转45度
    } completion:nil];
    /*
    //2.从一个视图切换到另一个视图
    [UIView transitionFromView:self.redView toView:self.yellowView duration:2 options:UIViewAnimationOptionTransitionCurlUp completion:^(BOOL finished) {
        //改变指针指向,先retain防止被释放
        UIView *tempView = [self.redView retain];
        self.redView = self.yellowView;
        self.yellowView = tempView;
        //retain一次,要释放一次
        [tempView release];
    }];
     */
}

#pragma mark --- UIView 与 CALayer
//UIView与CALayer的区别
//UIView 其实是对CALayer层的简单封装,真正来绘制显示内容的还是CALayer,每一个视图对象都会有一个layer属性可以访问到自己的layer层,UIView只是简单封装了常用属性,不常用属性还是得设置CALayer
- (void)handleUIViewAndCALayer {
    //1.设置视图边框宽度
    self.redView.layer.borderWidth = 7;
    //2.设置视图边框的颜色
    self.redView.layer.borderColor = [UIColor blueColor].CGColor;
    //3.设置视图边框的圆角
    self.redView.layer.cornerRadius = 0;
    //4.裁剪掉超出圆角的部分
    self.redView.layer.masksToBounds = YES;
    
    //5.设置视图的锚点 (默认为中心点)
    //锚点:左上角 --- (0, 0)          右下角(1, 1)
    self.redView.layer.anchorPoint = CGPointMake(0, 0);
    //6.设置旋转的基准点 (默认为中心点)
    //更改layer层的基准点 --- 在那个位置旋转
    self.redView.layer.position = CGPointMake(105, 300);
    self.redView.transform = CGAffineTransformRotate(self.redView.transform, M_PI_2);
    //只有锚点和基准点重合时,才会绕视图的某一点旋转
}

#pragma mark --- CALayer
//CA属性动画 --- 基于属性动画
- (void)handleBasicAnimation {

    //keyPath:(NSSting *)   要做动画的属性名
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"opacity"];//opacity 不透明度
    //变化的开始值
    basic.fromValue = @(1.0);
    //变化的结束值
    basic.toValue = @(0.2);
    //设置持续时间
    basic.duration = 2;
    //添加到视图的layer层
    [self.redView.layer addAnimation:basic forKey:nil];
/*
    
// *********CA动画修改属性值,最终不会作用到视图上*********.

    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"position.x"];
    //变化的开始值
    basic.fromValue = @(self.cloud.center.x);
    //变化的结束值
    basic.toValue = @([UIScreen mainScreen].bounds.size.width + CGRectGetWidth(self.cloud.frame) / 2);
    //设置重复次数
    basic.repeatCount = 10000;
    //持续时间
    basic.duration = 10;
    //添加到视图的layer层
    [self.cloud.layer addAnimation:basic forKey:nil];
*/
    
}

//CA属性动画 --- 关键帧动画
- (void)handleKeyFrameAnimation {
/*
    CAKeyframeAnimation *keyFrame = [CAKeyframeAnimation animationWithKeyPath:@"position"];

    CGPoint point1 = self.cloud.center;
    CGPoint point2 = CGPointMake(200, 40);
    CGPoint point3 = CGPointMake(320, self.cloud.center.y);
    
    //将点结构体转化为NSValue对象
    NSValue *value1 = [NSValue valueWithCGPoint:point1];
    NSValue *value2 = [NSValue valueWithCGPoint:point2];
    NSValue *value3 = [NSValue valueWithCGPoint:point3];
    
    //将NSValue对象添加到values数组中
    keyFrame.values = @[value1, value2, value3, value1];
    //设置持续时间
    keyFrame.duration = 10;
    //次数
    keyFrame.repeatCount = 10;
    //添加到视图的layer层
    [self.cloud.layer addAnimation:keyFrame forKey:nil];
*/
    //输入框震动
    [self.textField shake];
}

//CA过渡动画
- (void)handleCATransition {
    CATransition *transition = [CATransition animation];
    //配置过渡动画类型
    transition.type = @"cameraIrisHollowClose";
    //配置过渡动画方向
//    transition.subtype = kCATransitionFromLeft;
    //添加
    [self.view.layer addAnimation:transition forKey:nil];
    
}

//CA分组动画
- (void)handleGroupAnimation {
    //1.关键帧动画 --- 沿圆形轨迹移动
    CAKeyframeAnimation *keyframe = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //绘制半圆路径
    CGFloat rad = [UIScreen mainScreen].bounds.size.width - self.ballon.bounds.size.width / 2;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(0, rad + 20) radius:rad - 50 startAngle:-M_PI_2 endAngle:M_PI_2 clockwise:YES];
    //关键帧动画上圆形轨迹
    keyframe.path = path.CGPath;//让贝塞尔曲线作为移动轨迹
    //时间
    keyframe.duration = 10;
    
    //2.关键帧动画 --- 气球的放缩
    CAKeyframeAnimation *keyframeballon = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    keyframeballon.values = @[@(1.0), @(1.2), @(1.4), @(1.6), @(1.8), @(1.6), @(1.4), @(1.2), @(1.0)];
    keyframeballon.duration = 10;
    
    //3.创建分组动画
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[keyframe, keyframeballon];
    group.duration = 10;
    group.repeatCount = 1000;
    [self.ballon.layer addAnimation:group forKey:nil];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
