//
//  RootViewController.m
//  ShareMJRefresh_6
//
//  Created by lanouhn on 15/12/16.
//  Copyright (c) 2015年 李杨. All rights reserved.
//

#import "RootViewController.h"
#import "MJRefresh.h"

@interface RootViewController ()

@property (nonatomic, retain) NSMutableArray *array; //数据

@end

@implementation RootViewController

- (NSMutableArray *)array {
    if (!_array) {
        self.array = [NSMutableArray arrayWithCapacity:1];
    }
    return _array;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuse"];
    
    //上拉加载
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self setRefresh];
        //结束加载
        [self.tableView.mj_footer endRefreshing];
        //如果加载完数据.使用:
//        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    }];


    //下拉刷新
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //调用数据
        [self setRefresh];
        //结束刷新
        [self.tableView.mj_header endRefreshing];
    }];

    
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        //调用数据
        [self setRefresh];
        //结束刷新
        [self.tableView.mj_header endRefreshing];
    }];

    //指定header
    self.tableView.mj_header = header;

    //设置刷新时的显示文字 和 显示时的状态
    [header setTitle:@"玩命加载loading中" forState:MJRefreshStatePulling];
    //设置刷新时的动画
    UIImage *image1 = [UIImage imageNamed:@"iconfont-zanzan.png"];
    UIImage *image2 = [UIImage imageNamed:@"iconfont-shijian.png"];
    NSArray *arr = @[image1, image2];
    [header setImages:arr forState:MJRefreshStateRefreshing];
    //设置刷新时显示字体label
//    header.stateLabel.hidden = YES;
    //隐藏刷新时显示时间的Label
    header.lastUpdatedTimeLabel.hidden = YES;

    
}


//刷新数据
- (void)setRefresh {
    //清空数据
    [self.array removeAllObjects];
    
    for (int i = 0; i < arc4random() % (13 - 5 + 1); i++) {
        int a = arc4random() % (30 - 10 + 1) + 10;
        NSString *str = [NSString stringWithFormat:@"%d", a];
        [self.array addObject:str];
    }
    //刷新
    [self.tableView reloadData];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
    
    cell.textLabel.text = self.array[indexPath.row];
    
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
