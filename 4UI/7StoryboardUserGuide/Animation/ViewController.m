//
//  ViewController.m
//  Animation
//
//  Created by lanouhn on 16/1/21.
//  Copyright © 2016年 lanouhn0. All rights reserved.
//

#import "ViewController.h"
#import "RootViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)handleButtonAction:(UIButton *)sender {
    RootViewController *rootVC = [self.storyboard instantiateViewControllerWithIdentifier:@"root"];
    rootVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:rootVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
