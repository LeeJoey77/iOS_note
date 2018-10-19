//
//  TableViewController.m
//  sharedUISearchController
//
//  Created by apple on 16/4/1.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()<UISearchResultsUpdating>
@property(nonatomic,retain)NSMutableArray *items;
@property(nonatomic,retain)UISearchController *searchController;
@property(nonatomic,retain)NSMutableArray *searchResults;//接收数据源结果
@end

@implementation TableViewController

//懒加载
- (NSMutableArray *)items{
    if (!_items) {
        self.items = [NSMutableArray arrayWithCapacity:0];
    }
    return [[_items retain] autorelease];
}
//懒加载
- (NSMutableArray *)searchResults{
    if (!_searchResults) {
        self.searchResults = [NSMutableArray arrayWithCapacity:0];
    }
    return [[_searchResults retain] autorelease];
}

//释放
- (void)dealloc
{
    self.items = nil;
    self.searchResults = nil;
    self.searchController = nil;
    [super dealloc];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //导航栏
    [self p_navigationController];
    
    //调用初始化searchController
    [self setSearchControllerView];
    
    //注册
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
}

- (void)setSearchControllerView {
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    self.searchController.searchBar.frame = CGRectMake(0, 20, 0, 44);
    self.searchController.dimsBackgroundDuringPresentation = NO;
    _searchController.hidesNavigationBarDuringPresentation = NO;

    //搜索栏表头视图
    self.tableView.tableHeaderView = self.searchController.searchBar;
    [self.searchController.searchBar sizeToFit];
    //背景颜色
    self.searchController.searchBar.backgroundColor = [UIColor orangeColor];
    self.searchController.searchResultsUpdater = self;
    
    
}

- (void)p_navigationController{
    self.title = @"小韩哥-英雄列表";
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(handleLeftBarButtonAction:)];
    self.navigationItem.leftBarButtonItem = left;
    
//    self.items = [@[@"国服第一臭豆腐 No.1 Stinky Tofu CN.",
//                            @"比尔吉沃特(Bill Ji walter)",
//                            @"瓦洛兰 Valoran",
//                            @"祖安 Zaun",
//                            @"德玛西亚 Demacia",
//                            @"诺克萨斯 Noxus",
//                            @"艾欧尼亚 Ionia",
//                            @"皮尔特沃夫 Piltover",
//                            @"弗雷尔卓德 Freijord",
//                            @"班德尔城 Bandle City",
//                            @"无畏先锋",
//                            @"战争学院 The Institute of War",
//                            @"巨神峰",
//                            @"雷瑟守备(JustThunder)"] mutableCopy];
    self.items = [@[@"国服第一臭豆腐 No.1",
                    @"比尔吉沃特()",
                    @"瓦洛兰 ",
                    @"祖安 ",
                    @"德玛西亚 ",
                    @"诺克萨斯 ",
                    @"艾欧尼亚 ",
                    @"皮尔特沃夫 ",
                    @"弗雷尔卓德 ",
                    @"班德尔城  ",
                    @"无畏先锋",
                    @"巨神峰",
                    @"雷瑟守备()"] mutableCopy];
}

- (void)handleLeftBarButtonAction:(UIBarButtonItem *)sender {
    self.searchController.active = YES;
    self.searchController.searchBar.text = @"祖安";
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
    if (!self.searchController.active || [self.searchController.searchBar.text isEqualToString:@""]) {
        return self.items.count;
    }else {
        return self.searchResults.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    if (!self.searchController.active || [self.searchController.searchBar.text isEqualToString:@""]) {

        cell.textLabel.text = self.items[indexPath.row];
    }else {
        cell.textLabel.text = self.searchResults[indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!self.searchController.active ) {
        NSLog(@"%ld", indexPath.row);
    }else {
        NSLog(@"$$$$%ld", indexPath.row);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 100  ;
    }else{
        return 80;
    }
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
    [self.searchResults removeAllObjects];
    //NSPredicate 谓词
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"self contains[cd] %@",searchController.searchBar.text];
    self.searchResults = [[self.items filteredArrayUsingPredicate:searchPredicate]mutableCopy];
    //刷新表格
    [self.tableView reloadData];
}

@end
