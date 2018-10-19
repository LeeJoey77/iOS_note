//
//  MineViewController.m
//  ShareStoryBoard
//
//  Created by lanouhn on 15/12/25.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "MineViewController.h"
#import "EditViewController.h"

@interface MineViewController ()
@property (weak, nonatomic) IBOutlet UILabel *oldNameLabel;

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"toEditVC"]) {
        //属性传值
        EditViewController *editVC = [segue destinationViewController];
        //属性传值
        editVC.oldName = self.oldNameLabel.text;
        //Block传值
        editVC.changedName = ^(NSString *newName) {
            self.oldNameLabel.text = newName;
        };
    }
    
}


@end
