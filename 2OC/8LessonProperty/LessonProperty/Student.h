//
//  Student.h
//  LessonProperty
//
//  Created by lanouhn on 15/10/23.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject <NSCopying>
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *gender;

@property (nonatomic, assign) NSInteger age;
@property (nonatomic, assign) CGFloat score;
//自定义初始化
- (id)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age score:(CGFloat)score;

//便利构造器
+ (id)studentWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age score:(CGFloat)score;

//sayHello
- (NSString *)sayHello;

#warning setMoney:方法,点语法并不识别为 setter 方法,而money 方法会被识别为 getter 方法
- (void)setMoney:(NSInteger)money;


@end
