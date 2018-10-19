//
//  ScrollViewController.m
//  ShareAutoLayout
//
//  Created by lanouhn on 12/28/15.
//  Copyright (c) 2015 hdy. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentHeight;
@property (weak, nonatomic) IBOutlet UILabel *wordLabel;

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    }

//当修改约束时,需要在视图加载完成后才能修改,即在viewDidAppear中修改
- (void)viewDidAppear:(BOOL)animated {
    if (CGRectGetMaxY(self.wordLabel.frame) + 20 < self.view.bounds.size.height) {
        self.contentHeight.constant = self.view.bounds.size.height;
    }else {
    //高度 = label最大y值
        self.contentHeight.constant = CGRectGetMaxY(self.wordLabel.frame) + 20;
    }
    
    //scrollView上不能直接加控件,需要在scrollView上先加一个View充当contentView
    //1.给scrollView添加约束,0000
    //2.给contentView添加约束,0000
    //3.给contentView设置滑动方向
    //4.给contentView设置大小
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

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
