//
//  LogInView.h
//  LessonUIViewController
//
//  Created by lanouhn on 15/11/4.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>

//简单的自定义视图封装:直接将控件声明为属性,在.h文件中声明外界访问的接口即可
@interface LogInView : UIView<UITextFieldDelegate>

@property (nonatomic, retain) UILabel *label;
@property (nonatomic, retain) UITextField *textField;
@property (nonatomic, retain) UIButton *logInButton;//button在此retain了一次,需要释放
@end
