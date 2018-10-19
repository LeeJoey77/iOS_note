//
//  UIColor+RandomColor.m
//  LessonTouch
//
//  Created by lanouhn on 15/11/5.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "UIColor+RandomColor.h"

@implementation UIColor (RandomColor)

//生成随机颜色
+ (UIColor *)randomColor {
    return [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:arc4random() % 256 / 255.0];
}

@end
