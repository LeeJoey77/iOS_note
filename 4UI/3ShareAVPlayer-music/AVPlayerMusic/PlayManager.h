//
//  PlayManager.h
//  AVPlayerMusic
//
//  Created by lanouhn on 15/12/19.
//  Copyright (c) 2015年 王硕. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

typedef void(^NewProgress)(float newProgress);

@interface PlayManager : NSObject
//播放器
@property (nonatomic,strong)AVPlayer *player;
//一个item对应得就是一个资源
@property(nonatomic,strong)AVPlayerItem *playerItem;
//资源数组
@property (nonatomic,strong)NSMutableArray *dataArr;
//资源在数组中的下标
@property (nonatomic,assign)NSInteger musicIndex;
//总时长
@property (nonatomic,assign)NSInteger totalMovieTime;

+ (id)shareInstance;
//播放
- (void)playerPlay;
//切换歌曲并播放
- (void)giveUrl;

- (void)addObserverAction;//添加观察者，主要是获取总时间和状态
- (void)jianCeJinDu:(NewProgress)newProgress;//检测进度


- (void)shangYiShouMusic;
- (void)nextMusic;
@end
