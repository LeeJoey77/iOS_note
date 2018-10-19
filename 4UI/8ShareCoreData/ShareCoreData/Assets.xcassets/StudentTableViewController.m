//
//  StudentTableViewController.m
//  ShareCoreData
//
//  Created by lanouhn on 15/12/29.
//  Copyright © 2015年 lanouhn0. All rights reserved.
//

#import "StudentTableViewController.h"
#import "Student.h"

@interface StudentTableViewController ()
@property (nonatomic, strong) NSMutableArray *studentDS;
@end

@implementation StudentTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化数据源
    self.studentDS = [NSMutableArray array];
    for (Student *student in self.teacher.studentShip) {
        [self.studentDS addObject:student];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.studentDS.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseCell2" forIndexPath:indexPath];
    Student *student = self.studentDS[indexPath.row];
    cell.textLabel.text = student.studentName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ --- %@", student.studentSex, student.studentAge];
    return cell;
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

}

@end
