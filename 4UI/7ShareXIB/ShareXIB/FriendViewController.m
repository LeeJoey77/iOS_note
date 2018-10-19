//
//  FriendViewController.m
//  ShareXIB
//
//  Created by lanouhn on 15/12/25.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "FriendViewController.h"
#import "OneTableViewCell.h"
#import "TwoTableViewCell.h"

@interface FriendViewController ()<UITableViewDataSource, UITableViewDelegate>
//图片数据源
@property (nonatomic, strong) NSMutableArray *imageDataSource;
@property (nonatomic, strong) NSMutableArray *nameDataSource;
@property (nonatomic, strong) NSMutableArray *signatureDataSource;

@end

@implementation FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //初始化数据源
    self.imageDataSource = [NSMutableArray arrayWithObjects:
        [UIImage imageNamed:@"A7_CRA5)8}L3][](2HG)ONC.jpg"],
        [UIImage imageNamed:@"1V%2DAM`EG[MP`]Q5S4F5YL.jpg"],
        [UIImage imageNamed:@"MF@ZTFW0DNPE@`}KW3L$WW8.jpg"],
        [UIImage imageNamed:@"094FD``VIF1H0E)(_3TC6DH.jpg"],
        [UIImage imageNamed:@"A7_CRA5)8}L3][](2HG)ONC.jpg"],
        [UIImage imageNamed:@"1V%2DAM`EG[MP`]Q5S4F5YL.jpg"],
        [UIImage imageNamed:@"MF@ZTFW0DNPE@`}KW3L$WW8.jpg"],
        [UIImage imageNamed:@"094FD``VIF1H0E)(_3TC6DH.jpg"],
        [UIImage imageNamed:@"A7_CRA5)8}L3][](2HG)ONC.jpg"],
        [UIImage imageNamed:@"1V%2DAM`EG[MP`]Q5S4F5YL.jpg"],
        [UIImage imageNamed:@"MF@ZTFW0DNPE@`}KW3L$WW8.jpg"],
        [UIImage imageNamed:@"094FD``VIF1H0E)(_3TC6DH.jpg"], nil];
    self.nameDataSource = [NSMutableArray arrayWithObjects:@"star", @"detector", @"fox", @"girl", @"star", @"detector", @"fox", @"girl", @"star", @"detector", @"fox", @"girl", nil];
    self.signatureDataSource = [NSMutableArray arrayWithObjects:@"我的朋友是海绵宝宝", @"真相只有一个", @"我是一只可爱的狐狸", @"沉鱼落雁，闭月羞花", @"我的朋友是海绵宝宝", @"真相只有一个", @"我是一只可爱的狐狸", @"沉鱼落雁，闭月羞花", @"我的朋友是海绵宝宝", @"真相只有一个", @"我是一只可爱的狐狸", @"沉鱼落雁，闭月羞花", nil];
    
    //用XIB注册Cell
    [self.friendTableView registerNib:[UINib nibWithNibName:@"OneTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell111"];
    //注册Cell
    [self.friendTableView registerNib:[UINib nibWithNibName:@"TwoTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell222"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageDataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        //从重用队列里找
        OneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell111" forIndexPath:indexPath];
        cell.imageView.image = self.imageDataSource[indexPath.row];
        cell.nameLabelOneCell.text = self.nameDataSource[indexPath.row];
        cell.signatureLabelOncell.text = self.signatureDataSource[indexPath.row];
        return cell;

    }else {
        TwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell222" forIndexPath:indexPath];
        cell.twoImageView.image = self.imageDataSource[indexPath.row];
        cell.twoNameLabel.text = self.nameDataSource[indexPath.row];
        cell.twoSignatureLabel.text = self.signatureDataSource[indexPath.row];
        return cell;
    }
}
@end
