//
//  TouchView.h
//  LessonTargetAction
//
//  Created by lanouhn on 15/11/6.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TouchView;
//1.定义协议
@protocol TouchViewDelegate <NSObject>

@optional
- (void)handleTouchBegan:(TouchView *)aView;//对应touchesBegan时机
- (void)handleTouchMoved:(TouchView *)aView;//对应touchesMoved时机
- (void)handleTouchEnded:(TouchView *)aView;//对应touchesEnded时机
- (void)handleTouchCancelled:(TouchView *)aView;//对应touchesCancelled时机

@end

@interface TouchView : UIView

//2.定义代理属性,存储外界设置的代理对象
@property (nonatomic, assign) id<TouchViewDelegate> delegate;

@end

//代理和协议的使用:
//当自定义协议时的步骤:
    //1.定义协议(协议中存放代理应该完成的任务)
    //2.定义代理属性(存储外界的代理对象)
    //3.在其他文件中指定代理对象
    //4.代理对象所属的类,服从对应的协议
    //5.实现协议中的方法
    //6.协议的制定者通知代理执行协议中的方法