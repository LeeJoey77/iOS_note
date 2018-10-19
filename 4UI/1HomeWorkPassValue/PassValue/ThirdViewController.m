//
//  ThirdViewController.m
//  PassValue
//
//  Created by lanouhn on 15/12/26.
//  Copyright © 2015年 lanouhn0. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加观察者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveValue1:) name:@"First" object:nil];
 
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"%@-----", self.thirdTF.text);
}

- (void)receiveValue1:(NSNotification *)sender {
    self.thirdTF.text = [sender.userInfo objectForKey:@"textFieldValue"];
    NSLog(@"%@+++", self.thirdTF.text);

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
