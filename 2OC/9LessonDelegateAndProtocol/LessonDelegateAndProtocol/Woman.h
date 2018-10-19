//
//  Woman.h
//  LessonDelegateAndProtocol
//
//  Created by lanouhn on 15/10/28.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

//结婚协议
@protocol WomanDelegate <NSObject>

@required
//洗衣
- (void)washClothes;
//做饭
- (void)cook;
//扫地
- (void)cleanHouse;

@optional
//生孩子
- (void)giveBirthToChild;

@end


@interface Woman : NSObject
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *gender;
@property (nonatomic, assign) NSInteger age;


//代理属性
@property (nonatomic, assign) id<WomanDelegate> delegate;


//自定义初始化
- (id)initWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age;
//便利构造器
+ (id)womanWithName:(NSString *)name gender:(NSString *)gender age:(NSInteger)age;


//地脏了
- (void)floorDirty;
//衣服脏了
- (void)clothesDirty;
//饿了
- (void)hungry;
//生孩子
- (void)lonely;


































@end
