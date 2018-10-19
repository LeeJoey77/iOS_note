//
//  SecondViewController.h
//  LessonPassValue
//
//  Created by lanouhn on 15/11/11.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import <UIKit/UIKit.h>

//界面间传值之二:从后往前传
//代理传值
//一:后一个界面定义协议(定义一个传值的方法,而且这个方法要有参数,参数就是我想要传输的值)
//二:后一个界面定义的代理属性,用来存储代理对象
//三:在前一个界面进入后一个界面之前,指定后一个界面的代理对象为前一个界面
//四:代理所属的类服从协议

//代理传值第一步:定义协议
@protocol SecondViewContrllerDelegate <NSObject>

- (void)passValue:(NSString *)data;

@end

@interface SecondViewController : UIViewController

//属性传值第一步:
@property (nonatomic, retain) NSString *data;//定义属性,接收传入的数据

//代理传值第二步:定义代理属性,存储代理对象
@property (nonatomic, retain) id<SecondViewContrllerDelegate> delegate;

@end
