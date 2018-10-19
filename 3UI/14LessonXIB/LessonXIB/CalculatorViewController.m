//
//  CalculatorViewController.m
//  LessonXIB
//
//  Created by lanouhn on 15/11/19.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "CalculatorViewController.h"

//IBOUTlet:外联变量,将XIB文件中的控件和实体类相关联,获取到通过XIB创建的控件对象
//IBAction:关联控件的行为
@interface CalculatorViewController ()
@property (retain, nonatomic) IBOutlet UITextField *first;
@property (retain, nonatomic) IBOutlet UITextField *second;
@property (retain, nonatomic) IBOutlet UITextField *sum;

@end

@implementation CalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    
}
- (IBAction)hanleButtonAction:(id)sender {
    NSString *string1 = [NSString stringWithFormat:@"%@", self.first.text];
    int valu1 = [string1 intValue];
    NSString *string2 = [NSString stringWithFormat:@"%@", self.second.text];
    int valu2 = [string2 intValue];
    NSString *sum = [NSString stringWithFormat:@"%d", valu1 + valu2];
    self.sum.text = sum;
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
    [_first release];
    [_second release];
    [_sum release];
    [super dealloc];
}
@end
