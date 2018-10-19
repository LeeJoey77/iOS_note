//
//  SheetViewController.m
//  ShareUIActionSheet
//
//  Created by lanouhn on 15/11/9.
//  Copyright (c) 2015年 王硕. All rights reserved.
//

#import "SheetViewController.h"

@interface SheetViewController ()

@end

@implementation SheetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //1.创建Button;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 200, 100, 30);
    [button setTitle:@"选择框" forState:UIControlStateNormal];
    [self.view addSubview:button];
    //2.添加点击事件;
    [button addTarget:self action:@selector(showSheet:) forControlEvents:UIControlEventTouchUpInside];
    
}
//3.点击事件
- (void)showSheet:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"提示"//视图标题
                                  delegate:self//设置代理
                                  cancelButtonTitle:@"取消"//取消按钮的标题
                                  destructiveButtonTitle:@"确定"//特殊标记的按钮的标题
                                  otherButtonTitles:@"第一项", @"第二项",nil];//其他按钮的标题,注意,最后要跟一个nil;
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;//设置风格
    [actionSheet showInView:self.view];//显示选择框;
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self showAlert:@"按下的是确定按钮"];
    }else if (buttonIndex == 1) {
        [self showAlert:@"按下的第一项按钮"];
    }else if(buttonIndex == 2) {
        [self showAlert:@"按下的是第二项按钮"];
    }else if(buttonIndex == 3) {
        [self showAlert:@"按下的是取消按钮"];
    }
}

-(void)showAlert:(NSString *)msg {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Action Sheet选择项"
                          message:msg
                          delegate:self
                          cancelButtonTitle:@"确定"
                          otherButtonTitles: nil];
    [alert show];
}




//将要显示的时候触发;
- (void)willPresentActionSheet:(UIActionSheet *)actionSheet {
    NSLog(@"将要触发");
}
//已经显示的时候触发;
- (void)didPresentActionSheet:(UIActionSheet *)actionSheet {
    NSLog(@"已经触发");
}
//按钮将要消失的时候触发;
- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"按钮即将消失");
}
//按钮消失的时候触发;
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"按钮已经消失了");
}






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
