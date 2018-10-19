//
//  PracticeViewController.m
//  HomeWorkSizeClasses
//
//  Created by lanouhn on 15/12/29.
//  Copyright © 2015年 lanouhn0. All rights reserved.
//

#import "PracticeViewController.h"
#import "ImageTableViewCell.h"

@interface PracticeViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation PracticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //当有导航栏时,加scrollView,会上下滑动,可以在storyboard属性栏,取消勾选Adjust ScrollView Inset,或写以下代码
     self.automaticallyAdjustsScrollViewInsets = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ImageTableViewCell *imageCell = [tableView dequeueReusableCellWithIdentifier:@"reuseCell" forIndexPath:indexPath];
    return imageCell;
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
