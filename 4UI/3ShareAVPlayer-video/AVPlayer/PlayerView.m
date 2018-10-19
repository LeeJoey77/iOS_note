//
//  PlayerView.m
//  AVPlayer
//
//  Created by TongLi on 15/11/5.
//  Copyright © 2015年 lanouhn. All rights reserved.
//

#import "PlayerView.h"

@implementation PlayerView

//  重新播放界面的init方法
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blackColor];
        //  添加所有子视图
        [self addAllSubViews];
        
    }
    return self;
}

- (void)layoutSubviews {

//    self.bottomOperationView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 65, [UIScreen mainScreen].bounds.size.width, 65);
    
}

- (void)addAllSubViews{
    //  顶部的操作视图
    self.topOperationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 54)];
    self.topOperationView.backgroundColor = [UIColor redColor];
    self.topOperationView.alpha = 0.69;
    self.topOperationView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self addSubview:_topOperationView];
    //  顶部视图上添加返回按钮
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setBackgroundImage:[UIImage imageNamed:@"播放器_返回"] forState:UIControlStateNormal];
//    self.backButton.backgroundColor = [UIColor redColor];
    self.backButton.frame = CGRectMake(4, 17, 36, 36);
    [self.topOperationView addSubview:self.backButton];
    //  顶部添加movieNameLabel
    self.movieName = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.backButton.frame) + 5, 25, [UIScreen mainScreen].bounds.size.width-90, 21)];
//    self.movieName.backgroundColor = [UIColor redColor];
    self.movieName.text = @"标题";
    self.movieName.textAlignment = NSTextAlignmentCenter;
    self.movieName.font = [UIFont systemFontOfSize:13.0];
    self.movieName.tintColor = [UIColor whiteColor];
    [self.topOperationView addSubview:self.movieName];
    //------------------------------
    //  左面的操作视图
    self.leftOperationView = [[UIView alloc] initWithFrame:CGRectMake(0, (self.bounds.size.height/2)-184/2, 45, 184)];
//    self.leftOperationView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    self.leftOperationView.backgroundColor = [UIColor redColor];
    self.leftOperationView.alpha = 0.69;
    [self addSubview:_leftOperationView];
    //  左面视图添加三个操作按钮
    
    self.shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.shareButton setBackgroundImage:[UIImage imageNamed:@"分享_plyer"] forState:UIControlStateNormal];
//    self.shareButton.backgroundColor = [UIColor redColor];
    self.shareButton.frame = CGRectMake(7, 22, 27, 40);
    [self.leftOperationView addSubview:self.shareButton];
    
    self.colletionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.colletionButton setBackgroundImage:[UIImage imageNamed:@"收藏_plyer"] forState:UIControlStateNormal];
//    self.colletionButton.backgroundColor = [UIColor redColor];
    self.colletionButton.frame = CGRectMake(7, CGRectGetMaxY(self.shareButton.frame) + 10, 27, 40);
    [self.leftOperationView addSubview:self.colletionButton];
    
    self.saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.saveButton setBackgroundImage:[UIImage imageNamed:@"缓存_plyer"] forState:UIControlStateNormal];
//    self.saveButton.backgroundColor = [UIColor redColor];
    self.saveButton.frame = CGRectMake(7, CGRectGetMaxY(self.colletionButton.frame) + 10, 27, 40);
    [self.leftOperationView addSubview:self.saveButton];

    //------------------------------
    //  右面的操作视图
    self.rightOperationView = [[UIView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 45, (self.bounds.size.height/2)-184/2, 45, 185)];
    self.rightOperationView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    self.rightOperationView.backgroundColor = [UIColor redColor];
    self.rightOperationView.alpha = 0.69;
    [self addSubview:_rightOperationView];
    //  右面视图添加两个控件
    //  音量滑杆
    self.voiceSlider = [[UISlider alloc] initWithFrame:CGRectMake(-27, 68, 100, 30)];
    self.voiceSlider.transform = CGAffineTransformRotate(self.voiceSlider.transform, -M_PI_2);
    self.voiceSlider.value = 1.0;
    [self.rightOperationView addSubview:_voiceSlider];
    //  音量图标
    self.voiceImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"播放器_音量"]];
    self.voiceImageView.frame = CGRectMake(13, 143, 19, 19);
    [self.rightOperationView addSubview:_voiceImageView];

    
    //------------------------------
    //  底部的操作视图
    self.bottomOperationView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 65, [UIScreen mainScreen].bounds.size.width, 65)];
    self.bottomOperationView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    self.bottomOperationView.backgroundColor = [UIColor redColor];
    self.bottomOperationView.alpha = 0.69;
    [self addSubview:_bottomOperationView];
    //播放按钮
    self.playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.playButton setBackgroundImage:[UIImage imageNamed:@"播放器_播放"] forState:UIControlStateNormal];
    self.playButton.frame = CGRectMake(23, 35, 24, 24);
//    self.playButton.backgroundColor = [UIColor redColor];
    [self.bottomOperationView addSubview:_playButton];
    //开始时间的label
    self.startTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 9, 48, 21)];
//    self.startTimeLabel.backgroundColor = [UIColor redColor];
    self.startTimeLabel.adjustsFontSizeToFitWidth = YES;
    self.startTimeLabel.text = @"00:00:00";
    self.startTimeLabel.textColor = [UIColor whiteColor];
    [self.bottomOperationView addSubview:_startTimeLabel];
    //结束时间的label
    self.endTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 60, 9, 48, 21)];
    self.endTimeLabel.backgroundColor = [UIColor redColor];
    self.endTimeLabel.textColor = [UIColor whiteColor];
    [self.bottomOperationView addSubview:_endTimeLabel];
    //进度条
    self.progressSlider = [[UISlider alloc] initWithFrame:CGRectMake(66, 5, [UIScreen mainScreen].bounds.size.width-66*2, 31)];
    [self.bottomOperationView addSubview:_progressSlider];
    //下一首按钮
    self.nextMovie = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-80, 35, 60, 30)];
    self.nextMovie.backgroundColor = [UIColor redColor];
    [self.nextMovie setTitle:@"下一个" forState:UIControlStateNormal];
    [self.bottomOperationView addSubview:self.nextMovie];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
