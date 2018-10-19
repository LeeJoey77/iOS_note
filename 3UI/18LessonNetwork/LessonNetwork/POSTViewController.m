//
//  POSTViewController.m
//  LessonNetwork
//
//  Created by lanouhn on 15/11/25.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "POSTViewController.h"
#import "Movie.h"
@interface POSTViewController () <NSURLConnectionDataDelegate>
@property (nonatomic, retain) NSMutableArray *dataSource;
@property (nonatomic, retain) NSMutableData *data;
@property (nonatomic, retain) NSURLConnection *connection;
@end

@implementation POSTViewController

- (void)dealloc
{
    self.connection = nil;
    self.data = nil;
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


#pragma mark --- POST请求,同步连接
- (IBAction)handleSynButtonAction:(id)sender {
    //1.创建网址字符串对象
    NSString *str = [NSString stringWithFormat:@"http://api.tudou.com/v3/gw"];
    //2.创建NSURL对象
    NSURL *url = [NSURL URLWithString:str];
   
    //3.创建请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //(1)创建参数字符串
    NSString *pragramStr = [NSString stringWithFormat:@"method=album.channel.get&appKey=myKey&format=json&channel=t&pageNo=1&pageSize=10"];
    //(2)设置请求体(提交的内容)
    NSData *data = [pragramStr dataUsingEncoding:NSUTF8StringEncoding];//转换格式
    [request setHTTPBody:data];
    //(3)设置请求方式
    [request setHTTPMethod:@"POST"];
    
    
    
    //4.创建同步连接
    NSData *tempData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //5.解析
    [self parseDataWithNSData:tempData];
}

#pragma mark --- POST请求,异步连接
- (IBAction)hanleUNSynButtonAction:(id)sender {
    //1.创建网址字符串对象
    NSString *str = [NSString stringWithFormat:@"http://api.tudou.com/v3/gw"];
    //2.创建NSURL对象
    NSURL *url = [NSURL URLWithString:str];
    //3.创建请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //(1)创建参数字符串
    NSString *pragramStr = [NSString stringWithFormat:@"method=album.channel.get&appKey=myKey&format=json&channel=t&pageNo=1&pageSize=10"];
    //(2)设置请求体(提交的内容)
    NSData *data = [pragramStr dataUsingEncoding:NSUTF8StringEncoding];//转换格式
    [request setHTTPBody:data];
    //(3)设置请求方式
    [request setHTTPMethod:@"POST"];
   
    
    //4.创建异步连接
    //(1)Block 方式
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        //解析
//        [self parseDataWithNSData:data];
//    }];
   
    //(2)协议和代理
    self.connection = [NSURLConnection connectionWithRequest:request delegate:self];
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
    //6.解析
    NSMutableDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];//options预留参数
//    NSLog(@"%@", dic);
    NSDictionary *dataDic = dic[@"multiResult"];
    NSArray *tempArr = dataDic[@"results"];
    NSLog(@"%@", tempArr);
    for (NSDictionary *tempDic in tempArr) {
        Movie *movie = [[Movie alloc] init];
        //(1)使用字典赋值
//        bussiness.name = tempDic[@"name"];
//        bussiness.address = tempDic[@"address"];
//        bussiness.telephone = tempDic[@"telephone"];
        
        //(2)使用KVC进行赋值(如果key和属性名不同,会自动调用setValue:(id)value forUndefinedKey 方法
        movie.actorsArr = tempDic[@"actors"];
        movie.area = tempDic[@"area"];
        
        //添加到dataSource
        [self.dataSource addObject:movie];
        [movie release];
    }
    //刷新界面
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
    NSArray *actorsArr = ((Movie *)self.dataSource[indexPath.row]).actorsArr;
    NSLog(@"%@", actorsArr);
    cell.textLabel.text = [actorsArr firstObject];
    cell.detailTextLabel.text = ((Movie *)self.dataSource[indexPath.row]).area;
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
