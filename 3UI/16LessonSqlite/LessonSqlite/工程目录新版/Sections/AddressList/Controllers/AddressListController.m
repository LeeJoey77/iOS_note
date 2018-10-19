//
//  AddressListController.m
//  LessonSqlite
//
//  Created by lanouhn on 15/11/23.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "AddressListController.h"
#import "DetailViewController.h"
#import "AddViewController.h"
#import "ContactCell.h"
#import "FMDatabase.h"//第三方数据库操作类

@interface AddressListController () <DetailViewControllerDelegate, AddViewControllerDelegate>//代理传值四:

@property (nonatomic, retain) FMDatabase *db;//存储数据库操作对象
@property (nonatomic, retain) NSMutableArray *dataSource;//存储所有的联系人对象
@end

@implementation AddressListController
- (void)dealloc {
    self.db = nil;
    self.dataSource = nil;
    [super dealloc];
}

//懒加载,给数组(容器类)开辟空间,让其指向存储数据的有效空间.(懒加载还可用于给cell加载控件)
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        self.dataSource = [NSMutableArray arrayWithCapacity:1];
    }
    return [[_dataSource retain] autorelease];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //Edit 按钮
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //1.创建数据库
    [self createDataBase];
    //2.创建表
    [self createTableInDataBase];
    //3.读取数据
    [self selectDataFromDataBase];
}

#pragma mark --- handle DataBase
//创建数据库
- (void)createDataBase {
    self.db = [FMDatabase databaseWithPath:[self getDataBasePath]];
}

//获取数据库文件路径
- (NSString *)getDataBasePath {
    //1.获取documents文件夹路径
    NSString *documents = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    //2.拼接上数据文件路径
    NSLog(@"%@", [documents stringByAppendingPathComponent:@"VO.sqlite"]);
    return [documents stringByAppendingPathComponent:@"VO.sqlite"];
}

//创建表
- (void)createTableInDataBase {
    //1.打开数据库
    BOOL isOpen = [self.db open];
    if (!isOpen) {
        return;
    }
    //2.通过SQL语句操作数据库 --- 创建表
    //除了查询时使用executeQuery:, 其余的增, 删, 改等操作都是用executeUpdate:方法
    BOOL isSuccess = [self.db executeUpdate:@"create table if not exists Contact(con_id integer primary key autoincrement, con_name text, con_gender text, con_age text, con_phone text, con_image blob)"];//blob 二进制数据
    NSLog(@"%@", isSuccess ? @"创建表成功" : @"创建表失败");
    //3.关闭数据库
    [self.db close];
}

//从数据库中读取数据,将其封装为Contact对象
- (void)selectDataFromDataBase {
    //插入后再次查询,需要想将数组清空防止重复
    [self.dataSource removeAllObjects];
    //1.打开数据库
    BOOL isOpen = [self.db open];
    if (!isOpen) {
        return;
    }
    //2.通过SQL语句操作数据库 --- 查询所有数据
    FMResultSet *result = [self.db executeQuery:@"select * from Contact"];
    //读取一条数据的每个字段
    while ([result next]) {//当有下一条数据时循环
        NSInteger ID = [result intForColumn:@"con_id"];
        NSString *name = [result stringForColumn:@"con_name"];
        NSString *gender = [result stringForColumn:@"con_gender"];
        NSString *age = [result stringForColumn:@"con_age"];
        NSString *phone = [result stringForColumn:@"con_phone"];
        //图片
        NSData *data = [result dataForColumn:@"con_image"];
        UIImage *image = [UIImage imageWithData:data];
        //将读取到的数据封装成Contact类型的对象,然后存储到数组中
        Contact *contact = [Contact contactWithID:ID name:name gender:gender age:age phone:phone image:image];
        [self.dataSource addObject:contact];
    }
    //3.关闭数据库
    [self.db close];
}

