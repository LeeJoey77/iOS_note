//
//  Person.h
//  SharePredicate
//
//  Created by lanouhn on 16/1/4.
//  Copyright © 2016年 lanouhn0. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic, strong) NSString *peopleName;
@property (nonatomic, assign) NSInteger peopleAge;

//初始化方法
- (id)initWithPeopleName:(NSString *)peopleName withPeopleAge:(NSInteger)peopleAge;
//便利构造器
+ (id)itemWithPeopleName:(NSString *)peopleName withPeopleAge:(NSInteger)peopleAge;
@end
