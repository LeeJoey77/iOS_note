//
//  BookTableViewController.m
//  HomeWorkBooks
//
//  Created by lanouhn on 15/12/31.
//  Copyright © 2015年 lanouhn0. All rights reserved.
//

#import "BookTableViewController.h"

@interface BookTableViewController ()
@property (nonatomic, strong) NSMutableArray *booksDS;
@end

@implementation BookTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化数据源
    self.booksDS = [NSMutableArray array];
    for (Books *books in self.category.includeShip) {
        [self.booksDS addObject:books];
    }
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
    return self.booksDS.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    Books *books = self.booksDS[indexPath.row];
    cell.textLabel.text = books.bookName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@元", books.bookPrice];
    return cell;
}

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
