//
//  ViewController.m
//  LessonUITextField
//
//  Created by apple on 16/4/14.
//  Copyright © 2016年 lanouhn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //墙上贴张纸
    UIView *containterView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    containterView.tag = 200;
    containterView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:containterView];
    [containterView release];
    
    //UITextField:在UILabel显示文字的基础上,多了文字编辑的功能,可以允许用户输入以及编辑文字,继承自UIControl
    //UITextField使用步骤:
    //1.创建控件
    //2.配置属性
    //3.添加到父视图
    //4.释放
    //1.创建控件
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 70, 300, 40)];
    //2.配置属性
    textField.backgroundColor = [UIColor greenColor];
    textField.tag = 300;
    //(1)设置输入框的提示文字(占位符)
    textField.placeholder = @"请输入用户名";
    //(2)设置输入框显示的文字
    textField.text = @"38";
    //(3)设置文字的颜色
    textField.textColor = [UIColor redColor];
    //(4)设置文字的样式
    textField.font = [UIFont systemFontOfSize:38];
    textField.font = [UIFont fontWithName:@"Avenir-HeavyOblique" size:39];
    //(5)设置文字的对齐方式
    textField.textAlignment = NSTextAlignmentCenter;
    //(6)设置输入框能否被编辑
    textField.enabled = YES;//默认为YES,设置为NO时与label功能相同
    //(7)当输入框开始编辑时,清除输入框中的文字
    textField.clearsOnBeginEditing = YES;
    //(8)设置弹出键盘的类型
    //textField.keyboardType = UIKeyboardTypePhonePad;
    //(9)设置return按钮的样式
    textField.returnKeyType = UIReturnKeyGoogle;
    //(10)设置输入框文字以密文形式显示
    //    textField.secureTextEntry = YES;
    //(11)设置输入框的边框样式
    textField.borderStyle = UITextBorderStyleBezel;
    //    //(12)设置自定义弹出视图(自定义键盘)
    //    UITextField *inputView = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];//出高度外,其它数值不起作用
    //    inputView.backgroundColor = [UIColor yellowColor];
    //    textField.inputView = inputView;
    //    [inputView release];
    //    //(13)自定义键盘上方的辅助视图
    //    UITextField *accessoryView = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    //    accessoryView.backgroundColor = [UIColor yellowColor];
    //    textField.inputAccessoryView = accessoryView;
    //    [accessoryView release];
    //(14)设置输入框的清除按钮格式
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //(15)设置输入框的代理
    //代理对象如何选择 --- 该对象所属的类,我们必须要能够拿到.m文件才行(因为该协议中的方法要在.m中实现)
    textField.delegate = self;//在AppDelegate类中,self相当于AppDelegate
    NSLog(@"%@" ,textField.text);
    //3.添加到父视图
    [containterView addSubview:textField];
    //4.释放
    [textField release];
   

}

#pragma mark --- UITextFieldDelegate
//触发时机 --- 当点击键盘的return按钮时触发该方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //回收键盘
    [textField resignFirstResponder];
    NSLog(@"返回");
    return YES;
}

#pragma mark --- 点击空白回收键盘,该方法不是协议中的方法
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UIView *containView = [self.view viewWithTag:200];
    UITextField *tf = (UITextField *)[containView viewWithTag:300];
    [tf resignFirstResponder];
}
#pragma mark --- 系统自动生成


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
