//
//  TuWenItem.m
//  TuWenDemo
//
//  Created by TongLi on 15/12/16.
//  Copyright © 2015年 lanouhn. All rights reserved.
//

#import "TuWenItem.h"

@implementation TuWenItem
//初始化方法
- (id)initWithContentStr:(NSString *)contentStr withPhotoInfo:(NSMutableDictionary *)photoInfo{
    self = [super init];
    if (self) {
        //给属性赋值
        self.contentStr = contentStr;
        self.photoInfo = photoInfo;
    }
    return self;
}
//遍历构造器
+ (id)itemWithContentStr:(NSString *)contentStr withPhotoInfo:(NSMutableDictionary *)photoInfo{
    
    return [[TuWenItem alloc]initWithContentStr:contentStr withPhotoInfo:photoInfo];
}


@end
