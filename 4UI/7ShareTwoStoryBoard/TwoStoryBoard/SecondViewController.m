//
//  SecondViewController.m
//  TwoStoryBoard
//
//  Created by lanouhn on 15/12/28.
//  Copyright © 2015年 李杨. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

#define NSLog(format, ...) do { \
fprintf(stderr, "<%s : %d> %s\n", \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], \
__LINE__, __func__); \
(NSLog)((format), ##__VA_ARGS__); \
fprintf(stderr, "-------\n"); \
} while (0)

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//返回到到第一个控制器点击事件
- (IBAction)backToFirstVC:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


//返回到到第三个控制器点击事件
- (IBAction)ToThirdVCAction:(UIButton *)sender {
    
    //(1)创建storyboard对象
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //(2)从对应的storyboard中根据标示符获取视图控制器对象
    ThirdViewController *thirdVC =  [storyboard instantiateViewControllerWithIdentifier:@"thirdVC"];
    [self presentViewController:thirdVC animated:YES completion:nil];
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
