//
//  RootViewController.m
//  LessonTableView
//
//  Created by lanouhn on 15/11/12.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) NSArray *dataArray;//存储所有联系人
@property (nonatomic, retain) NSDictionary *dataDic;//使用字典存储所有联系人
@property (nonatomic, retain) NSArray *orderedKeys;//存储排好序的key值数组
@end

@implementation RootViewController

- (void)dealloc
{
    self.orderedKeys = nil;
    self.dataDic = nil;
    self.dataArray = nil;
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.    
    //UITabelView 作用:用来以列(只有一列)的形式展示和编辑信息
    //继承自UIScrollView,但是只支持在垂直方向的滚动,由多行组成,每一行都是UITableViewCell类型的对象
    //UITableView由多个分区(相当于班级里的分组)组成,每个分区又是由多行(相当于每个小组中的成员)组成,分区索引和行索引都是从0开始
    //UITableView中的每一行的位置都是由分区和行两个标量进行标识.NSIndexPath类型的对象存储单元格位置
    
     
    //1.创建对象
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    //2.配置属性
    tableView.backgroundColor = [UIColor lightGrayColor];
    //修改cell高度
    tableView.rowHeight = 50;
    //修改分割线的颜色
    tableView.separatorColor = [UIColor blackColor];
    //分割线样式
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    //指定tableView的数据源,让代理提供数据
    tableView.dataSource = self;//系统协议UITableViewDataSource, 代理属性为dataSource
    tableView.delegate = self;//系统协议UITableViewDelegate,  代理属性为delegate
    
    //3.添加到父视图
    [self.view addSubview:tableView];
    //4.释放
    [tableView release];
    
    //初始化数据源
    NSArray *aArray = @[@"安禄山", @"安倍狗", @"安卓", @"安琪儿", @"阿珂"];
    NSArray *bArray = @[@"毕福剑", @"白展堂", @"波波", @"毕加索", @"baby"];
    NSArray *cArray = @[@"陈曦", @"陈坤", @"陈奕迅", @"陈琳"];
    /*
     //(1)大数组存储小数组
     self.dataArray = @[aArray, bArray, cArray];
     */
    
    //(2)字典存储数组
    self.dataDic = @{@"A":aArray, @"B":bArray, @"C":cArray};
    //获取所有的的key值
    NSArray *keys = [self.dataDic allKeys];
    //将key值数组升序排列
    self.orderedKeys = [keys sortedArrayUsingSelector:@selector(compare:)];
    
    //NSIndexPath初始化方法:NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:4];

}

#pragma mark --- UITableViewDataSource协议中的方法
//@optional
//设置tableView分区个数,UITableViewDateSource协议中的方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
/*
    //(1)大数组存储小数组
    return self.dataArray.count;
*/
    
    //(2)字典存储数组
    return self.dataDic.count;
}

//@required,必须实现
//返回每个分区的行数 (UITableViewDataSource协议中的方法)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 /*
    //(1)大数组存储小数组
    return [self.dataArray[section] count];
 */
    
    //(2)字典存储数组
//    if (0 == section) {
//        NSArray *tempArray = self.dataDic[@"A"];
//        return tempArray.count;
//    }else if (1 == section) {
//        NSArray *tempArray = self.dataDic[@"B"];
//        return tempArray.count;
//    }else if (2 == section) {
//        NSArray *tempArray =  self.dataDic[@"C"];//NSDictionary笑笑语法
//        return tempArray.count;
//    }
    
//或
//    //1.从排好序的key值数组中取出对应的key值
//    NSString *key = self.orderedKeys[section];
//    //2.从字典中根据key值取到对应的数组
//    NSArray *tempArray = self.dataDic[key];
//    return tempArray.count;
    
//或
    return [self.dataDic[self.orderedKeys[section]] count];
    
    
//    if (0 == section) {
//        return 7;
//    }else if (1 == section) {
//        return 8;
//    }else {
//        return 14;
//    }
//    return [@[@7, @8, @9][section] integerValue];//NSNumber 转化为NSValue用integerValue

}

//@required,必须实现
//针对于每一行返回对应的Cell (UITableViewDataSource协议中的方法)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //cell重用
    //1.定义重用标识符
    static NSString *reuseIdentifier = @"reuse";//只需创建一次
    //2.根据重用标识符,去重用队列(仓库)中去取用可重用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    //3.判断是否能够成功取到cell
    if (!cell) {
        //4.如果取不到cell,那就创建cell
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier] autorelease];//此时不能直接释放
    }
    
    
    cell.imageView.image = [UIImage imageNamed:@"N~JF]DCWO6TF_Y4`A20MO5D.jpg"];
    NSLog(@"%f", cell.frame.size.height);//44
    //在此处就能够得到一个cell(这个cell可能是创建出来的,也可能是从重用队列中取到cell)
    cell.textLabel.text = self.dataDic[self.orderedKeys[indexPath.section]] [indexPath.row];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;

/*
    //cell不重用
     //数据源为数组
     UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil] autorelease];//此时不能直接释放
     //(1)先获取小数组
     NSArray *tempArray = self.dataArray[indexPath.section];
     //(2)从小数组中取出对应的元素
     NSString *string = tempArray[indexPath.row];
     cell.textLabel.text = string;
     //设置辅助视图
     cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
     return cell;
*/
 
/*
    //数据源为字典
    UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil] autorelease];//此时不能直接释放
    //1.获取key值
    NSString *key = self.orderedKeys[indexPath.section];
    //2.根据key获取对应的小数组
    NSArray *tempArray = self.dataDic[key];
    //3.获取小数组中的对象
    NSString *string = tempArray[indexPath.row];
    //4.让Cell显示数据
    cell.textLabel.text = string;
    //设置辅助视图
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
*/
}

//@optional
//设置分区页眉的title (UITableViewDateSource协议中的方法)
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
/*
    //(1)大数组存储小数组
    return @[@"A", @"B", @"C",][section];
*/
    
    //(2)字典存储数组
    return self.orderedKeys[section];
}

//@optional
//设置右侧索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
//   return @[@"A", @"B", @"C"];

    return self.orderedKeys;
}

#pragma mark --- UITableViewDelegate协议中的方法
//@protocol UITableViewDelegate<NSObject, UIScrollViewDelegate>

//@optional
//被选中时触发
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
}

//@optional
//cell取消选中时触发,UITableViewDelegate协议中的方法
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"取消选中");
}

//@optional
//设置cell的高度,可以根据需求灵活的调整cell的高度,UITableViewDelegate协议中的方法
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"100");
    return 100;
}

//@optional
//设置分区页眉高度的方法,UITableViewDelegate协议中的方法
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {
    return 100;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
