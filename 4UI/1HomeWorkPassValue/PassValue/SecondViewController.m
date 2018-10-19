//
//  SecondViewController.m
//  PassValue
//
//  Created by lanouhn on 15/12/24.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "SecondViewController.h"
#import "Singleton.h"
#import "ThirdViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.secondLabel.textColor = [UIColor redColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleButtonAction:(id)sender {
    //代理传值
//    if ([self.delegate respondsToSelector:@selector(passValueToFirstVC:)]) {
//        [self.delegate passValueToFirstVC:self.secondTextField.text];
//    }
    
    //单例传值从后往前传
//    [Singleton mainSingleton].data = self.secondTextField.text;
    
    //block传值
//    if (self.passValue) {
//        self.passValue(self.secondTextField.text);
//    }
    
    //通知传值
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"Second" object:self userInfo:[NSDictionary dictionaryWithObject:self.secondTextField.text forKey:@"textFieldValue"]];
//    [self.navigationController popToRootViewControllerAnimated:YES];
}

//Block 传值方式二
- (void)returnText:(ReturnTextBlock)block {
   
        self.passValue = block;
}

- (void)viewWillAppear:(BOOL)animated {
    //单例传值从前往后传
    //    NSLog(@"%@", [Singleton mainSingleton].data);
    //    self.secondLabel.text = [Singleton mainSingleton].data;
    
}
- (IBAction)handleNextButtonAction:(UIButton *)sender {
    ThirdViewController *thirdVC = [self.storyboard instantiateViewControllerWithIdentifier:@"third"];
    [self.navigationController pushViewController:thirdVC animated:YES];
}

@end
