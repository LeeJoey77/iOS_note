//
//  BaseNavigationController.m
//  10LessonModalPresentAndDismiss
//
//  Created by lanouhn on 15/11/20.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    //配置导航条的公共属性
    [self configureNavigationBarCommonProperty];
}

//配置导航条的公共属性(UINavigationController没有navigationItem属性)
- (void)configureNavigationBarCommonProperty {
    //1.配置导航条颜色
    self.navigationBar.barTintColor = [UIColor cyanColor];
    //2.配置导航条渲染颜色
//    self.navigationBar.tintColor = [UIColor yellowColor];
    //3.修改title的颜色和字体大小
    NSDictionary *dic = @{NSForegroundColorAttributeName:[UIColor blackColor], NSFontAttributeName:[UIFont systemFontOfSize:20]};
    self.navigationBar.titleTextAttributes = dic;
       
}

//设置状态条颜色
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
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
