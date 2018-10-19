//
//  ViewController.m
//  ShareShortMessage
//
//  Created by lanouhn on 16/1/12.
//  Copyright © 2016年 lanouhn0. All rights reserved.
//

#import "ViewController.h"
#import <MessageUI/MessageUI.h>
@interface ViewController ()<MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(120, 200, 120, 40);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"click" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
}

- (void)handleButtonAction:(UIButton *)sender {
    //方法一:程序外,调用系统发送短信
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"sms://15737925193"]];
    //方法二:程序内,发送短信,好处用户发送短信还可以回到APP
//    if (<#condition#>) {
//        <#statements#>
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
