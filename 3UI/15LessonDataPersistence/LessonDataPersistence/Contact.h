//
//  Contact.h
//  LessonDataPersistence
//
//  Created by lanouhn on 15/11/20.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject <NSCoding>//服从NSCoding协议
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy) NSString *phone;

//自定义初始化
- (instancetype)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age phone:(NSString *)phone;
@end
