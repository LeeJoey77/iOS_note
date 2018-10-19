//
//  DelegateViewController.m
//  LessonTargetAction
//
//  Created by lanouhn on 15/11/6.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "DelegateViewController.h"
#import "TouchView.h"
#import "UIColor+RandomColor.h"
//4.服从协议,可以在类的延展中实现,或在.h中实现(需要重新导入)
@interface DelegateViewController () <TouchViewDelegate>

@end

@implementation DelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TouchView *redView = [[TouchView alloc] initWithFrame:CGRectMake(60, 50, 200, 100)];
    redView.backgroundColor = [UIColor redColor];
    //3.为redView指定代理对象
    redView.delegate = self;
    [self.view addSubview:redView];
    [redView release];
    
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
    
//或
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 300, 100, 270)];
//    imageView.backgroundColor = [UIColor redColor];
//    imageView.image = [UIImage imageNamed:@"iphone"];//自动识别png格式,其它格式要写后缀
//    [self.view addSubview:imageView];
//    [imageView release];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- TouchViewDelegate

//@optional
- (void)handleTouchBegan:(TouchView *)aView {
    //改变自身视图颜色
    aView.backgroundColor = [UIColor randomColor];
}

- (void)handleTouchMoved:(TouchView *)aView {
}

- (void)handleTouchEnded:(TouchView *)aView {
    aView.center = CGPointMake(arc4random() % (220 - 100 + 1) + 100, arc4random() % (518 - 50 + 1) + 50);

}

- (void)handleTouchCancelled:(TouchView *)aView {
    
}








@end
