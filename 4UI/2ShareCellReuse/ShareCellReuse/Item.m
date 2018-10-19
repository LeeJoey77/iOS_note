//
//  Item.m

//  Created by TongLi on 15/10/20.
//  Copyright © 2015年 lanouhn. All rights reserved.

#import "Item.h"

@implementation Item
//自定义初始化方法
- (id)initWithName:(NSString *)name isDianZan:(BOOL)isDianZan{
    self = [super init];
    if (self) {
        self.name = name;
        self.isDianZan = isDianZan;
    }
    return self;
}

//便利构造器
+ (id)itemWithName:(NSString *)name isDianZan:(BOOL)isDianZan{
    return [[Item alloc]initWithName:name isDianZan:isDianZan];
}

@end
