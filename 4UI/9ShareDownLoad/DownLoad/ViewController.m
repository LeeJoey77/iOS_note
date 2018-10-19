//
//  ViewController.m
//  DownLoad
//
//  Created by lanouhn on 16/1/13.
//  Copyright © 2016年 lanouhn0. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *aLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)handleButtonAction:(UIButton *)sender {
    //沙盒路径
    NSLog(@"%@", NSHomeDirectory());
    
    //创建一个request
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://v.jxvdy.com/sendfile/7q0n7zhXrqH0XQ17z9mh-jAgRP-fIkqlHFMxOzYQoK7XXJx5YxHamlCSyEs1QVMMnUMCNYrrdyT1HDPa3FADRX-MareIXw"]];
    //创建下载路径,可以选document/library/cache
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    //拼接文件的路径
    //  download/cache 若用以下第一个方法得到路径为download/cache123.mp4 不是正确路径
    //第二种download/cache/123.mp4
    //NSString *mvPath = [cachePath stringByAppendingString:@"123.mp4"];
    NSString *mvPath = [cachePath stringByAppendingPathComponent:@"123.mp4"];
    
    //1.创建请求操作对象
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    //2.指定下载存储位置
    //参数:1.路径 2.是否从头下载
    operation.outputStream = [[NSOutputStream alloc] initToFileAtPath:mvPath append:NO];
    //下载时,监测进度
    [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        //一个文件下载要分很多步
        //参数1:每次下载的字节数
        //参数2:某一时刻下载总字节数
        //参数3:要下载文件的总字节数
        self.aLabel.text = [NSString stringWithFormat:@"%.2f%%", (float)totalBytesRead / totalBytesExpectedToRead * 100];
    }];
    //下载完成
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"下载成功");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"下载失败");
    }];
    //3.进行下载
    [operation start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