#pragma mark - TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
    //从数组中取出对应的Model(contact)对象, 给cell进行赋值
    Contact *contact = self.dataSource[indexPath.row];
    [cell configureCellWithModel:contact];
    return cell;
}

//提交编辑操作(主要用于删除操作,当页面上的一个cell被删除时触发)
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //1.修改数据源
    //(1)根据ID,移除数据库中的数据
    Contact *contact = self.dataSource[indexPath.row];
    [self deleteDataFromDataBase:contact.ID];
    //(2)从内存中移除
    [self.dataSource removeObjectAtIndex:indexPath.row];
    
    //2.修改界面
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
}

#pragma mark --- 数据库操作
//从数据库中删除一条数据
- (void)deleteDataFromDataBase:(NSInteger)ID {
    //1.打开数据库
    BOOL isOpen = [self.db open];
    if (!isOpen) {
        return;
    }
    //2.通过SQL语句操作数据库 --- 删除一条数据
    NSLog(@"%ld", ID);
    BOOL isD = [self.db executeUpdate:@"delete from Contact where con_id = ?", @(ID)];
    NSLog(@"%@", isD ? @"成功" : @"失败");
    //3.关闭数据库
    [self.db close];
}

//修改一个联系人信息
- (void)updateInDataBase:(Contact *)contact {
    //1.打开数据库
    BOOL isOpen = [self.db open];
    if (!isOpen) {
        return;
    }
    //2.通过SQL语句操作数据库 --- 更新数据库
    NSData *imageData = UIImagePNGRepresentation(contact.image);
    BOOL isSuccess = [self.db executeUpdate:@"update Contact set con_name = ?, con_gender = ?, con_age = ?, con_phone = ?, con_image = ? where con_id = ?", contact.name, contact.gender, contact.age, contact.phone, imageData, @(contact.ID)];
    NSLog(@"%@", isSuccess ? @"更新成功" : @"更新失败");
    //3.关闭数据库
    [self.db close];
}

//往数据库插入一条新的数据
- (void)insertDataInDataBase:(Contact *)contact {
    //1.打开数据库
    BOOL isOpen = [self.db open];
    if (!isOpen) {
        return;
    }
    //2.通过SQL语句操作数据库 --- 更新数据库
    NSData *data = UIImagePNGRepresentation(contact.image);//图片以png格式存储
    BOOL isSuccess = [self.db executeUpdate:@"insert into Contact(con_name, con_gender, con_age, con_phone, con_image) values (?, ?, ?, ?, ?)", contact.name, contact.gender, contact.age, contact.phone, data];
    NSLog(@"%@", isSuccess ? @"更新成功" : @"更新失败");
    [self selectDataFromDataBase];
    //3.关闭数据库
    [self.db close];
}

#pragma mark --- DetailViewControllerDelegate
//(详情)代理传值五:
- (void)modifyContact:(Contact *)con {
    //数据库更新数据
    [self updateInDataBase:con];
}

#pragma mark --- AddViewControllerDelegate
//(添加)代理传值五:
- (void)addContact:(Contact *)contact {
    //1.数据库插入数据
    [self insertDataInDataBase:contact];
    //3.刷新界面
    [self.tableView reloadData];
}

//当通过storyboard进行页面跳转时,该方法就会自动触发,sender为选中的cell
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"add"]) {
        //模态跳转至添加联系人
        AddViewController *addVC = [segue.destinationViewController viewControllers][0];//从联系人列表到添加联系人界面是模态,模态出的控制器放在一个数组中,因为只模态出一个,所以下标为0
        //(添加)代理传值三:
        addVC.delegate = self;
    }else {
        //跳转至详情
        //列表界面跳转至详情界面,sender为选中的cell
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        DetailViewController *detailVC = segue.destinationViewController;
        detailVC.data = self.dataSource[indexPath.row];
        //(详情)代理传值三:
        detailVC.delegate = self;
    }
}

//界面将要展示时刷新数据
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
