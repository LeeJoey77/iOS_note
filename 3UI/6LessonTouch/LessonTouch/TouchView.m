//
//  TouchView.m
//  LessonTouch
//
//  Created by lanouhn on 15/11/5.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "TouchView.h"
#import "UIColor+RandomColor.h"
//为什么要定义TouchView这样一个UIView的子类?
//因为当我们想让UIView响应触摸事件的话,需要在它的.m文件中实现几个方法.拿不到UIView的.m文件,因此需要定义TouchView这样一个子类


@interface TouchView ()

@end

@implementation TouchView

//如果想让一个视图对触摸事件做出响应,需要实现以下能够响应触摸事件的方法

////当刚开始触摸时触发(手指刚接触到视图)
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    
//    [self changeSelfColor];
////    NSLog(@"%s %d", __FUNCTION__, __LINE__);
//}
//
////当手指在视图内移动时触发(前提是手指没有离开屏幕)
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
////    NSLog(@"%s %d", __FUNCTION__, __LINE__);
//
//}
//
////当触摸结束时触发(此时手指已经离开屏幕)
//- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
////    NSLog(@"%s %d", __FUNCTION__, __LINE__);
//    //修改父视图的颜色
//    [self changeSuperViewColor];
//    
//    //改变自身的位置
//    [self changeSelfCenter];
//
//}
//
////当触摸取消时触发(触摸意外中断,比如有电话进入)
//- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
////    NSLog(@"%s %d", __FUNCTION__, __LINE__);
//
//}

//以下三个方法没有写.h文件,是本类私有的,也可以写在类的延展中
//修改自身颜色
- (void)changeSelfColor {
    self.backgroundColor = [UIColor randomColor];
}

//修改父视图颜色
- (void)changeSuperViewColor {
    self.superview.backgroundColor = [UIColor randomColor];
    
}

//修改父视图位置
- (void)changeSelfCenter {
    self.center = CGPointMake(arc4random() % 101 + 100, arc4random() % 301 + 100);
    //或
    //self.frame = CGRectMake(arc4random() % 121, arc4random() % 369, 200, 200);
}

//当刚开始触摸时触发(手指刚接触到视图)
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //touches存储手指对象,对应的类是UITouch
    //1.获取手指点击的点
    UITouch *touch = [touches anyObject];//从集合中快速取出任一点对象
    //2.获取点击的次数
    if (1 == touch.tapCount) {
        //单击,改变自身颜色
//        [self changeSelfColor];
        //当识别为单击时,延迟执行,看是否是双击操作
        [self performSelector:@selector(changeSelfColor) withObject:nil afterDelay:0.25];
    }else if (2 == touch.tapCount) {
        //双击,改变父视图颜色
        //当识别为双击时,取消单击操作
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(changeSelfColor) object:nil];
        [self changeSuperViewColor];
        
    }
}














@end
