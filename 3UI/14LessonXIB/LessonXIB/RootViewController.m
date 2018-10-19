//
//  RootViewController.m
//  LessonXIB
//
//  Created by lanouhn on 15/11/19.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
@property (retain, nonatomic) IBOutlet UILabel *aLabellabel;
@property (retain, nonatomic) IBOutlet UITextField *textField;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)handleButtonAction:(UIButton *)sender {
    //Label显示输入框中的文字
    self.aLabellabel.text = self.textField.text;
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
    [_aLabellabel release];
    [_textField release];
    [super dealloc];
}
@end
