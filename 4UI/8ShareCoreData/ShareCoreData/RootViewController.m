//
//  RootViewController.m
//  ShareCoreData
//
//  Created by lanouhn on 15/12/29.
//  Copyright © 2015年 lanouhn0. All rights reserved.
//

#import "RootViewController.h"
#import "Teacher.h"
#import "AppDelegate.h"//不能在.h里导入,会产生循环引用
#import "Student.h"
#import "StudentTableViewController.h"
@interface RootViewController ()
//数据源
@property (nonatomic, strong) NSMutableArray *dataSource;
//数据管理器
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数据源
    self.dataSource = [NSMutableArray array];
    //使用appDelegate的数据管理器
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    //得到appDelegate的数据管理器(或属性传值)
    self.managedObjectContext = appDelegate.managedObjectContext;
    //沙盒路径
    NSLog(@"%@", NSHomeDirectory());
    
    
    //coredata --- 查询
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Teacher"];
  
    
    //排序,可以按多个关键字排序
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"teacherCreateDate" ascending:NO];//降序
    //谓词筛选
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"teacherName == '老师-17' or teacherName == '老师-20'"];
//    [request setPredicate:predicate];
    [request setSortDescriptors:@[sort]];
    
    
    //通过请求进行查询
    NSArray *result = [self.managedObjectContext executeFetchRequest:request error:nil];
    //给数据源赋值
    [self.dataSource setArray:result];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseCell1" forIndexPath:indexPath];
    //从数组中找到对应的模型
    Teacher *tempTeacherItem = self.dataSource[indexPath.row];
    cell.textLabel.text = tempTeacherItem.teacherName;
    cell.detailTextLabel.text = [tempTeacherItem.teacherCreateDate description];
    return cell;
}

 /*
//coredata --- 修改
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSDate *newDate = [NSDate date];
    Teacher *teacher = self.dataSource[indexPath.row];
    teacher.teacherCreateDate = newDate;
    //保存到数据库
    [self.managedObjectContext save:nil];
    //刷新UI
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
 }
*/

- (IBAction)addTeacherItem:(UIBarButtonItem *)sender {
    //学生人数
    int studentCount = arc4random() % 20 + 1;

    //coredata --- 插入
    //创建实例变量,并插入到临时数据库
    Teacher *teacherItem = [NSEntityDescription insertNewObjectForEntityForName:@"Teacher" inManagedObjectContext:self.managedObjectContext];
    //给实例变量赋值
    teacherItem.teacherName = [NSString stringWithFormat:@"老师-%d", studentCount];
    teacherItem.teacherCreateDate = [NSDate date];
    //给relationship赋值
    for (int i = 0; i < studentCount; i++) {
        //创建一个学生
        Student *studentItem = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:self.managedObjectContext];
        //给学生的属性赋值
        studentItem.studentName = [NSString stringWithFormat:@"学生_%d", i];
        int stuSex = arc4random() % 2;
        if (stuSex) {
            studentItem.studentSex = @"nan";
        }else {
            studentItem.studentSex = @"nv";
        }
        studentItem.studentAge = @"18";
        //让学生和老师产生关系
        studentItem.teacherShip = teacherItem;
    }
    
    //插入到数据源
    [self.dataSource insertObject:teacherItem atIndex:0];
    //保存到真正的数据库,即存到沙盒中的数据库
    [self.managedObjectContext save:nil];
    //刷新列表
    NSIndexPath *insertIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[insertIndexPath] withRowAnimation:UITableViewRowAnimationLeft];
//    [self.tableView reloadData];//刷新全部数据,耗费资源
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //coredata --- 删除
        //找到要删除的对象
        Teacher *tempTeacherItem = self.dataSource[indexPath.row];
        //从临时数据库中删除
        [self.managedObjectContext deleteObject:tempTeacherItem];
        //从数组中删除
        [self.dataSource removeObject:tempTeacherItem];
        //保存到数据库
        [self.managedObjectContext save:nil];
        //刷新UI
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    StudentTableViewController *studentVC = [segue destinationViewController];
    //得到了对应的indexPath
    NSIndexPath *indexOfCell = [self.tableView indexPathForCell:sender];
    studentVC.teacher = self.dataSource[indexOfCell.row];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
