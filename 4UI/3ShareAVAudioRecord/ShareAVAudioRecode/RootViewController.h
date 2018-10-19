//
//  RootViewController.h
//  ShareAVAudioRecode
//
//  Created by lanouhn on 15/12/24.
//  Copyright (c) 2015年 赵永闯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface RootViewController : UIViewController

{
    AVAudioRecorder *recorder;
    NSTimer *timer;
    NSURL *urlPlay;
}

@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *playBtn;
@property (nonatomic, strong) AVAudioPlayer *avPlay; //播放短的音效.播放本地的





@end
