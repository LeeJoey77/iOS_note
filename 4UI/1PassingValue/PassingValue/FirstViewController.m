//
//  FirstViewController.m
//  PassingValue
//
//  Created by lanouhn on 15/12/3.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

typedef NSString *(^bbba)();
@interface FirstViewController () <SecondViewControllerDelegate>
@property (retain, nonatomic) IBOutlet UILabel *aLabel;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)handleButtonAction:(id)sender {
/*
    //方式一: 通过push跳转传值
    SecondViewController *secondVC = [self.storyboard instantiateViewControllerWithIdentifier:@"second"];
    
    //Block传值方式一
    secondVC.returnTextBlock = ^(NSString *text) {
        self.aLabel.text = text;
    };

    //Block传值方式二
    [secondVC returnText:^(NSString *data) {
        self.aLabel.text = data;
    }];
    [self.navigationController pushViewController:secondVC animated:YES];
*/
    
    //方式二:通过segue跳转传值
    [self performSegueWithIdentifier:@"pushToSec" sender:nil];
}

//通过桥(segue)完成页面跳转,在跳转之前该方法就会触发,一般用作传值
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // 获取下一个界面对象
    SecondViewController *secondVC = [segue destinationViewController];
/*
    //Block传值方式一
    secondVC.returnTextBlock = ^(NSString *text) {
        self.aLabel.text = text;
        NSLog(@"%s %d", __FUNCTION__, __LINE__);
    };
*/
    //Block传值方式二
    [secondVC returnText:^(NSString *data) {
        self.aLabel.text = data;
    }];

    //方式三:代理传值
    secondVC.delegate = self;
    
}

- (void)passValue:(NSString *)data {
    self.aLabel.text = data;
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

- (void)dealloc {
    [_aLabel release];
    [super dealloc];
}
@end
