//
//  FirstViewController.m
//  LessonStoryboard
//
//  Created by lanouhn on 15/11/19.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (retain, nonatomic) IBOutlet UILabel *aLabel;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor purpleColor];
    self.aLabel.text = self.data;
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
    self.data = nil;
    [_aLabel release];
    [super dealloc];
}
@end
