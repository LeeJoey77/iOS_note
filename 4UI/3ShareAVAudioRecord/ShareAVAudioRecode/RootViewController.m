//
//  RootViewController.m
//  ShareAVAudioRecode
//
//  Created by lanouhn on 15/12/24.
//  Copyright (c) 2015年 赵永闯. All rights reserved.
//

#import "RootViewController.h"
//CGRectMake(72, 232, 73, 43) 录音button
//CGRectMake(214, 232, 73, 43) 播放button
//CGRectMake(130, 80, 107, 128) 图片

@interface RootViewController () <AVAudioRecorderDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //调用录音方法
    [self audio];
    //图片
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(130, 80, 107, 128)];
    self.imageView.layer.cornerRadius = 5;
    _imageView.backgroundColor = [UIColor greenColor];
    _imageView.image = [UIImage imageNamed:@"record_animate_01"];
    [self.view addSubview:self.imageView];
    
    //录音Btn
    self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
    _btn.frame = CGRectMake(72, 232, 73, 43);
    [_btn setTitle:@"录音" forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(btnDown:) forControlEvents:UIControlEventTouchDown];
    [_btn addTarget:self action:@selector(btnUp:) forControlEvents:UIControlEventTouchUpInside];
    [_btn addTarget:self action:@selector(btnDragUp:) forControlEvents:UIControlEventTouchDragExit];
    [self.view addSubview:self.btn];
    
    //播放btn
    self.playBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    _playBtn.frame = CGRectMake(214, 232, 73, 43);
    [_playBtn setTitle:@"播放" forState:UIControlStateNormal];
    [_playBtn addTarget:self action:@selector(playRecordSound:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.playBtn];
}

//实现点击事件
- (void)playRecordSound:(UIButton *)sender {
    if (self.avPlay.playing) {
        [self.avPlay stop];
        [self updateImage];
        return;
    }
    
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:urlPlay error:nil];
    self.avPlay = player;
    [self.avPlay play];
}

//当点击录音的时候判断是否准备好了,准备好了就开始录音
- (void)btnDown:(UIButton *)sender {
//创建录音文件,准备录音
    if ([recorder prepareToRecord]) {
        [recorder record];
    }
    
    //设置定时检测,检测音量的大小
    timer = [NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(detectionVoice) userInfo:nil repeats:YES];
}

//设置录音按钮弹起时触发
- (void)btnUp:(UIButton *)sender {
    //保存当前录音时间
    double cTime = recorder.currentTime;
    if (cTime > 2) {
        NSLog(@"发出去");
    }else  {
        //删除记录的文件
        [recorder deleteRecording];
    }
    [recorder stop]; //停止录音
    [timer invalidate]; //唯一一个让定时器失效的方法
}

//当点着btn向外拉的时候触发的方法,防止误操作
- (void)btnDragUp:(UIButton *)sender {
    //删除录制文件
    [recorder deleteRecording];
    [recorder stop];
    [timer invalidate];
    
}

//配置录音
- (void)audio {
    //录音设置
    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
    //设置录音格式 AVFormatIDKey == kAudioFormatMPEG4AAC
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    //设置录音采样率(Hz) 如:AVSampleRateKey == 8000/44100/96000(影响音频质量)
    [recordSetting setValue:[NSNumber numberWithFloat:44100] forKey:AVSampleRateKey];
    //通道的数目,1单声道 2立体声
    [recordSetting setValue:[NSNumber numberWithInt:1] forKey:AVNumberOfChannelsKey];
    //线性采样位数 8, 16, 24 ,32 默认是16
    [recordSetting setValue:[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
    //录音质量
    [recordSetting setValue:[NSNumber numberWithInt:AVAudioQualityHigh] forKey:AVEncoderAudioQualityKey];
    //将录音放到沙盒中
    NSString *strUrl = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@luyin.aac", strUrl]];
    urlPlay = url;
    
    NSError *error;
    //初始化Recorder对象
    recorder = [[AVAudioRecorder alloc] initWithURL:url settings:recordSetting error:&error];
    //开启音量检测
    recorder.meteringEnabled = YES;
    recorder.delegate = self;
}

- (void)detectionVoice
{
    [recorder updateMeters];//刷新音量数据
    //获取音量的平均值  [recorder averagePowerForChannel:0];
    //音量的最大值  [recorder peakPowerForChannel:0];
    double lowPassResults = pow(10, (0.05 * [recorder peakPowerForChannel:0]));
    NSLog(@"%lf",lowPassResults);
    //最大50  0
    //图片 小-》大
    if (0<lowPassResults<=0.06) {
        [self.imageView setImage:[UIImage imageNamed:@"record_animate_01.png"]];
    }else if (0.06<lowPassResults<=0.13) {
        [self.imageView setImage:[UIImage imageNamed:@"record_animate_02.png"]];
    }else if (0.13<lowPassResults<=0.20) {
        [self.imageView setImage:[UIImage imageNamed:@"record_animate_03.png"]];
    }else if (0.20<lowPassResults<=0.27) {
        [self.imageView setImage:[UIImage imageNamed:@"record_animate_04.png"]];
    }else if (0.27<lowPassResults<=0.34) {
        [self.imageView setImage:[UIImage imageNamed:@"record_animate_05.png"]];
    }else if (0.34<lowPassResults<=0.41) {
        [self.imageView setImage:[UIImage imageNamed:@"record_animate_06.png"]];
    }else if (0.41<lowPassResults<=0.48) {
        [self.imageView setImage:[UIImage imageNamed:@"record_animate_07.png"]];
    }else if (0.48<lowPassResults<=0.55) {
        [self.imageView setImage:[UIImage imageNamed:@"record_animate_08.png"]];
    }else if (0.55<lowPassResults<=0.62) {
        [self.imageView setImage:[UIImage imageNamed:@"record_animate_09.png"]];
    }else if (0.62<lowPassResults<=0.69) {
        [self.imageView setImage:[UIImage imageNamed:@"record_animate_10.png"]];
    }else if (0.69<lowPassResults<=0.76) {
        [self.imageView setImage:[UIImage imageNamed:@"record_animate_11.png"]];
    }else if (0.76<lowPassResults<=0.83) {
        [self.imageView setImage:[UIImage imageNamed:@"record_animate_12.png"]];
    }else if (0.83<lowPassResults<=0.9) {
        [self.imageView setImage:[UIImage imageNamed:@"record_animate_13.png"]];
    }else {
        [self.imageView setImage:[UIImage imageNamed:@"record_animate_14.png"]];
    }
}

//设置刷新图片
- (void)updateImage {
    [self.imageView setImage:[UIImage imageNamed:@"record_animate_01.png"]];
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
