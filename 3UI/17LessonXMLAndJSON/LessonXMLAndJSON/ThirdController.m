//
//  ThirdController.m
//  LessonXMLAndJSON
//
//  Created by lanouhn on 15/11/24.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "ThirdController.h"
#import "Student.h"
#import "JSONKit.h"
@interface ThirdController ()
@property (nonatomic, retain) NSMutableArray *dataSource;//存储解析得到的所有数据
@end

@implementation ThirdController

- (void)dealloc
{
    self.dataSource = nil;
    [super dealloc];
}
//懒加载
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        self.dataSource = [NSMutableArray arrayWithCapacity:1];
    }
    return [[_dataSource retain] autorelease];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
#pragma mark --- 系统,效率最高
- (IBAction)handleSystemButtonAction:(id)sender {
    //获取文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Student.json" ofType:nil];
    //初始化NSData对象(dataWithContentsOfFile:返回值类型为instancetype,即和方法所在类相同的类型)
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    //解析(JSONObjectWithData 返回值类型为id,根据最外层数据类型确定)
    NSMutableArray *dataArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];//options预留参数
    NSLog(@"%@", dataArr);
    
    for (NSDictionary *dic in dataArr) {
        Student *stu = [[Student alloc] init];//也可用KVC
        stu.name = dic[@"name"];
        stu.gender = dic[@"gender"];
        stu.age = dic[@"age"];
        //添加到dataSource
        [self.dataSource addObject:stu];
        [stu release];
    }
    //刷新界面
    [self.tableView reloadData];
}
#pragma mark --- 第三方
- (IBAction)handleVendorButtonAction:(id)sender {
    //获取文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Student.json" ofType:nil];
    //(1)初始化NSData对象
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *dataArray = [data objectFromJSONData];//第三方中封装的方法,返回值为id类型
    NSLog(@"%@", dataArray);
    //或
    //(2)初始化成NSString对象
    NSString *string = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSArray *array = [string objectFromJSONString];//第三方中封装的方法,返回值为id类型
    NSLog(@"%@", array);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark --- Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseJSCN" forIndexPath:indexPath];
    cell.textLabel.text = ((Student *)self.dataSource[indexPath.row]).name;
    return cell;
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
