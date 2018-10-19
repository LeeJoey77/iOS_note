//
//  RootViewController.m
//  AVPlayer
//
//  Created by TongLi on 15/11/5.
//  Copyright © 2015年 lanouhn. All rights reserved.
//

#import "RootViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "PlayerView.h"

@interface RootViewController ()
//比较底层，不能直接播放视频
@property (nonatomic,strong)AVPlayer *player;
//一个媒体资源管理对象，一个Itme对应一个资源
@property (nonatomic,strong)AVPlayerItem *playItem;
//自定义视频播放界面
@property (nonatomic,strong)PlayerView *playerView;
//是否在播放
@property (nonatomic,assign)BOOL isPlay;
//  保存该视频资源的总时长，快进或快退的时候要用
@property (nonatomic, assign) float totalMovieDuration;
//轻拍是否四个视图消失
@property (nonatomic, assign) BOOL isFirstTap;

@end


@implementation RootViewController
- (void)loadView
{
    //  创建需要显示的视图
    self.playerView = [[PlayerView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.playerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.isPlay = NO;
    //创建一个item,即播放资源
    self.playItem = [AVPlayerItem playerItemWithURL:self.movieURL];
    //创建AVPlayer
    self.player = [AVPlayer playerWithPlayerItem:self.playItem];
    //添加观察者
    [self addObserverAction];
    //检测进度
    [self jianCeJindu];
    
    
    //AVPlay不能直接展示，需要创建一个播放器层AVPlayerLayer展示.播放器层继承于CALayer
    //核心
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    //设置fram
    playerLayer.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    //  这是视屏的填充模式,默认为AVLayerVideoGravityResizeAspect
    playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    //  插入到view的层上面，我没有用addSublayer，因为我想让播放的视图在最下层
    [self.view.layer insertSublayer:playerLayer atIndex:0];
    
    //在通知中心添加观察者，观察是否播放完毕
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(moviePlayDidEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];

    //  播放页面添加轻拍手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissAllSubviews:)];
    [self.view addGestureRecognizer:tap];
    
    //  播放按钮的点击事件
    [self.playerView.playButton addTarget:self action:@selector(playButtonAction:) forControlEvents:UIControlEventTouchUpInside];

    
    //  给音量的滑杆设置事件
    [self.playerView.voiceSlider addTarget:self action:@selector(voiceSliderValueChange:) forControlEvents:UIControlEventValueChanged];
    
    //  给进度的滑杆滑动事件
    [self.playerView.progressSlider addTarget:self action:@selector(scrubberIsScrolling:) forControlEvents:UIControlEventValueChanged];
    // 要离开滑动杆按钮的事件
    [self.playerView.progressSlider addTarget:self action:@selector(touchUpInSide:) forControlEvents:UIControlEventTouchUpInside];
    
    

    [self.playerView.nextMovie addTarget:self action:@selector(nextButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)nextButtonAction:(UIButton *)sender{

    
    self.playItem = [AVPlayerItem playerItemWithURL:[NSURL URLWithString:@"http://61.163.117.26/wvideo.spriteapp.cn/video/2015/0714/55a4be6ab563a_wpd.mp4?wsiphost=local"]];

    [self.player replaceCurrentItemWithPlayerItem:self.playItem];
    
    
}



//添加观察者
- (void)addObserverAction{
    //KVO添加观察者
    //检测总时长
    [_player addObserver:self forKeyPath:@"currentItem.duration" options:(NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld) context:nil];
    
    //检测播放状态
    [_player addObserver:self forKeyPath:@"status" options:(NSKeyValueObservingOptionNew) context:nil];
    //检测缓存
    [_player addObserver:self forKeyPath:@"currentItem.loadedTimeRanges" options:(NSKeyValueObservingOptionNew) context:nil];
}

//检测进度
- (void)jianCeJindu {
    CMTime atime = CMTimeMake(1, 1);
    //检测 currentTime
    __weak typeof(self)weakSelf = self;
    //interval参数为响应的间隔时间，这里设为每秒都响应，queue是队列，传NULL代表在主线程执行。
    [_player addPeriodicTimeObserverForInterval:atime queue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) usingBlock:^(CMTime time) {

        if (time.timescale != 0) {
            
            //当前时间
            float  current11 = time.value/time.timescale;
            NSLog(@"%f 秒", current11);

            //回到主线程刷新界面
            dispatch_async(dispatch_get_main_queue(), ^{
                
                // 进度比 = 当前时间/总时间
                float persent  = current11 /self.totalMovieDuration;
//                NSLog(@"进度比：%f", persent);
                //刷新UI
                weakSelf.playerView.progressSlider.value = persent;

                weakSelf.playerView.startTimeLabel.text = [NSString stringWithFormat:@"%@",[weakSelf convertTime:current11]];

            });
        }
    }];
}

//播放完毕
- (void)moviePlayDidEnd:(NSNotification *)notify
{
    NSLog(@"结束播放");
    //  播放按钮设置成播放图片
    [self.playerView.playButton setBackgroundImage:[UIImage imageNamed:@"播放器_播放"] forState:UIControlStateNormal];

}

//  用于把上面的操作视图动画隐藏
- (void)dismissAllSubviews:(UITapGestureRecognizer *)tap
{

    
    __weak RootViewController *rootVC = self;
    if (!self.isFirstTap) {
        
        [UIView animateWithDuration:.2f animations:^{
            
            rootVC.playerView.topOperationView.frame = CGRectMake(0, -54, self.view.frame.size.width, 54);
            rootVC.playerView.bottomOperationView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 65);
            rootVC.playerView.leftOperationView.frame = CGRectMake(-45, 62, 45, 185);
            rootVC.playerView.rightOperationView.frame = CGRectMake(self.view.frame.size.width, 62, 45, 185);
            rootVC.isFirstTap = YES;
            
        }];
    } else{
        [UIView animateWithDuration:.2f animations:^{
            
            rootVC.playerView.topOperationView.frame = CGRectMake(0, 0, self.view.frame.size.width, 54);
            rootVC.playerView.bottomOperationView.frame = CGRectMake(0, self.view.frame.size.height - 65, self.view.frame.size.width, 65);
            rootVC.playerView.leftOperationView.frame = CGRectMake(0, 62, 45, 185);
            rootVC.playerView.rightOperationView.frame = CGRectMake(self.view.frame.size.width - 45, 62, 45, 185);
            rootVC.isFirstTap = NO;
        }];
        
    }
}







//开始播放
- (void)playButtonAction:(UIButton *)sender{
    if (self.isPlay == YES) {
        [self.player pause];
        [sender setBackgroundImage:[UIImage imageNamed:@"播放器_播放"] forState:UIControlStateNormal];
        self.isPlay = NO;

    }else{
        [self.player play];
        [sender setBackgroundImage:[UIImage imageNamed:@"播放器_暂停"] forState:UIControlStateNormal];
        self.isPlay = YES;
    }

}

#pragma mark 调节音量
- (void)voiceSliderValueChange:(UISlider *)sender
{
    [self.player setVolume:sender.value];
    if (sender.value == 0) {
        self.playerView.voiceImageView.image = [UIImage imageNamed:@"播放器_静音"];
    }else{
        self.playerView.voiceImageView.image = [UIImage imageNamed:@"播放器_音量"];
    }
    
}

#pragma mark 调节进度
- (void)scrubberIsScrolling:(UISlider *)sender {
    //  先暂停
    [self.player pause];
    //  图片切换
    [self.playerView.playButton setBackgroundImage:[UIImage imageNamed:@"播放器_播放"] forState:UIControlStateNormal];
    //计算出现在多少秒了
    float current = (float)(self.totalMovieDuration * sender.value);
    NSLog(@"***现在多少%f 秒，",current);
    CMTime currentTime = CMTimeMake (current, 1);
//    float current11 = currentTime.value/currentTime.timescale;
//    NSLog(@"现在多少%lld秒",currentTime.value/currentTime.timescale);

    //  给avplayer设置进度
    [self.player seekToTime:currentTime completionHandler:^(BOOL finished) {

        self.playerView.startTimeLabel.text = [NSString stringWithFormat:@"%@",[self convertTime:current]];

        if (self.isPlay == YES) {
//            [self.playerView.playButton setBackgroundImage:[UIImage imageNamed:@"播放器_暂停"] forState:UIControlStateNormal];

//            [self.player play];

        }

    }];
    
}

- (void)touchUpInSide:(UISlider *)sender{
    if (self.isPlay == YES) {
        [self.playerView.playButton setBackgroundImage:[UIImage imageNamed:@"播放器_暂停"] forState:UIControlStateNormal];
        [self.player play];
    }
    
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    //
    AVPlayer *player = (AVPlayer *)object;
    //观察状态。看看是否可以播放
    if ([keyPath isEqualToString:@"status"]) {
        if ([player status] == AVPlayerStatusReadyToPlay) {
            NSLog(@"AVPlayerStatusReadyToPlay");

            
        } else if ([player status] == AVPlayerStatusFailed) {
            NSLog(@"AVPlayerStatusFailed");
        }
    }
    
    //总时长
    if ([keyPath isEqualToString:@"currentItem.duration"]) {
        if (player.currentItem.duration.timescale != 0) {
            //总秒数
            self.totalMovieDuration = player.currentItem.duration.value/player.currentItem.duration.timescale;
            
        }
    
    }
    //缓存
    if([keyPath isEqualToString:@"currentItem.loadedTimeRanges"]){
        NSArray *array=self.playItem.loadedTimeRanges;
        
        CMTimeRange timeRange = [array.firstObject CMTimeRangeValue];//本次缓冲时间范围
        float startSeconds = CMTimeGetSeconds(timeRange.start);
        float durationSeconds = CMTimeGetSeconds(timeRange.duration);
        NSTimeInterval totalBuffer = startSeconds + durationSeconds;//缓冲总长度
        NSLog(@"共缓冲：%.2f",totalBuffer);
        //
    }


    
    
}

////转换时间
- (NSString *)convertTime:(float)second{
    int secCount = (int)second;
    
    NSString *tmphh = [NSString stringWithFormat:@"%d",secCount/3600];
    if ([tmphh length] == 1)
    {
        tmphh = [NSString stringWithFormat:@"0%@",tmphh];
    }
    NSString *tmpmm = [NSString stringWithFormat:@"%d",(secCount/60)%60];
    if ([tmpmm length] == 1)
    {
        tmpmm = [NSString stringWithFormat:@"0%@",tmpmm];
    }
    NSString *tmpss = [NSString stringWithFormat:@"%d",secCount%60];
    if ([tmpss length] == 1)
    {
        tmpss = [NSString stringWithFormat:@"0%@",tmpss];
    }
    NSLog(@"%@:%@:%@",tmphh,tmpmm,tmpss);
    NSString *showtimeNew = [NSString stringWithFormat:@"%@:%@:%@",tmphh,tmpmm,tmpss];
    return showtimeNew;
}

//  进入该视图控制器自动横屏进行播放
- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeLeft;
    
}

- (void)dealloc
{
    //  移除观察者,使用观察者模式的时候，记得在不使用的时候，进行移除
    [self removeObserverFromPlayerItem:self.player];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}
-(void)removeObserverFromPlayerItem:(AVPlayer *)player{
    [player removeObserver:self forKeyPath:@"status"];
    [player removeObserver:self forKeyPath:@"currentItem.duration"];
    [player removeObserver:self forKeyPath:@"currentItem.loadedTimeRange"];

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
