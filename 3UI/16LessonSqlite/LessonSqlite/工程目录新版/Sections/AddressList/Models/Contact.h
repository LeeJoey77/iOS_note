//
//  Contact.h
//  LessonSqlite
//
//  Created by lanouhn on 15/11/23.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIkit.h>
@interface Contact : NSObject
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *age;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, retain) UIImage *image;

//自定义初始化方法
- (id)initWithID:(NSInteger)ID name:(NSString *)name gender:(NSString *)gender age:(NSString *)age phone:(NSString *)phone image:(UIImage *)imgae;

//便利构造器
+ (id)contactWithID:(NSInteger)ID name:(NSString *)name gender:(NSString *)gender age:(NSString *)age phone:(NSString *)phone image:(UIImage *)imgae;

@end
