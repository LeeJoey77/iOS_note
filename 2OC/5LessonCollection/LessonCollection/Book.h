//
//  Book.h
//  LessonCollection
//
//  Created by lanouhn on 15/10/20.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject
{
    NSString *_name;
    CGFloat _price;
}

//setter
- (void)setName:(NSString *)name;
- (void)setPrice:(CGFloat)price;

//getter
- (NSString *)name;
- (CGFloat)price;

//自定义初始化
- (id)initWithName:(NSString *)name price:(CGFloat)price;

//便利构造器
+ (id)bookWithName:(NSString *)name price:(CGFloat)price;
@end
