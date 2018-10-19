//
//  FirstViewController.m
//  PassValue
//
//  Created by lanouhn on 15/12/24.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "Singleton.h"

@interface FirstViewController ()<SecondViewControllerDelegate>

@end

@implementation FirstViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.firstLabel.textColor = [UIColor redColor];

    //添加观察者
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveValue:) name:@"Second" object:nil];
}

- (void)receiveValue:(NSNotification *)sender {
    self.firstLabel.text = [sender.userInfo objectForKey:@"textFieldValue"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (IBAction)handleButtonAction:(UIButton *)sender {
    //代理传值方法一:通过navigationController传值
//    SecondViewController *secondVC = [self.storyboard instantiateViewControllerWithIdentifier:@"second"];//通过storyboard找到SecondViewController
//    secondVC.delegate = self;
//    [self.navigationController pushViewController:secondVC animated:YES];
    
    //代理传值方法二:通过segue
//    [self performSegueWithIdentifier:@"segue" sender:@"haha"];
    
    
    SecondViewController *secondVC = [self.storyboard instantiateViewControllerWithIdentifier:@"second"];
    //单例传值从前往后传
//    Singleton *singleton = [Singleton mainSingleton];
//    singleton.data = self.firstTextField.text;
//    NSLog(@"%@", singleton.data);
  
    //Block传值方式一:Block作为属性
//    secondVC.passValue = ^(NSString *text) {
//        self.firstLabel.text = text;
//    };
    
    //Block传值方式二:block作为参数
    [secondVC returnText:^(NSString *data) {
        self.firstLabel.text = data;
    }];
    
    
    //直接跳转到第三个界面可以传值,间接不可以???????
    ThirdViewController *thirdVC = [self.storyboard instantiateViewControllerWithIdentifier:@"third"];
    thirdVC.view.backgroundColor = [UIColor orangeColor];
    
    //通知传值
    [[NSNotificationCenter defaultCenter] postNotificationName:@"First" object:self userInfo:[NSDictionary dictionaryWithObject:self.firstTextField.text forKey:@"textFieldValue"]];
    [self.navigationController pushViewController:secondVC animated:YES];
    
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //获取下一个界面VC
    SecondViewController *secondVC = [segue destinationViewController];
    //传值
    secondVC.delegate = self;
}

- (void)passValueToFirstVC:(NSString *)text {
    self.firstLabel.text = text;
}

- (void)viewWillAppear:(BOOL)animated {
    //单例传值从后往前传
//    self.firstLabel.text = [Singleton mainSingleton].data;

}

@end
