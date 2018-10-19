//
//  LTView.m
//  LessonLabel_TextField
//
//  Created by lanouhn on 15/11/5.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "LTView.h"

//创建延展,定义Label和textField属性
@interface LTView ()
@property (nonatomic, retain) UILabel *leftLabel;
@property (nonatomic, retain) UITextField *rightTextField;
@end


@implementation LTView

//创建完属性,如果对属性进行了retain 或copy 操作,要记得进行释放
- (void)dealloc
{
    [_leftLabel release];
    [_rightTextField release];
    [super dealloc];
}

//重写初始化方法,加载Label和textField
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //加载自身控件
        //左Label
        [self setupLeftLabelWithWidth:frame.size.width height:frame.size.height];
        //由textField
        [self setupRightTextFieldWithWidth:frame.size.width height:frame.size.height];
    }
    return self;
}
//1.创建Label
- (void)setupLeftLabelWithWidth:(CGFloat)width height:(CGFloat)height {
    //1.创建对象
    self.leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width / 3, height)];
    //self.leftLabel.backgroundColor = [UIColor whiteColor];
    //2.添加到父视图
    [self addSubview:_leftLabel];
    //3.释放
    [_leftLabel release];
}
//2.创建textField
- (void)setupRightTextFieldWithWidth:(CGFloat)width height:(CGFloat)height {
    self.rightTextField = [[UITextField alloc] initWithFrame:CGRectMake(width / 3, 0, width / 3 * 2, height)];
    _rightTextField.borderStyle = UITextBorderStyleRoundedRect;
    _rightTextField.layer.borderWidth = 1.0;//边框宽度
    _rightTextField.layer.cornerRadius = 5.0;
    [self addSubview:_rightTextField];
    [_rightTextField release];
}


#pragma mark ----- 给外界提供的接口
//给Label设置文字的接口
- (void)setLabelText:(NSString *)text {
    self.leftLabel.text = text;
}
//给textField设置占位符的接口
- (void)setPlaceHolder:(NSString *)placehoder {
    self.rightTextField.placeholder = placehoder;
}
//给textField设置键盘类型的接口
- (void)setKeyboardType:(UIKeyboardType)keyboardType {
    self.rightTextField.keyboardType = keyboardType;
}
//给textField设置密码格式
- (void)setSecureTextType:(BOOL)secureTextType {
    self.rightTextField.secureTextEntry = secureTextType;
}
//获取textField中输入文字的接口
- (NSString *)getTextFieldText {
    return self.rightTextField.text;
}

//给textField设置代理的接口
- (void)setDelegate:(id<UITextFieldDelegate>) delegate {
    //设置代理对象
    self.rightTextField.delegate = delegate; //外界传入的参数是谁,谁就是这个textfield的代理
    
}

@end
