//
//  RootViewController.m
//  LessonUITableViewEdit
//
//  Created by lanouhn on 15/11/13.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "RootViewController.h"
#import "UIImage+ScaleImage.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) NSMutableDictionary *contactDic;//存储所有联系人数组
@property (nonatomic, retain) NSMutableArray *orderedKeys;//存储排好序的数组
@end

@implementation RootViewController

- (void)dealloc
{
    self.orderedKeys = nil;
    self.contactDic = nil;
    [super dealloc];
}

//初始化数据源(从本地plist文件中读取数据)
- (void)readDataFromPlist {
    //1.获取本地文件的路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"contact(1)" ofType:@"plist"];//mainBundle单例
//或
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"contact(1).plist" ofType:nil];
    //2.初始化字典对象
    self.contactDic = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    //3.获取所有的key值
    NSArray *allKeys = [self.contactDic allKeys];
    //4.对allKeys数组排序
    NSArray *sortKeys = [allKeys sortedArrayUsingSelector:@selector(compare:)];
    self.orderedKeys = [NSMutableArray arrayWithArray:sortKeys];
}


//重写loadView方法,将tableView指定为视图控制器的根视图
- (void)loadView {
       
    
    //1.创建UITableView对象
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    //指定数据源代理
    tableView.dataSource = self;
    tableView.delegate = self;
    //修改分区索引的颜色
    tableView.sectionIndexColor = [UIColor cyanColor];
    //修改分区索引背景颜色
//    tableView.sectionIndexTrackingBackgroundColor = [UIColor lightGrayColor];
    //2.指定为视图控制器的根视图
    self.view = tableView;
//    self.view.backgroundColor = [UIColor purpleColor];
    //3.释放
    [tableView release];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化数据源
    [self readDataFromPlist];

    [self configureNavigationBarContent];
}


//配置导航条
- (void)configureNavigationBarContent {
    //配置导航条的颜色
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    //配置导航条的背景颜色(毛玻璃之后的视图的颜色)
    self.navigationController.navigationBar.backgroundColor = [UIColor greenColor];
    //配置单个的导航条
    self.navigationItem.title = @"42班通讯录";
    //修改字体大小和颜色(所有的)
    NSDictionary *dic = @{NSForegroundColorAttributeName:[UIColor orangeColor], NSFontAttributeName:[UIFont systemFontOfSize:20]};
    self.navigationController.navigationBar.titleTextAttributes = dic;
    
    
    //在导航条的右边添加Edit按钮
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

//点击Edit按钮触发的方法
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    //让tableView进入编辑状态(此时self.view是tableView)
    [(UITableView *)self.view setEditing:editing animated:YES];
}


#pragma mark --- UITableViewDataSource协议,处理数据
//--------------tableView界面设置(分区, 行数, cell, 页眉, 索引)-----------------------
//@optional
//配置tableView分区个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.contactDic.count;
}

//@required
//配置每个分区的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.contactDic[self.orderedKeys[section]] count];
}

//@required
//返回每一行对应的tableViewCell对象
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //1.创建重用标识符
    static NSString *reuseIdentifier = @"reuse";
    //2.根据重用标识符从重用队列中取用可重用的Cell来使用
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    //3.判断是否能够取到可重用的Cell
    //4.如果没有成功取到Cell, 则创建一个Cell
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier] autorelease];
    }
    //获取存储联系人小字典
    NSArray *perArray = self.contactDic[self.orderedKeys[indexPath.section]];
    NSDictionary *perDic = perArray[indexPath.row];
    //给对应控件进行赋值
    cell.imageView.image = [[UIImage imageNamed:perDic[@"image"]] scaleToSize:CGSizeMake(35, 40)];
    cell.textLabel.text = perDic[@"name"];
    cell.detailTextLabel.text = perDic[@"phoneNumber"];
    return cell;
}

//设置tableView的每个分区的页眉title
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    //若分组无联系人,则无页眉
//    if ([self.contactDic[self.orderedKeys[section]] count] == 0) {
//        return nil;
//    }//如果该分组没有联系人,返回nil
    
    return self.orderedKeys[section];
}

