//
//  RootViewController.m
//  LessonStoryboard
//
//  Created by lanouhn on 15/11/19.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
@interface RootViewController ()

@property (retain, nonatomic) IBOutlet UITextField *textField;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
}
- (IBAction)handleButtonAction:(id)sender {
    //进入下一个界面,第一种方法
    //1.当要获取的视图控制器和当前的视图控制器在同一个storyboard中
    //从storyboard获取对应的视图控制器对象
    //self.storyboard --- 获取到的是当前视图控制器所在的storyboard对象
//       FirstViewController *firstVC =  [self.storyboard instantiateViewControllerWithIdentifier:@"first"];
//        [self.navigationController pushViewController:firstVC animated:YES];
    
    //2.当要获取的视图控制器和当前的视图控制器不在同一个storyboard中
    //(1)创建storyboard对象
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SecondStoryboard" bundle:nil];
    //(2)从对应的storyboard中根据标示符获取视图控制器对象
//        SecondViewController *secondVC = [storyboard instantiateViewControllerWithIdentifier:@"second"];
//        [self.navigationController pushViewController:secondVC animated:YES];
    
    //进入下一个界面,第二种方法
    [self performSegueWithIdentifier:@"segue" sender:nil];

    //进入下一个界面,第三种方法,
    //直接将按钮与下一个界面搭桥即可,不用写任何代码
    //但是,该方法有一个弊端,因为这种方法是为这个按钮单独定制的,如果在第一个界面中有许多按钮想通过点击事件进入第二个界面的话,还要搭建很多这样的桥才行,这样的话关系冗杂,不如直接通过第二种方法(视图控制器与视图控制器建桥),为该方法多关联几个Button即可
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
//通过桥(segue)完成页面跳转,在跳转之前该方法就会触发,一般用作传值
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // 获取下一个界面对象
    FirstViewController *firstVC = [segue destinationViewController];
    //传值
    firstVC.data = self.textField.text;
    
    
}


- (void)dealloc {
    [_textField release];
    [super dealloc];
}
@end
