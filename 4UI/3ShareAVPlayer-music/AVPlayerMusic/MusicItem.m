//
//  MusicItem.m
//  AVPlayerMusic
//
//  Created by lanouhn on 15/12/19.
//  Copyright (c) 2015年 王硕. All rights reserved.
//

#import "MusicItem.h"

@implementation MusicItem
- (id)initWithMusicName:(NSString *)musicName withMusicURL:(NSString *)musicURL{
    self = [super init];
    if (self) {
        self.musicName = musicName;
        self.musicURL = musicURL;
    }
    return self;
}
+ (id)itemWithMusicName:(NSString *)musicName withMusicURL:(NSString *)musicURL{
    return [[MusicItem alloc]initWithMusicName:musicName withMusicURL:musicURL];
}
@end
