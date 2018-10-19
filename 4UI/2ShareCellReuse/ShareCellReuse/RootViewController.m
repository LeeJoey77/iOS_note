//
//  RootViewController.m
//
//  Created by TongLi on 15/10/20.
//  Copyright © 2015年 lanouhn. All rights reserved.
//

#import "RootViewController.h"
#import "RootTableViewCell.h"
#import "Item.h"

@interface RootViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *dataArr;
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化数据源数组
    self.dataArr  = [NSMutableArray array];//便利构造器为数组开辟空间,相当于懒加载
    
    //假设有50个数据
    for (int i = 0; i < 50; i++) {
        //将模型添加数组中
        Item *item = [Item itemWithName:[NSString stringWithFormat:@"%d",i] isDianZan:NO];
        [self.dataArr addObject:item];
    }

    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"indentifier";
    RootTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[RootTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    //找到对应的实例对象
    Item *tempItem = [self.dataArr objectAtIndex:indexPath.row];
    //赋上title
    cell.titleLabel.text = tempItem.name;
    //用cell 的indexPath 给自定义button 的indexOfCell 属性赋值
    cell.dianZan.indexOfCell = indexPath;

    //查看模型是否是点赞的状态
    if (tempItem.isDianZan == NO) {
        //如果不是点赞状态，button的背景设成蓝色
        cell.dianZan.backgroundColor = [UIColor cyanColor];
    }else{
        //如果是点赞状态，button的背景为红色
        cell.dianZan.backgroundColor = [UIColor redColor];
    }
    //点赞按钮的触发方法
      [cell.dianZan addTarget:self action:@selector(dianZanAction:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)dianZanAction:(ButtonOfCell *)sender{
    //可以得到button的index
//    NSLog(@"%@",sender.indexOfCell);
    
    Item *tempItem = [self.dataArr objectAtIndex:sender.indexOfCell.row];
    //反转语句，即如果原来是点赞，那么现在就是取消点赞；如果原来是取消点赞，那么现在就是点赞
    tempItem.isDianZan = !tempItem.isDianZan;
    //通过模型的点赞状态给button赋上颜色
    if (tempItem.isDianZan == YES) {
        sender.backgroundColor = [UIColor redColor];
    }else{
        sender.backgroundColor = [UIColor cyanColor];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
