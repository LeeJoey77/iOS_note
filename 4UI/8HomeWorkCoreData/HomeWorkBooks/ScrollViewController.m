//
//  ScrollViewController.m
//  HomeWorkBooks
//
//  Created by lanouhn on 15/12/31.
//  Copyright © 2015年 lanouhn0. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()
@property (weak, nonatomic) IBOutlet UILabel *textLB;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height;

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//滚动视图高度自适应
//当修改约束时,需要在视图加载完成后才能修改,即在viewDidAppear中修改
- (void)viewDidAppear:(BOOL)animated {
    if (CGRectGetMaxY(self.textLB.frame) + 20 < self.view.bounds.size.height) {
        self.height.constant = self.view.bounds.size.height;
    }else {
        self.height.constant = CGRectGetMaxY(self.textLB.frame) + 20;
    }
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
