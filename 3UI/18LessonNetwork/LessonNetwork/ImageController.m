//
//  ImageController.m
//  LessonNetwork
//
//  Created by lanouhn on 15/11/25.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "ImageController.h"
#import "ASProgressPopUpView.h"//进度条第三方

@interface ImageController () <NSURLConnectionDataDelegate>
@property (nonatomic, retain) NSMutableData *data;//存储数据
@property (nonatomic, assign) NSInteger totalLength;//存储数据的总长度
@property (nonatomic, retain) ASProgressPopUpView *progressView;//进度条
@end

@implementation ImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建进度条
    self.progressView = [[ASProgressPopUpView alloc] initWithFrame:CGRectMake(20, 100, 280, 0)];
    self.progressView.font = [UIFont fontWithName:@"AlNile" size:15];
    self.progressView.popUpViewAnimatedColors = @[[UIColor redColor], [UIColor orangeColor], [UIColor greenColor]];//颜色
    [self.progressView showPopUpViewAnimated:YES];//是否显示进度条动画框
    //添加到父视图
    [self.view addSubview:self.progressView];
}


- (IBAction)handleRequireButtonAction:(id)sender {
    //1.创建网址字符串对象
    NSString *str = [NSString stringWithFormat:@"http://news.china.com/hd/11127798/20151125/20819747.html#photos.jpg"];
    //2.创建NSURL对象
    NSURL *url = [NSURL URLWithString:str];
    //3.创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //同步连接
//    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    self.requireImage.image = [UIImage imageWithData:data];
    
    //异步联接
    //(1)Block 形式
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        self.requireImage.image = [UIImage imageWithData:data];
//    }];
    
    //(2)协议和代理
    [NSURLConnection connectionWithRequest:request delegate:self];

}

#pragma mark --- NSURLConnectionDataDelegate
//当收到服务器响应时触发
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    //获取数据总长度
    self.totalLength = (NSUInteger)response.expectedContentLength;
    //当收到服务器响应时开辟空间
    self.data = [NSMutableData data];
}

//当收到服务器传输的数据时触发(可能会触发多次)
//当传输的数据比较大时,服务器并不会将所有的数据全部传输过来,可能每次传输一部分,每一次传输该方法都会触发
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    //当收到数据时,拼接数据
    [self.data appendData:data];
    
    //调整进度条, self.data 是当前请求到的所有数据
    CGFloat rate = self.data.length * 1.0 / self.totalLength;
    self.progressView.progress = rate;
    self.requireLabel.text = [NSString stringWithFormat:@"进度:%.0f%%", rate * 100];
}

//当接受到服务器传输数据结束之后触发
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //显示图片
    self.requireImage.image = [UIImage imageWithData:self.data];
}

//当请求失败后触发
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"%@", error);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    self.progressView = nil;
    self.data = nil;
    [_requireImage release];
    [_requireLabel release];
    [super dealloc];
}
@end
