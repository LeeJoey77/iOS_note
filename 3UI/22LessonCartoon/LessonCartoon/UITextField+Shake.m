//
//  UITextField+Shake.m
//  LessonCartoon
//
//  Created by lanouhn on 15/12/2.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "UITextField+Shake.h"

@implementation UITextField (Shake)
//抖动
//减号方法
- (void)shake {
    CAKeyframeAnimation *keyFrame = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    keyFrame.values = @[@(self.layer.position.x - 10), @(self.layer.position.x), @(self.layer.position.x + 10), @(self.layer.position.x)];
    //重复次数
    keyFrame.repeatCount = 7;
    //时间
    keyFrame.duration = 0.1;
    [self.layer addAnimation:keyFrame forKey:nil];
}
@end
