//
//  RootViewController.m
//  RegularExpression
//
//  Created by lanouhn on 15/12/23.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "RootViewController.h"
#import "AFNetworking.h"

#define URL @"http://m.e-traveltech.com/activity/index/details_new?target_id=32"
@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self requestHtml];
    
}

- (void)requestHtml {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    // 以二进制数据请求数据.
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *html = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        //删除不需要的代码
//        // 去除价格.
//        @"<div.+class=\"face_right\">[\r|\n|\v]+(.+[\r|\n|\v]+){4}";
//        // 去除 "优惠" "现金红包"
//        @"<div.+class=\"header_tips_er\">[\r|\n|\v]+(.+[\r|\n|\v]+){4}";
//        // 去除"下载游迹app"
//        @"<footer[^>]+>[\r|\n|\v]+.+[\r|\n|\v]+<\\/footer>";
        NSString *regex = @"";
        NSRange range = NSMakeRange(0, 0);
        NSString *subStr = @"";
        //正则表达式
        regex = @"<footer[^>]+>[\r|\n|\v]+.+[\r|\n|\v]+<\\/footer>";
        //通过正则搜索字符串中的正则匹配的一段字串,返回一个range
        range = [html rangeOfString:regex options:NSRegularExpressionSearch];
        if (range.length != 0) {
            //截取字串
            subStr = [html substringWithRange:range];
            //在字符串html中找到subStr, 然后用@""替换
            html = [html stringByReplacingOccurrencesOfString:subStr withString:@""];
        }
        [self loadHtml:html];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"请求失败");
    }];
}

- (void)loadHtml:(NSString *)html {
    UIWebView *webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [webView loadHTMLString:html baseURL:[NSURL URLWithString:URL]];
    [self.view addSubview:webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
