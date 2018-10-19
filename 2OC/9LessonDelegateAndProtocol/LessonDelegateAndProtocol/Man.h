//
//  Man.h
//  LessonDelegateAndProtocol
//
//  Created by lanouhn on 15/10/28.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Woman.h"

@interface Man : NSObject <WomanDelegate>
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *gender;
@property (getter = isAge, nonatomic, assign) NSInteger age;//getter = isAge 对getter方法重命名[man age] = [man isAge]

//自定义初始化
- (id)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age;
//便利构造器
+ (id)manWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age;
@end
