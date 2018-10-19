//
//  ListViewController.m
//  sharedUISearchController
//
//  Created by lanouhn on 15/12/3.
//  Copyright (c) 2015年 lanou. All rights reserved.
//

#import "ListViewController.h"


@interface ListViewController () <UISearchResultsUpdating>

@property (nonatomic, retain) NSMutableArray *dataList;//存储数据源
@property (nonatomic, retain) NSMutableArray *searchList;//存储搜索结果

@property (nonatomic, retain) UISearchController *searchController;

@end

@implementation ListViewController

- (void)dealloc {
    self.dataList = nil;
    self.searchList = nil;
    self.searchController = nil;
    [super dealloc];
}

//懒加载(NSArray NSDictionary 等容器类作为属性,需要添加 addObject时,需要懒加载)
- (NSMutableArray *)dataList {
    if (!_dataList) {
        self.dataList = [NSMutableArray arrayWithCapacity:1];
    }
    return [[_dataList retain] autorelease];
}

- (void)readFile {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"contact.plist" ofType:nil];
    NSDictionary *mDic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    for (NSString *key in mDic) {
        NSArray *array = mDic[key];
        for (NSDictionary *dic in array) {
            [self.dataList addObject:dic[@"name"]];
        }
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"通讯录";
    
    [self readFile];
    
    /*
     在iOS 8.0以上版本中, 使用UISearchController来非常方便地在UITableView中添加搜索框. 而在之前版本中, 还是必须使用UISearchBar + UISearchDisplayController的组合方式.
     */
    
    [self configureSearchBar];

    //注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuse"];
    
    
}

//配置搜索框
- (void)configureSearchBar {
    //1.创建搜索控制器对象
    self.searchController = [[[UISearchController alloc] initWithSearchResultsController:nil] autorelease];
    //2.设置显示搜索结果的控制器
    _searchController.searchResultsUpdater = self;
    
    //3.设置搜索时是否显示背景
#warning --------------------------- 显示背景时搜索结果无法点击-------------------------------
    _searchController.dimsBackgroundDuringPresentation = NO;
    
    //4.设置是否隐藏导航条
    _searchController.hidesNavigationBarDuringPresentation = NO;
    //5.设置searchBar位置自适应(适应整个屏幕)
    [_searchController.searchBar sizeToFit];
    //6.设置searchBar的样式
    _searchController.searchBar.searchBarStyle = UISearchBarStyleDefault;
    //7.设置渲染颜色
    _searchController.searchBar.tintColor = [UIColor redColor];
    //8.设置searchBar的状态条颜色
    _searchController.searchBar.barTintColor = [UIColor orangeColor];
    
    //9.显示书签图标, 默认为NO
//    _searchController.searchBar.showsBookmarkButton = NO;
    //10.显示取消按钮,默认为NO
    _searchController.searchBar.showsCancelButton = YES;
    
    
    //设置searchBar为UITableView的页眉视图
    self.tableView.tableHeaderView = self.searchController.searchBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/* 引入UISearchController之后, UITableView的内容也要做相应地变动: 即cell中要呈现的内容是dataList, 还是searchList.
 这一点, 可以通过UISearchController的active属性来判断, 即判断输入框是否处于active状态.
 UITableView相关的很多方法都要根据active来做判断:  */

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (self.searchController.active) {
        return self.searchList.count;
    } else {
        return self.dataList.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
    
    if (self.searchController.active) {
        cell.textLabel.text = self.searchList[indexPath.row];
    } else {
        cell.textLabel.text = self.dataList[indexPath.row];
    }
    
    return cell;
}


/* UISearchController的searchBar中的内容一旦发生变化, 就会调用该方法. 在其中, 我们可以使用NSPredicate来设置搜索过滤的条件. */
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    //如果当前一次数据搜索之后,搜索结果存在数组中,再次搜索还会有,所以删除所有所有
    if (self.searchList != nil) {
        [self.searchList removeAllObjects];
    }
    /*
     NSPredicate 用于指定过滤条件，
     它使用起来有点儿像SQL 的查询条件，主要用于从集合中分拣出符合条件的对象，也可以
     用于字符串的正则匹配。
     */
    NSString *searchString = self.searchController.searchBar.text;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] %@", searchString];
     /*
     self 字符串本身
     @"SELF CONTAINS[cd] ''"   //包含某个字符串
     @"SELF BEGINSWITH[c] ''"     //以某个字符串开头
     @"SELF ENDSWITH[d] ''"      //以某个字符串结束
     */
    
    
    NSArray *array = [self.dataList filteredArrayUsingPredicate:predicate];
    
    self.searchList = [NSMutableArray arrayWithArray:array];
    
    [self.tableView reloadData];
    
}





@end
