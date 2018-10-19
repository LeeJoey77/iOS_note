//
//  RootViewController.m
//  AVPlayerMusic
//
//  Created by lanouhn on 15/12/19.
//  Copyright (c) 2015年 王硕. All rights reserved.
//

#import "RootViewController.h"
#import "MusicItem.h"
#import "NetManager.h"
#import "PlayManager.h"
@interface RootViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UISlider *progressSlider;
@property (nonatomic,strong)NSMutableArray *dataSourceArr;
@property (nonatomic,strong)UITableView *musicTableView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //tableView
    self.dataSourceArr = [NSMutableArray array];
    
    self.musicTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height-100) style:UITableViewStylePlain];
    self.musicTableView.dataSource = self;
    self.musicTableView.delegate = self;
    [self.view addSubview:self.musicTableView];
 
    UIButton *playBu = [[UIButton alloc]initWithFrame:CGRectMake(100, 120, 50, 30)];
    playBu.backgroundColor = [UIColor redColor];
    [playBu setTitle:@"播放" forState:UIControlStateNormal];
    [playBu addTarget:self action:@selector(playBuAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playBu];
    
    UIButton *subBu = [[UIButton alloc]initWithFrame:CGRectMake(10, 120, 70, 30)];
    subBu.backgroundColor = [UIColor cyanColor];
    [subBu setTitle:@"上一首" forState:UIControlStateNormal];
    [subBu addTarget:self action:@selector(subBuAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:subBu];
    
    UIButton *nextBu = [[UIButton alloc]initWithFrame:CGRectMake(200, 120, 70, 30)];
    nextBu.backgroundColor = [UIColor cyanColor];
    [nextBu setTitle:@"下一首" forState:UIControlStateNormal];
    [nextBu addTarget:self action:@selector(nextBuAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBu];
    
    //进度条
    self.progressSlider = [[UISlider alloc] initWithFrame:CGRectMake(66, 70, [UIScreen mainScreen].bounds.size.width-66*2, 31)];
    [self.progressSlider addTarget:self action:@selector(scrubberIsScrolling:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.progressSlider];
    
    //网络请求
    [NetManager getRequestWithURL:@"http://api.kaolafm.com/api/v4/audios/list?sorttype=1&pagesize=20&audioid=1000001985086&installid=00022JmW&udid=93f3f3198330cb75c40cf77841c5d8dd&sessionid=93f3f3198330cb75c40cf77841c5d8dd1446465204385&imsi=460029935502145&operator=1&network=1&timestamp=1446466163&playid=2501499cc2e8e45e4493861b9ceb5aec&sign=171bbffd7b42480b03292d16249373f5&resolution=1080*1920&devicetype=0&channel=A-wandoujia&version=4.2.2&appid=0&" withContentType:nil withSuccessResult:^(id successResult) {
        //解析
        [self jieXiAction:successResult];
    } withError:^(NSError *errorResult) {
        NSLog(@"%@",errorResult);
    }];
    
    
    PlayManager *manger = [PlayManager shareInstance];
    //检测进度，block中就可以刷新进度条
    [manger jianCeJinDu:^(float newProgress) {
        //给进度条赋值
        self.progressSlider.value = newProgress;
    }];
    //添加观察者
    [manger addObserverAction];
}

//解析数据
- (void)jieXiAction:(id)result{
    NSDictionary *resultDic = [result objectForKey:@"result"];
    NSArray *dataListArr = [resultDic objectForKey:@"dataList"];
    for (NSDictionary *tempData in dataListArr) {
        MusicItem *item = [MusicItem itemWithMusicName:[tempData objectForKey:@"audioName"] withMusicURL:[tempData objectForKey:@"mp3PlayUrl"]];
        [self.dataSourceArr addObject:item];
    }
    [self.musicTableView reloadData];
}

- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArr.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *indentifier = @"indentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    
    cell.textLabel.text = [[self.dataSourceArr objectAtIndex:indexPath.row] musicName];
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MusicItem *tempItem = [self.dataSourceArr objectAtIndex:indexPath.row];
    
    PlayManager *manager = [PlayManager shareInstance];
    //将数据数组传到单例中
    manager.dataArr = self.dataSourceArr;
    //将下标传到单例中
    manager.musicIndex = indexPath.row;
    //切换歌曲，并播放
    [manager giveUrl];
}

- (void)playBuAction:(UIButton *)sender {
    PlayManager *mange = [PlayManager shareInstance];
    [mange.player pause];
}
- (void)nextBuAction:(UIButton *)sender{
    PlayManager *mange = [PlayManager shareInstance];
    [mange nextMusic];
}
- (void)subBuAction:(UIButton *)sender{
    PlayManager *mange = [PlayManager shareInstance];
    [mange shangYiShouMusic];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
