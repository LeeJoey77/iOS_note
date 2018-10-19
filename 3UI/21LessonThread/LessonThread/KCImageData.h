//
//  KCImageData.h
//  LessonThread
//
//  Created by admin on 2018/5/21.
//  Copyright © 2018年 lanouhn0. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCImageData : NSObject

//索引
@property (nonatomic,assign) int index;

//图片数据
@property (nonatomic,strong) NSData *data;

@end
