//
//  TuWenItem.h
//  TuWenDemo
//
//  Created by TongLi on 15/12/16.
//  Copyright © 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TuWenItem : NSObject
//文字
@property (nonatomic,strong)NSString *contentStr;
//图片
@property (nonatomic,strong)NSMutableDictionary *photoInfo;

//初始化方法
- (id)initWithContentStr:(NSString *)contentStr withPhotoInfo:(NSMutableDictionary *)photoInfo;
//遍历构造器
+ (id)itemWithContentStr:(NSString *)contentStr withPhotoInfo:(NSMutableDictionary *)photoInfo;


@end
