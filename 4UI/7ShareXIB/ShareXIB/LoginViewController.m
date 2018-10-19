//
//  LoginViewController.m
//  ShareXIB
//
//  Created by lanouhn on 15/12/25.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "FriendViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *IDTextField;
@property (weak, nonatomic) IBOutlet
UITextField *passwordTextField;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleLoginButtonAction:(UIButton *)sender {
    if ([self.IDTextField.text isEqualToString:@"111"] && [self.passwordTextField.text isEqualToString:@"222"]) {
        //登录成功
        FriendViewController *friendVC = [[FriendViewController alloc] init];
        [self.navigationController pushViewController:friendVC animated:YES];
    }else {
        //登录失败
        UIAlertController *failAlert = [UIAlertController alertControllerWithTitle:@"登录失败" message:@"用户名或密码错误" preferredStyle:UIAlertControllerStyleAlert];
        //添加按钮
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
        }];
        //添加方法
        [failAlert addAction:alertAction];
        [self presentViewController:failAlert animated:YES completion:nil];
    }
}

- (IBAction)handleRegistertButtonAction:(UIButton *)sender {
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
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