//设置分区索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    //若分组无联系人则无索引
//    NSMutableArray *indexArray = [[NSMutableArray alloc] init];
//    for (int i = 0; i < self.orderedKeys.count; i++) {
//        if ([self.contactDic[self.orderedKeys[i]] count] != 0) {
//            [indexArray addObject:self.orderedKeys[i]];
//        }
//    }
//    return (NSArray *)indexArray;
    
    return self.orderedKeys;
}



//---------------------tableView编辑操作(删除, 插入, 移动)--------------------------

//设置tableView的哪些行可以被编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    return indexPath.section < 4 ? YES : NO;
    return YES;
}

//提交编辑时触发,可在此方法中进行删除, 插入操作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //1.获取key
    NSString *key = self.orderedKeys[indexPath.section];
    //2.获取删除行所在的数组
    NSMutableArray *array = self.contactDic[key];
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //处理删除操作
        //判断是否需要删除一个分区(如果该分区有一行,就删除整个分区,否则是删除一行即可)
        if (1 == array.count) {
            //删除整个分区, 对应分区对应索引会自动删除
            //1.修改数据源
            //(1)从字典中移除元素
            [self.contactDic removeObjectForKey:key];
            //(2)从排好序的key值数组中移除对应的元素
            [self.orderedKeys removeObject:key];
            //2.修改界面,NSIndexSet是集合,集合中的元素有互异性
            NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:indexPath.section];
            [tableView deleteSections:indexSet withRowAnimation:UITableViewRowAnimationRight];
        }else {
            //删除一行
            //1.修改数据源
            [array removeObjectAtIndex:indexPath.row];
            //2.修改界面
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];//第二个参数可以选择动画效果
        }
    }else {
        //处理插入操作
        NSDictionary *dic = @{@"name":@"马云", @"gender":@"男", @"age":@"50", @"phoneNumber":@"11111111111", @"motto":@"哈哈", @"image":@"ws.png"};
        //1.修改数据源9
        [array insertObject:dic atIndex:indexPath.row];
        //2.修改界面
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    }
}


//移动操作
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    //移动操作只需要修改数据源即可
    //1.获取行所在的数组
    NSMutableArray *array = self.contactDic[self.orderedKeys[sourceIndexPath.section]];
    //2.获取对应的数据(要移动的那个人),并且保存
    NSDictionary *dic = [array[sourceIndexPath.row] retain];
    //3.从数组中原有位置将该元素移除
    [array removeObjectAtIndex:sourceIndexPath.row];
    //4.将该元素插入到新的位置
    [array insertObject:dic atIndex:destinationIndexPath.row];
    //5.释放
    [dic release];
}

//设置哪些行可以移动
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.section < 4 ? YES : NO;
}

#pragma mark --- UITableViewDelegate协议,处理界面
////自定义分区页眉
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    if (3 == section) {
//        UIView *headerView = [[UIView alloc] init];
//        headerView.backgroundColor = [UIColor redColor];

//        //在headView上添加视图(Label, textField, Button等)
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 377, 28)];
//        label.backgroundColor = [UIColor greenColor];
//        label.text = @"D分组";
//        [headerView addSubview:label];
//        [label release];

//        return [headerView autorelease];
//    }
//    return nil;
//}

////cell选中之后触发的方法
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//}

////cell取消选中之后触发的方法
//- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//}



//---------------------tableView编辑操作(删除, 插入, 移动)--------------------------

//设置tableView行的编辑样式(插入/删除)
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return indexPath.section < 4 ? UITableViewCellEditingStyleDelete : UITableViewCellEditingStyleInsert;
//}

//设置删除时的确认按钮文字
//- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return @"删除";
//}

//限制cell的跨区移动,当停止拖动时触发
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
    //sourceIndexPath 移动之前Cell的位置
    //proposedDestinationIndexPath Cell想要移动到的位置(propose 建议,计划,打算,求婚)
    if (sourceIndexPath.section == proposedDestinationIndexPath.section) {
        return proposedDestinationIndexPath;
    }else {
        return sourceIndexPath;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
