//
//  PlayManager.m
//  AVPlayerMusic
//
//  Created by lanouhn on 15/12/19.
//  Copyright (c) 2015年 王硕. All rights reserved.
//

#import "PlayManager.h"
#import "MusicItem.h"
@implementation PlayManager
+ (id)shareInstance{
    static PlayManager *playManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        playManager = [[PlayManager alloc]init];
    });
    return playManager;
}

//播放器懒加载
- (AVPlayer *)player{
    if (!_player) {
        self.player = [[AVPlayer alloc]initWithPlayerItem:self.playerItem];
        //通知,音频播放结束触发的方法
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieDidAction:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    }
    return _player;
}

//添加观察者。总时长，播放状态
- (void)addObserverAction{
    //观察播放时长
    [self.player addObserver:self forKeyPath:@"currentItem.duration" options:NSKeyValueObservingOptionNew |  NSKeyValueObservingOptionOld context:nil];
    //观察播放状态
    [self.player addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
}

//观察者触发的方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    AVPlayer *player = (AVPlayer *)object;
    //播放状态
    if ([keyPath isEqualToString:@"status"]) {
        if (player.status == AVPlayerStatusReadyToPlay) {
            NSLog(@"可以播放了");
        }else if (player.status == AVPlayerStatusFailed) {
            NSLog(@"播放失败");
        }
    }
    //总时长
    if ([keyPath isEqualToString:@"currentItem.duration"]) {
        //
        if (player.currentItem.duration.timescale != 0) {
            //得到总时长， value / timescale 就是秒数
            self.totalMovieTime = player.currentItem.duration.value / player.currentItem.duration.timescale;
            
        }
    }
}


//进度检测
- (void)jianCeJinDu:(NewProgress)newProgress
{
    //括号内部两个参数，(参数1 / 参数2) 就代表多少秒
    CMTime interval = CMTimeMakeWithSeconds(1, 1);
    //通过atime就可以控制多少秒执行一次block；参数queue是线程，如果为NULL即为主线程；
    [self.player addPeriodicTimeObserverForInterval:interval queue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) usingBlock:^(CMTime time) {
        
        //当前的时间（秒）
        float currentTime = time.value / time.timescale;
        //回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"%f",currentTime);
            //通过block回调到控制器中刷新进度条
            NSLog(@"%f", currentTime / self.totalMovieTime);
            newProgress(currentTime / self.totalMovieTime);
        });
    }];
}

- (void)playerPlay{
    //播放
    if (self.player) {
        [self.player play];
//        [self.player pause];
    }
}
- (void)giveUrl{
    //从资源数组中得到对应的模型
    MusicItem *tempItem = [self.dataArr objectAtIndex:self.musicIndex];
    //通过模型去封装AVItem
    self.playerItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:tempItem.musicURL ]];
    //http://luoo-mp3.kssws.ks-cdn.com/high/chinese/20160112.mp3
    //http://image.kaolafm.net/mz/audios/201511/81e34fd0-d723-469b-964e-1e03619e990c.mp3
    NSLog(@"%@", tempItem.musicURL);
    //更改播放器的播放资源
    [self.player replaceCurrentItemWithPlayerItem:self.playerItem];
    
    [self playerPlay];
}

- (void)movieDidAction:(NSNotification *)sender{
    NSLog(@"播放结束");
}

- (void)shangYiShouMusic{
    if (self.musicIndex == 0) {
        NSLog(@"第一首了");
        [self giveUrl];
        
    }else{
        self.musicIndex--;
        [self giveUrl];
        
    }
}
- (void)nextMusic{
    if (self.musicIndex == self.dataArr.count-1) {
        NSLog(@"最后一首了");
        
    }else{
        self.musicIndex++;
        [self giveUrl];
    }
}
@end
