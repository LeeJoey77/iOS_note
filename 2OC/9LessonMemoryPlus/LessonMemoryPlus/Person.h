//
//  Person.h
//  LessonMemoryPlus
//
//  Created by lanouhn on 15/10/29.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, retain) NSString *gender;
@property (nonatomic, assign) NSInteger age;

//自定义初始化
- (id)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age;

//便利构造器
+ (id)personWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age;
@end
