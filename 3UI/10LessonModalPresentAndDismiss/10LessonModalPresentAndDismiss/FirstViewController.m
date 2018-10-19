//
//  FirstViewController.m
//  10LessonModalPresentAndDismiss
//
//  Created by lanouhn on 15/11/20.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
    
    //模态视图:视图控制器有一个[presentViewController: animated: completion:]的方法，该方法可以实现视图切换，从当前视图跳转到下一个视图，通过此方法弹出的视图我们都称为模态视图,模态视图出现的场景一般是临时弹出的窗口,譬如:登陆窗口。
    
    //跳转到第二个视图: [presentViewController: animated: completion:]
    //从第二个试图返回: [dismissViewControllerAnimated: completion:]
    
    //通过模态实现视图切换和通过导航控制器实现视图切换的区别:
        //通过模态切换的视图之间是并列关系,跳转时调用present方法, 返回时需要调用dismiss方法.但只有dismiss方法不能返回
        //通过导航控制器push 出来的视图之间是层级关系,自动集成有返回上一级按钮

    //配置导航条
    [self configureNavigationBarContent];
}

- (void)configureNavigationBarContent {
    //1.配置导航条颜色
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    //2.配置导航条渲染颜色
    self.navigationController.navigationBar.tintColor = [UIColor yellowColor];
    //3.配置navigationItem
    //3.配置navigationItem
    //(1)title
    self.navigationItem.title = @"自定义";
    //(2)leftBarButtonItem
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"add_contact"] style:UIBarButtonItemStylePlain target:self action:nil];
    //(3)rightBarButtonItem
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"green_avatarEmpty"] style:UIBarButtonItemStylePlain target:self action:nil];
    //3.修改title的颜色和字体大小
//    NSDictionary *dic = @{NSForegroundColorAttributeName:[UIColor blackColor], NSFontAttributeName:[UIFont systemFontOfSize:20]};
//    self.navigationController.navigationBar.titleTextAttributes = dic;
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //跳转到SecondViewController
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    
    //设置视图弹出时的动画效果
    self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    //模态
    [self presentViewController:secondVC animated:YES completion:nil];
    
    //导航视图控制器
//    [self.navigationController pushViewController:secondVC animated:YES];
//    [secondVC release];
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
