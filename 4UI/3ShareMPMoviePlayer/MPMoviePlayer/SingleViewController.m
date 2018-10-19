//
//  SingleViewController.m
//  MPMoviePlayer
//
//  Created by lanouhn on 15/12/8.
//  Copyright (c) 2015年 王硕. All rights reserved.
//

#import "SingleViewController.h"
#import <MediaPlayer/MediaPlayer.h> //导入框架
@interface SingleViewController ()
@property (nonatomic, retain) MPMoviePlayerController *moviePlayer;//把播放器设置成属性;
@end

@implementation SingleViewController
//懒加载创建对象
-(MPMoviePlayerController *)moviePlayer {
    if (!_moviePlayer) {
        //创建播放器,并指定一个URL
        self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:@"http://baobab.cdn.wandoujia.com/1447657728675111_x264.mp4"]];
        _moviePlayer.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        [self.view addSubview:_moviePlayer.view];
    }
    return [[_moviePlayer retain] autorelease];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    //播放
    [self.moviePlayer play];
    [self addNotification];
}
//添加通知
- (void)addNotification {
    //注册通知
    NSNotificationCenter *notification = [NSNotificationCenter defaultCenter];
    //检测状态的改变
    [notification addObserver:self selector:@selector(Action1:) name:MPMoviePlayerPlaybackStateDidChangeNotification object:self.moviePlayer];
    //播放结束
    [notification addObserver:self selector:@selector(Action2:) name:MPMoviePlayerPlaybackDidFinishNotification object:self.moviePlayer];
}
- (void)Action1:(NSNotification *)sender {
    if (self.moviePlayer.playbackState == 0) {
        NSLog(@"停止");
    }
    if (self.moviePlayer.playbackState == 1) {
        NSLog(@"播放");
    }
    if (self.moviePlayer.playbackState == 2) {
        NSLog(@"暂停");
    }
}

- (void)Action2:(NSNotification *)sender {
    NSLog(@"播放结束");
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    [self.moviePlayer stop];
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
