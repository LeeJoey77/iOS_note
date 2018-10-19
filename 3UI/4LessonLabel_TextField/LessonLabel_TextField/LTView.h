//
//  LTView.h
//  LessonLabel_TextField
//
//  Created by lanouhn on 15/11/5.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
//LTView 属于自定义的视图(组合视图,左边Label,右边textField的组合)
//由于Label和textField只有LTView能识别,因此需要LTView这个类为外界提供操作Label和textField的接口
@interface LTView : UIView

//给Label设置文字的接口
- (void)setLabelText:(NSString *)text;
//给textField设置占位符的接口
- (void)setPlaceHolder:(NSString *)placeholder;
//给textField设置键盘类型的接口
- (void)setKeyboardType:(UIKeyboardType)keyboardType;
//给textField设置密码格式
- (void)setSecureTextType:(BOOL)secureTextType;
//获取textField中输入文字的接口
- (NSString *)getTextFieldText;
//给textField设置代理的接口
- (void)setDelegate:(id<UITextFieldDelegate>)delegate;

@end
