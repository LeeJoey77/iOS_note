//
//  RootViewController.m
//  LessonUISegmentedControlAndUISlider
//
//  Created by lanouhn on 15/11/14.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //分段控件
    //1.创建控件
    NSArray *items = @[@"轻怕", @"长按", @"轻扫", @"平移", @"捏合", @"旋转"];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
    //2.配置属性
    segmentedControl.frame = CGRectMake(40, 100, 300, 30);
    //添加响应事件
    [segmentedControl addTarget:self action:@selector(handleSegmentedControl:) forControlEvents:UIControlEventValueChanged];
    //设置默认选中的分段
    segmentedControl.selectedSegmentIndex = 2;
    //设置分段显示的文字
    [segmentedControl setTitle:@"消息" forSegmentAtIndex:2];
    //设置指定分段的宽度
    [segmentedControl setWidth:100 forSegmentAtIndex:2];
    //设置分段空间的渲染颜色
    segmentedControl.tintColor = [UIColor orangeColor];
    //3.添加到视图
    [self.view addSubview:segmentedControl];
    //4.释放
    [segmentedControl release];
    
    
    //    //滑块控件
    //    //1.创建滑块控件对象
    //    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(10, 300, 300, 30)];
    //    //2.配置属性
    //    //设置滑竿最小值
    //    slider.minimumValue = 0.0;
    //    //设置滑竿最大值
    //    slider.maximumValue = 1.0;
    //    //设置滑竿当前值
    //    slider.value = 0.5;
    //    //设置滑竿划过的颜色
    //    slider.minimumTrackTintColor = [UIColor greenColor];
    //    //设置滑竿没划过的颜色
    //    slider.maximumTrackTintColor = [UIColor redColor];
    //    //设置响应事件是否在滑动过程中连续触发
    //    slider.continuous = NO;
    //    //添加响应事件
    //    [slider addTarget:self action:@selector(handleSliderAction:) forControlEvents:UIControlEventValueChanged];
    //    //3.添加到父视图
    //    [self.view addSubview:slider];
    //    //4.释放
    //    [slider release];
    
    //UIImageView 和UILabel 的用户交互是关闭的
    
    //    //图片视图
    //    //1.创建对象
    //    UIImage *image = [UIImage imageNamed:@"iphone"];//UIImage继承自NSObject不能直接添加到父视图显示
    //    UIImageView *imageview = [[UIImageView alloc] initWithImage:image];
    //    //2.配置属性
    //    imageview.frame = CGRectMake(60, 100, 260, image.size.height * (260 / image.size.width));
    //    //3.添加到父视图
    //    [self.view addSubview:imageview];
    //    //4.释放
    //    [imageview release];
    //    //或
    //    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 300, 100, 270)];
    //    imageView.backgroundColor = [UIColor redColor];
    //    imageView.image = [UIImage imageNamed:@"iphone"];//自动识别png格式,其它格式要写后缀
    //    [self.view addSubview:imageView];
    //    [imageView release];
    
    
    //播放动态图片
    //1.创建对象
    UIImage *image = [UIImage imageNamed:@"iphone.png"];//UIImage继承自NSObject不能直接添加到父视图显示
    UIImageView *imageview = [[UIImageView alloc] initWithImage:image];
    //2.配置属性
    imageview.frame = CGRectMake(60, 100, 260, image.size.height * (260 / image.size.width));
    //设置播放动态效果的一组图片
    NSMutableArray *imageArray = [NSMutableArray arrayWithCapacity:1];
    for (int i = 1; i < 41; i++) {
        //图片名字
        NSString *imageName = [NSString stringWithFormat:@"2250_3650903_179fb89ae279fae－%d（被拖移）.tiff", i];
        //根据图片名字创建图片对象
        UIImage *image = [UIImage imageNamed:imageName];
        //将图片对象添加到imageArray数组
        [imageArray addObject:image];
    }
    imageview.animationImages = imageArray;
    //设置播放一组图片所用的时间
    imageview.animationDuration = 10;
    //设置重复的次数
    imageview.animationRepeatCount = 100;
    
    //打开用户交互
    imageview.userInteractionEnabled = NO;//UIImageView 和UILabel 的用户交互是关闭的
    //开始播放动态图片
    [imageview startAnimating];
    //停止播放
    [imageview stopAnimating];
    //3.添加到父视图
    [self.view addSubview:imageview];
    //4.释放
    [imageview release];
    
    
    
    
    
}


#pragma mark --- handleSegmentedControl
//滑竿控件点击响应事件
- (void)handleSliderAction:(UISlider *)slider {
    NSLog(@"%.2f", slider.value);
}

//分段控件点击响应事件
- (void)handleSegmentedControl:(UISegmentedControl *)segmentedControl {
    switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            NSLog(@"轻拍");
            break;
        case 1:
            NSLog(@"长按");
            break;
        case 2:
            NSLog(@"轻扫");
            break;
        case 3:
            NSLog(@"平移");
            break;
        case 4:
            NSLog(@"捏合");
            break;
        case 5:
            NSLog(@"旋转");
            break;
        default:
            break;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
