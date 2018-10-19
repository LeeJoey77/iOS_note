//
//  EditViewController.m
//  ShareStoryBoard
//
//  Created by lanouhn on 15/12/25.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nameTextField.textColor = [UIColor redColor];
    self.nameTextField.text = self.oldName;
}
- (IBAction)handleButtonAction:(UIButton *)sender {
    if (self.changedName) {
        self.changedName(self.nameTextField.text);
    }
    //返回上个界面
    [self.navigationController popToRootViewControllerAnimated:YES];
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
