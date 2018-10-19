//
//  MusicItem.h
//  AVPlayerMusic
//
//  Created by lanouhn on 15/12/19.
//  Copyright (c) 2015年 王硕. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MusicItem : NSObject
@property (nonatomic,strong)NSString *musicName;
@property (nonatomic,strong)NSString *musicURL;

- (id)initWithMusicName:(NSString *)musicName withMusicURL:(NSString *)musicURL;
+ (id)itemWithMusicName:(NSString *)musicName withMusicURL:(NSString *)musicURL;
@end
