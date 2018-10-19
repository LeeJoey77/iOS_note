//
//  LogInView.m
//  LessonUIViewController
//
//  Created by lanouhn on 15/11/4.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "LogInView.h"

//左Label
#define kMargin_Left_Label 30
#define kMargin_Top_Label 100
#define kWidth_Label 70
#define kHeight_Label 30

//右textField
#define kMargin_Left_TextField (kMargin_Left_Label + kWidth_Label + 20) 
#define kMargin_Top_TextField (kMargin_Top_Label)
#define kWidth_TextField 160
#define kHeight_TextField (kHeight_Label)

//登录Button
#define kMargin_Left_Button  100
#define kMargin_Top_Button (kMargin_Top_Label + kHeight_Label + 30)
#define kWidth_Button 80
#define kHeight_Button 40

@implementation LogInView

- (void)dealloc
{
    [_label release];
    [_textField release];
    [_logInButton release];
    [super dealloc];
}

//重写初始化方法,完成控件的创建和添加
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //添加控件
        [self setupLabel];
        [self setupTextField];
        [self setupLogInButton];
    }
    return self;
}

//布局Label
- (void)setupLabel {
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(kMargin_Left_Label, kMargin_Top_Label, kWidth_Label, kHeight_Label)];
    _label.text = @"用户名";
    [self addSubview:_label];
    [_label release];
}

//布局textField
- (void)setupTextField {
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(kMargin_Left_TextField, kMargin_Top_TextField, kWidth_TextField, kHeight_TextField)];
    _textField.placeholder = @"请输入用户名";
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.delegate = self;
    [self addSubview:_textField];
    [_textField release];
}

//布局Button
- (void)setupLogInButton {
    self.logInButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _logInButton.frame = CGRectMake(kMargin_Left_Button, kMargin_Top_Button, kWidth_Button, kHeight_Button);
    _logInButton.backgroundColor = [UIColor whiteColor];
    [_logInButton setTitle:@"登录" forState:UIControlStateNormal];
    [_logInButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self addSubview:_logInButton];
}

//该方法是视图的方法,当旋转时,试图会自动调用该方法重新布局子视图
- (void)layoutSubviews {
    [super layoutSubviews];
    //1.获取当前屏幕的旋转方向
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;//状态条,获取的是状态条的方向
    //2.根据旋转方向调整视图
    switch (orientation) {
        case UIInterfaceOrientationPortrait://竖屏
        case UIInterfaceOrientationPortraitUpsideDown://倒置
            self.logInButton.frame = CGRectMake(kMargin_Left_Button, kMargin_Top_Button, kWidth_Button, kHeight_Button);
            break;
        case UIInterfaceOrientationLandscapeLeft://左横屏
        case UIInterfaceOrientationLandscapeRight://右横屏
            self.logInButton.frame = CGRectMake(kMargin_Left_TextField + kWidth_Button + 130, kMargin_Top_Label, kWidth_Button, kHeight_Button);
            break;
        default:
            break;
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.textField resignFirstResponder];
    return YES;
}

@end
