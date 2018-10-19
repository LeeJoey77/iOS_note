//
//  Item.h
//  xxx
//
//  Created by TongLi on 15/10/20.
//  Copyright © 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) BOOL isDianZan;

//自定义初始化方法
- (id)initWithName:(NSString *)name isDianZan:(BOOL)isDianZan;

//便利构造器
+ (id)itemWithName:(NSString *)name isDianZan:(BOOL)isDianZan;
@end
