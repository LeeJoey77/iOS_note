//
//  ActionView.h
//  LessonTargetAction
//
//  Created by lanouhn on 15/11/6.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionView : UIView

//给外界提供接口,获取触摸响应的目标(target), 以及相应的方法(action)
- (void)addTarget:(id)target action:(SEL)action;

@end

