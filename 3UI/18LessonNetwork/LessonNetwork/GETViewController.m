//
//  GETViewController.m
//  LessonNetwork
//
//  Created by lanouhn on 15/11/25.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "GETViewController.h"
#import "GetViewCell.h"
#import "Business.h"
@interface GETViewController () <NSURLConnectionDataDelegate>
@property (nonatomic, retain) NSMutableArray *dataSource;//存储所有的商户信息
@property (nonatomic, retain) NSMutableData *data;//存储数据
@property (nonatomic, retain) NSURLConnection *connection;//存储连接对象

@end

@implementation GETViewController

- (void)dealloc
{
    self.connection = nil;
    self.data = nil;
    self.dataSource = nil;
    [super dealloc];
}

//懒加载,为数组开辟空间
- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        self.dataSource = [NSMutableArray arrayWithCapacity:1];
        //或self.dataSource = [@[] mutableCopy];
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

//同步连接和异步连接的区别:
//1.同步连接是由<主线程>完成网络请求的任务,在数据请求完毕之前,用户所有的交互事件无法处理,会造成程序的卡顿现象,影响用户体验
//2.异步联接,<系统默认开辟子线程>完成网络请求的任务,主线程依然处理用户交互,所以用户的交互事件可以及时得到处理,操作流畅,用户体验较好(采用以空间换时间的策略)

#pragma mark --- GET请求,同步连接
- (IBAction)handleSynButtonAction:(id)sender {
    //1.创建网址字符串对象
    NSString *urlStr = [NSString stringWithFormat:@"http://api.map.baidu.com/place/v2/search?query=%@&region=%@&output=json&ak=6E823f587c95f0148c19993539b99295", @"大保健", @"郑州"];
    //2.如果网址中有中文,需要进行URLEncode
    NSString *newURLStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //3.创建NSURL对象
    NSURL *url = [NSURL URLWithString:newURLStr];
    //4.创建请求对象(NSURLRequest)
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
   
    
    //5.同步连接
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //解析
    [self parseDataWithNSData:data];
}

#pragma mark --- GET请求,异步连接
- (IBAction)handleUNSynButtonAction:(id)sender {
    //1.创建网址字符串对象
    NSString *urlStr = [NSString stringWithFormat:@"http://api.map.baidu.com/place/v2/search?query=%@&region=%@&output=json&ak=6E823f587c95f0148c19993539b99295", @"大保健", @"郑州"];
    //2.如果网址中有中文,需要进行URLEncode
    NSString *newURLStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //3.创建NSURL对象
    NSURL *url = [NSURL URLWithString:newURLStr];
    //4.创建请求对象(NSURLRequest)
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
   
    
    //5.异步连接
    //(1)Block方式
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        //解析
//        [self parseDataWithNSData:data];
//    }];
    
    //(2)协议和代理<NSURLConnectionDataDelegate>
    //返回值为NSURLConnection类型
    self.connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //异步连接协议和代理方式:当将要离开该界面时,让连接中断,停止网络请求
    [self.connection cancel];//取消网络连接
}

#pragma mark --- NSURLConnectionDataDelegate
//当收到服务器响应时触发
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    //当收到服务器响应时开辟空间
    self.data = [NSMutableData data];
}

//当收到服务器传输的数据时触发(可能会触发多次)
//当传输的数据比较大时,服务器并不会将所有的数据全部传输过来,可能每次传输一部分,每一次传输该方法都会触发
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    //当收到数据时拼接数据
    [self.data appendData:data];
}

//当接受到服务器传输数据结束之后触发
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //解析
    [self parseDataWithNSData:self.data];
}

//当请求失败后触发
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"%@", error);
}

#pragma mark --- 解析
- (void)parseDataWithNSData:(NSData *)data {
    NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];//options预留参数
    NSLog(@"%@", dic);
    NSArray *dataArr = dic[@"results"];
    //遍历数组,将内层数据封装成Model对象
    for (NSDictionary *tempDic in dataArr) {
        Business *bussiness = [[Business alloc] init];
       
        //(1)使用字典赋值
//        bussiness.name = tempDic[@"name"];
//        bussiness.address = tempDic[@"address"];
//        bussiness.telephone = tempDic[@"telephone"];
        
        //(2)使用KVC进行赋值(如果key和属性名不同,会自动调用setValue:(id)value forUndefinedKey 方法
        [bussiness setValuesForKeysWithDictionary:tempDic];
        
        //添加到dataSource
        [self.dataSource addObject:bussiness];
        [bussiness release];
    }
    //刷新界面
    [self.tableView reloadData];
    
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GetViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseGET" forIndexPath:indexPath];
    
    //给cell赋值
    //(1)直接给cell赋值
//    cell.firstLabel.text = ((Business *)self.dataSource[indexPath.row]).name;
//    cell.secondLabel.text = ((Business *)self.dataSource[indexPath.row]).address;
//    cell.thirdLabel.text = ((Business *)self.dataSource[indexPath.row]).telephone;
    
    
    //(2)根据Model属性给cell赋值(将business定义为cell的属性,调用setter方法)
//    cell.business = self.dataSource[indexPath.row];
    
    
    //(3)使用cell的给自身控件赋值的方法
    [cell configureCellWithModel:self.dataSource[indexPath.row]];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
