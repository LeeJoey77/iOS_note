//
//  PinchView.m
//  LessonTouch
//
//  Created by lanouhn on 15/11/5.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "PinchView.h"

@implementation PinchView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //iOS支持多点触摸,只不过默认的是单点触摸
        self.multipleTouchEnabled = YES;
    }
    return self;
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if (1 == touches.count) {
        return;//如果触摸只有一个点,则不捏合
    }
//    //1.获取到两个手指对象
//    NSArray *allTouch = [touches allObjects];
//    UITouch *firstTouch = [allTouch firstObject];
//    UITouch *secondTouch = [allTouch lastObject];
//    //2.分别获取到两个手指的当前位置
//    CGPoint currentFirstPoint = [firstTouch locationInView:self];
//    CGPoint currentSecondPoint = [secondTouch locationInView:self];
//    //3.计算当前两个手指的距离
//    CGFloat currentDistance = [self distance:currentFirstPoint secondPoint:currentSecondPoint];
//    //4.获取捏合之前两点的位置
//    CGPoint previousFirstPoint = [firstTouch previousLocationInView:self];
//    CGPoint previousSecondPoint = [secondTouch previousLocationInView:self];
//    //5.计算捏合之前两个手指的距离
//    CGFloat previousDistance = [self distance:previousFirstPoint secondPoint:previousSecondPoint];
//    //6.求捏合之前与捏合之后距离之间的比例
//    CGFloat rate = currentDistance / previousDistance;
//    //7.修改图形大小
//    //缩放时视图的中心点不变,只改变大小时,只需要修改bounds
//    self.bounds = CGRectMake(0, 0, self.bounds.size.width * rate, self.bounds.size.height * rate);
}

//计算两个点之间的距离
- (CGFloat)distance:(CGPoint)firstPoint secondPoint:(CGPoint)secondPoint {
    CGFloat dx = firstPoint.x - secondPoint.x;
    CGFloat dy = firstPoint.y - secondPoint.y;
    return sqrt(dx * dx + dy * dy);
}
@end
