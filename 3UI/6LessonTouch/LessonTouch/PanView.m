//
//  PanView.m
//  LessonTouch
//
//  Created by lanouhn on 15/11/5.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "PanView.h"

@implementation PanView

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    //1.获取手指对象
    UITouch *touch = [touches anyObject];
    //2.获取手指当前位置
    CGPoint currentPoint = [touch locationInView:self];
    //3.获取手指之前位置
    CGPoint previousPoint = [touch previousLocationInView:self];
    //4.计算移动的增量
    CGFloat dx = currentPoint.x - previousPoint.x;
    CGFloat dy = currentPoint.y - previousPoint.y;
    //5.修改视图的位置
    self.center = CGPointMake(self.center.x + dx, self.center.y + dy);
}
@end
