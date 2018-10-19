//
//  RootViewController.m
//  TuWenDemo
//
//  Created by TongLi on 15/12/16.
//  Copyright © 2015年 lanouhn. All rights reserved.
//

#import "RootViewController.h"
#import "NetManager.h"
#import "TuWenItem.h"
#import "RootTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface RootViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSMutableArray *dataSourceArr;
@property (nonatomic,strong)UITableView *tuWenTableView;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化一个数据源数组，可以用懒加载方法
    self.dataSourceArr = [NSMutableArray array];
    
    
    self.tuWenTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tuWenTableView.dataSource = self;
    self.tuWenTableView.delegate = self;
    [self.view addSubview:self.tuWenTableView];
    
    //数据请求
    [NetManager getRequestWithURL:@"https://chanyouji.com/api/trips/166684.json" withContentType:nil withSuccessResult:^(id successResult) {
        
        //解析封装模型
        NSLog(@"请求成功");
        [self jiexiAction:successResult];
        
    } withError:^(NSError *errorResult) {
        NSLog(@"%@",errorResult);
    }];
    
}

- (void)jiexiAction:(id)result{
    NSArray *trip_days = [result objectForKey:@"trip_days"];
    for (NSDictionary *tempTrip_day in trip_days) {
        NSArray *nodes = [tempTrip_day objectForKey:@"nodes"];
        for (NSDictionary *tempNode in nodes) {
            NSArray *notes = [tempNode objectForKey:@"notes"];
            for (NSDictionary *tempNote in notes) {
                //利用遍历构造器封装模型
                TuWenItem *tuwenItem = [TuWenItem itemWithContentStr:[tempNote objectForKey:@"description"] withPhotoInfo:[tempNote objectForKey:@"photo"]];
                //添加到数组中
                [self.dataSourceArr addObject:tuwenItem];
                
            }
        }
    }
    
    //刷新tableView
    [self.tuWenTableView reloadData];
    
}

- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *indentifier = @"indentifier";
    RootTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
        cell = [[RootTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    //赋值
    //得到对应的item
    TuWenItem *tempItem = [self.dataSourceArr objectAtIndex:indexPath.row];
    //文字
    if (![tempItem.contentStr isEqualToString:@""]) {
        cell.contentLabel.text = tempItem.contentStr;
        //修改一下label的frame
        cell.contentLabel.frame = CGRectMake(0, 0, self.view.bounds.size.width, [self heightWithWord:tempItem.contentStr withSize:CGSizeMake(self.view.bounds.size.width, 9999) withFont:13]);
    }else{
        cell.contentLabel.text = nil;
        cell.contentLabel.frame = CGRectMake(0, 0, self.view.bounds.size.width, 0);
    }
    //图片
    if (tempItem.photoInfo != nil) {
        [cell.photoView sd_setImageWithURL:[tempItem.photoInfo objectForKey:@"url"]];
        //修改图片的frame
        cell.photoView.frame = CGRectMake(0, CGRectGetMaxY(cell.contentLabel.frame), self.view.bounds.size.width, [self heightWithPhotoInfo:tempItem.photoInfo]);
    }else{
        cell.photoView.image = nil;
        cell.photoView.frame = CGRectMake(0, 0, 0, 0);
    }
    
    return cell;
}

//行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //文字的高度
    CGFloat wordHeight = 0.0;
    //图片的高度
    CGFloat photoHeight = 0.0;
    //得到对应的item
    TuWenItem *tempItem = [self.dataSourceArr objectAtIndex:indexPath.row];

    if (![tempItem.contentStr isEqualToString:@""]) {
        //计算出了文字高度
        wordHeight = [self heightWithWord:tempItem.contentStr withSize:CGSizeMake(self.view.bounds.size.width, 9999) withFont:13];
    }
    //计算出图片的高度
    if (tempItem.photoInfo != nil) {
        photoHeight = [self heightWithPhotoInfo:tempItem.photoInfo];
    }
    //返回 文字高 + 图片高
    return wordHeight + photoHeight +5;
    
}

//计算出文字的高度
//- (CGFloat)changeLabelHeightByText:(NSString *)words withSize:(CGSize)maxSize withFont:(CGFloat)font {
//    _label.numberOfLines = 0;
//    _label.text = words;
//    CGSize maximumLabelSize = maxSize;//labelsize的最大值
//    _label.font = [UIFont systemFontOfSize:font];
//    //关键语句
//    CGSize expectSize = [_label sizeThatFits:maximumLabelSize];
//    
//    return expectSize.height;
//}

//计算出文字的高度
- (CGFloat )heightWithWord:(NSString *)words withSize:(CGSize )wordSize withFont:(CGFloat )font{
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:font]};
    
    CGSize sizeForHeight = [words boundingRectWithSize:wordSize options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    
    return sizeForHeight.height;
    
}

//图片的高度
- (CGFloat)heightWithPhotoInfo:(NSDictionary *)photoInfo{
    //首先得到原始图片的大小
    CGFloat width1 = [[photoInfo objectForKey:@"image_width"] floatValue];
    CGFloat height1 = [[photoInfo objectForKey:@"image_height"] floatValue];
    return  height1 * self.view.bounds.size.width / width1 ;
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
