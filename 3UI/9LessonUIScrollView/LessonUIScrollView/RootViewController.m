//
//  RootViewController.m
//  LessonUIScrollView
//
//  Created by lanouhn on 15/11/10.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "RootViewController.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
@interface RootViewController ()<UIScrollViewDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //UIScrollView 是滑动控件的基类,可以支持滚动,当内容区域大于可视区域的大小时,需要滚动来查看整个内容区域
    //UIScrollView 是UITableView,UITextView 等滚动视图的基类
    //1.创建控件
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    //2.配置属性
    scrollView.backgroundColor = [UIColor redColor];
    //(1)设置内容区域大小
    scrollView.contentSize = CGSizeMake(2000, 1400);
    //(2)设置内容区域偏移量
    //contentOffset是 scrollview当前显示区域frame.origin相对于内容区域frame.origin的偏移量
//    scrollView.contentOffset = CGPointMake(1625, 733);//右下角
    
//    //contentInset:add additional scroll area around content
//    //contentInset为零时,显示区域不会超出内容区域
//    scrollView.contentInset = UIEdgeInsetsMake(110, 110, 110, 110);
    //(3)隐藏滑动指示器
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.showsVerticalScrollIndicator = YES;
    //(4)控制scrollView能否滚动
    scrollView.scrollEnabled = YES;
    //(5)方向锁,控制滑动时只能单方向滑动
    scrollView.directionalLockEnabled = YES;
    //(6)控制当内容页到边界时,是否具有反弹效果
//    scrollView.bounces = NO;
    //(7)控制当点击状态条时,scrollView是否可以回到顶部,y的偏移量为0
    scrollView.scrollsToTop = YES;
    //(8)控制即使内容区域大小不大于可视区域大小时,依然在水平方向和垂直方向具有反弹效果
//    scrollView.contentSize = CGSizeMake(scrollView.bounds.size.width, scrollView.bounds.size.height);//内容区域和可视区域一样大
//    scrollView.contentOffset = CGPointMake(0, 0);
//    scrollView.alwaysBounceHorizontal = YES;
//    scrollView.alwaysBounceVertical = YES;
    
    //(9)代理
    scrollView.delegate = self;
    
    //(10)和缩放有关的属性
    //缩放控制的是内容页大小
    //拖拽改变的是平移量
    scrollView.minimumZoomScale = 1.0;//最小缩放比例
    scrollView.maximumZoomScale = 4.0;//最大放大比例
    //3.添加到父视图
    [self.view addSubview:scrollView];
    //4.释放
    [scrollView release];
    
    //添加图片
    //用以下方法,图片将会被缩小或放大到与内容区域大小相等
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height)];
    imageView.tag = 1111;
    imageView.image = [UIImage imageNamed:@"image1411661748.jpg"];
    [scrollView addSubview:imageView];
    [imageView release];
    
//    //用以下方法,图片大小不变,和内容区域大小不一定相等
//    UIImage *image = [UIImage imageNamed:@"EC6DA337-D968-4EA4-A383-0F3BFD404DC1.jpg"];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//    NSLog(@"%.2f %.2f", image.size.width, image.size.height);
//    [scrollView addSubview:imageView];
//    [imageView release];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- UIScrollViewDelegate
//@optional
//只要拖拽就会触发(scrollView的偏移量发生变化)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //打印偏移量
//    NSLog(@"offset = %@", NSStringFromCGPoint(scrollView.contentOffset));
}
//缩放控制的是内容页大小
//拖拽改变的是平移量
//只要缩放就会触发
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    //打印内容页的大小
//    NSLog(@"contenSize = %@", NSStringFromCGSize(scrollView.contentSize));
}

//当scrollView将要拖拽时触发,此时手指刚刚接触到视图
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {

}

//当scrollView将要结束拖拽时触发
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {

}

//当scrollView结束拖拽时触发,此时手指已经离开屏幕
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

}

//当scrollView将要开始减速时触发,此时手指已经离开屏幕(并不一定会触发该方法,有加速过程才会触发该方法)
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {

}

//当scrollView减速结束时触发,已经停止滑动(并不一定会触发该方法,有加速过程才会触发该方法)
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //滑动结束时,视图回到最左边
//    [scrollView setContentOffset:CGPointZero animated:YES];
}

//当滑动scrollView,并且动画结束时触发(前提是必须要有动画效果)
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
//    NSLog(@"offset = %@", NSStringFromCGPoint(scrollView.contentOffset));//打印偏移量
    
}

//返回需要缩放的视图,但是只能是scrollView的子视图
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return [scrollView viewWithTag:1111];
}

//当将要开始缩放触发
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {

}

//当缩放结束时触发
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {

}

//当scrollsToTop属性设置为YES时,通过该方法进一步询问点击状态条是否要回到顶部
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
    return YES;
}

//当点击状态条,scrollView回到顶部时触发
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {

}

//协议和代理的使用步骤:
//一:自定义协议
//1.自定义协议(存放代理实现的任务,分为可选和必选)
//2.定义代理属性(用于存储代理对象,id类型,要服从协议,语义特性为assign)
//3.在其他文件中为该类对象指定代理(指定任务有谁来做)
//4.代理对象所属的类,服从协议(答应干活)
//5.代理对象实现协议中的方法(实现协议中的方法,确定方法实现的细节)
//6.委托方通知代理去执行协议中的方法(让代理什么时候去干活)

//二:无需自定义协议(系统的协议)
//1.在其他文件中为某个类指定代理(指定任务由谁来做)
//2.代理对象所属的类,服从协议(答应干活)
//3.代理对象实现协议中的方法(实现协议中的方法,确定方法实现的细节)





@end
