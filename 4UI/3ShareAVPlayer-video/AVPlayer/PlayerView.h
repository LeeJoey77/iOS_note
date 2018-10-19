//
//  PlayerView.h
//  AVPlayer
//
//  Created by TongLi on 15/11/5.
//  Copyright © 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerView : UIView


//  自定义播放界面上的上部的操作视图
@property (nonatomic, strong) UIView *topOperationView;
//  自定义播放界面上的返回按钮
@property (nonatomic, strong) UIButton *backButton;
//  自定义播放界面上的电影的title
@property (nonatomic, strong) UILabel *movieName;
//--------------------------------------
//  自定义播放界面上的左部的操作视图
@property (nonatomic, strong) UIView *leftOperationView;
//  分享按钮
@property (nonatomic, strong) UIButton *shareButton;
//  收藏按钮
@property (nonatomic, strong) UIButton *colletionButton;
//  缓存按钮
@property (nonatomic, strong) UIButton *saveButton;
//--------------------------------------
//  自定义播放界面上的右部的操作视图
@property (nonatomic, strong) UIView *rightOperationView;
//  音量slider
@property (nonatomic, strong) UISlider *voiceSlider;
//  音量图标
@property (nonatomic, strong) UIImageView *voiceImageView;


//--------------------------------------
//  自定义播放界面上的底部的操作视图
@property (nonatomic, strong) UIView *bottomOperationView;
//播放按钮
@property (nonatomic, strong) UIButton *playButton;
//  播放进度的slider
@property (nonatomic, strong) UISlider *progressSlider;
//  开始播放的时间的label
@property (nonatomic, strong) UILabel *startTimeLabel;
//  结束播放的时间的label
@property (nonatomic, strong) UILabel *endTimeLabel;
//下一首
@property (nonatomic,strong) UIButton *nextMovie;

@end
