//
//  ActionView.m
//  LessonTargetAction
//
//  Created by lanouhn on 15/11/6.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "ActionView.h"
#import "UIColor+RandomColor.h"

@interface ActionView ()
{
    id _target;//存储响应的目标
    SEL _action;//存储响应的方法
}
@end

@implementation ActionView

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    switch (self.tag) {
//        case 200:
//            self.backgroundColor = [UIColor randomColor];
//            break;
//        case 201:
//            self.superview.backgroundColor = [UIColor randomColor];
//            break;
//        case 202:
//            self.center = CGPointMake(arc4random() % 256 / (220 - 100 + 1) + 100, arc4random() % (300 - 100 + 1) + 100);
//            break;
//        default:
//            break;
//    }
//}

//以上ActionView的处理方式不够灵活,每次创建新建视图,提出新的需求时都需要改变ActionView的源代码,该对应的视图添加对应的实现方法,非常麻烦
//我们可以通过target/action 设计模式,让ActionView像button一样灵活起来

//给外界提供接口,获取触摸响应的目标(target), 以及相应的方法(action)
- (void)addTarget:(id)target action:(SEL)action {
    //保存外界响应目标和方法
    _target = target;
    _action = action;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //当ActionView接到触摸事件之后,通知target去执行action方法
    [_target performSelector:_action withObject:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

@end
