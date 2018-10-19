//
//  AlertViewController.m
//  UIAlertControl
//
//  Created by lanouhn on 15/11/14.
//  Copyright © 2015年 田猛. All rights reserved.
//

#import "AlertViewController.h"

@interface AlertViewController ()

@end

@implementation AlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 100, 100, 30);
    [button setTitle:@"点点试试" forState:UIControlStateNormal];
    //添加点击事件
    [button addTarget:self action:@selector(handleButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)handleButton:(UIButton *)button {
    //1.创建UIAlertController对象
    //UIAlertControllerStyle:
    //UIAlertControllerStyleActionSheet = 0,
    //UIAlertControllerStyleAlert
    
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"提示" message:@"删除?" preferredStyle:UIAlertControllerStyleActionSheet];
    //2.添加输入框
//    [alertControl addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//        textField.placeholder = @"登陆";
//    }];
    //UIAlertControllerStyleActionSheet
    //ACtionSheet样式下不能添加textField,否则会崩溃
     
    //在添加UIAlertAction对象
    //UIAlertActionStyle:
    //UIAlertActionStyleDefault = 0,
    //UIAlertActionStyleCancel,
    //UIAlertActionStyleDestructive
    
    //3.创建alertAction
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"好的");
    }];
    UIAlertAction *resetAction = [UIAlertAction actionWithTitle:@"重置" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"重置");
    }];
    
    //把action添加到alertController上
    [alertControl addAction:cancleAction];
    [alertControl addAction:okAction];
    [alertControl addAction:resetAction];
    
    //4.模态到alertController
    [self presentViewController:alertControl animated:YES completion:nil];
    
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
