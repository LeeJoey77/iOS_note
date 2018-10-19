//
//  ViewController2.m
//  DownLoad
//
//  Created by lanouhn on 16/1/14.
//  Copyright © 2016年 lanouhn0. All rights reserved.
//

#import "ViewController2.h"
#import "AFNetworking.h"

@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UILabel *aLabel;
//button的两种状态
@property (nonatomic, assign) BOOL isDownloading;

@property (nonatomic, strong) AFHTTPRequestOperation *operation;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //沙盒路径
    NSLog(@"%@", NSHomeDirectory());
}

- (IBAction)handleButtonAction:(UIButton *)sender {
    //状态反转
    self.isDownloading = !self.isDownloading;
    if (self.isDownloading == YES) {
        [sender setTitle:@"暂停" forState:UIControlStateNormal];
        //文件管理器, 单例
        NSFileManager *fileManager = [NSFileManager defaultManager];
        //通过文件管理器创建两个文件夹,一个存放未完成的文件,一个存放下载完的文件
        //1.获取沙盒路径
        NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
        //已完成的文件夹路径
        NSString *MVFilePath = [cachePath stringByAppendingPathComponent:@"MV"];//不写.mp4时,生成的是文件夹
        //未完成文件夹路径
        NSString *tempFilePath = [cachePath stringByAppendingPathComponent:@"MVTemp"];
        //判断是否存在已完成的文件夹,如果不存在就创建
        if (![fileManager fileExistsAtPath:MVFilePath]) {
            //创建文件夹
            //参数:1.创建路径 2.是否覆盖
            [fileManager createDirectoryAtPath:MVFilePath withIntermediateDirectories:YES attributes:nil error:nil];
        }
        //创建未完成的文件夹
        if (![fileManager fileExistsAtPath:tempFilePath]) {
            [fileManager createDirectoryAtPath:tempFilePath withIntermediateDirectories:YES attributes:nil error:nil];
        }
        //指定已完成视频的路径
        NSString *mvPath = [MVFilePath stringByAppendingPathComponent:@"123456.mp4"];
        //指定未完成的视频路径
        NSString *tempPath = [tempFilePath stringByAppendingPathComponent:@"123456.tmp"];
        
        //断点文件,存放的是下载进度,以便下次下载时使用
        NSString *breakPoint = [tempFilePath stringByAppendingPathComponent:@"breakPoint.txt"];
        
        
        
        //创建下载url
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://v.jxvdy.com/sendfile/7q0n7zhXrqH0XQ17z9mh-jAgRP-fIkqlHFMxOzYQoK7XXJx5YxHamlCSyEs1QVMMnUMCNYrrdyT1HDPa3FADRX-MareIXw"]];
        
        //断点下载, 核心代码
        //先判读以下是否有未完成视频路径
        long long downLoadBytes = 0;
        if ([fileManager fileExistsAtPath:tempPath]) {
            //有未完成的视频,说明视频没有下载完,继续下载
            //调用方法,计算文件下载了多少
            downLoadBytes = [self fileSizeAtpath:tempPath];
            
            //把downLoadBytes封装到request里
            NSString *range = [NSString stringWithFormat:@"bytes = %llu-", downLoadBytes];
            
            //将request变为可变,封装一个头文件
            NSMutableURLRequest *mutableURLRequest = [request mutableCopy];
            [mutableURLRequest setValue:range forHTTPHeaderField:@"Range"];//从
            
            
            //下边的request是不可变的,封装完再将request变为不可变
            request = mutableURLRequest;
        }
        
        
        //
        //判断沙河中是否存在这个文件
        if (![fileManager fileExistsAtPath:mvPath]) {
            //下载
            //创建请求操作对象
            self.operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
            //指定下载路径
            self.operation.outputStream = [[NSOutputStream alloc] initToFileAtPath:tempPath append:YES];
            //检测进度
            __weak ViewController2 *weakSelf = self;
            [self.operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead)      {
                
                weakSelf.aLabel.text = [NSString stringWithFormat:@"%.2f%%", ((float)totalBytesRead + downLoadBytes)/ (totalBytesExpectedToRead + downLoadBytes) * 100];
                //将进度存到断点文件中
                NSString *progress = [NSString stringWithFormat:@"%.2f%%", ((float)totalBytesRead + downLoadBytes)/ (totalBytesExpectedToRead + downLoadBytes) * 100];
                //把信息写入文件中
                [progress writeToFile:breakPoint atomically:YES encoding:NSUTF8StringEncoding error:nil];
            }];
            //下载成功
            [self.operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"下载成功");
                //把视频从未完成文件夹移到已完成文件夹
                [fileManager moveItemAtPath:tempPath toPath:mvPath error:nil];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"下载失败");
            }];
            
            //开始下载
            [self.operation start];
        }

    }else {
        //暂停状态
        [sender setTitle:@"下载" forState:UIControlStateNormal];
        [self.operation cancel];
        _operation = nil;
    }
}

//计算文件大小
- (long long)fileSizeAtpath:(NSString *)path {
    long long fileSize = 0;//初值
    //判断文件是否存在
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        NSError *error = nil;
        //返回的就是文件的属性
        NSDictionary *dic = [fileManager attributesOfItemAtPath:path error:&error];
        if (dic && !error) {
            //文件大小
            fileSize = [dic fileSize];
        }
    }
    return fileSize;
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
