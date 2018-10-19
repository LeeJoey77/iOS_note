//
//  UIColor+RandomColor.m
//  LessonTargetAction
//
//  Created by lanouhn on 15/11/6.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "UIColor+RandomColor.h"

@implementation UIColor (RandomColor)
+ (UIColor *)randomColor {
    UIColor *randomColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() %256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1.0];
    return randomColor;
}
@end
