//
//  FriendTableViewController.m
//  ShareStoryBoard
//
//  Created by lanouhn on 15/12/25.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "FriendTableViewController.h"
#import "OneTableViewCell.h"
#import "TwoTableViewCell.h"

@interface FriendTableViewController ()
//图片数据源
@property (nonatomic, strong) NSMutableArray *imageDataSource;
@property (nonatomic, strong) NSMutableArray *nameDataSource;
@property (nonatomic, strong) NSMutableArray *signatureDataSource;
@end

@implementation FriendTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    
    //storyboard不用注册Cell!!!!!, XIB需要注册

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageDataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 1) {
        OneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell111" forIndexPath:indexPath];
        cell.headerImageView.image = self.imageDataSource[indexPath.row];
        cell.nameLabel.text = self.nameDataSource[indexPath.row];
        cell.signatureLabel.text = self.signatureDataSource[indexPath.row];
        return cell;

    }else {
        TwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell222" forIndexPath:indexPath];
        cell.twoHeaderImage.image = self.imageDataSource[indexPath.row];
        cell.twoNameLabel.text = self.nameDataSource[indexPath.row];
        cell.twoSignatureLabel.text = self.signatureDataSource[indexPath.row];
        return cell;

    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        //参数:1.标示符 2.要点击的控件
        [self performSegueWithIdentifier:@"segue1" sender:[self.tableView cellForRowAtIndexPath:indexPath]];
    }else {
        [self performSegueWithIdentifier:@"segue2" sender:[self.tableView cellForRowAtIndexPath:indexPath]];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
