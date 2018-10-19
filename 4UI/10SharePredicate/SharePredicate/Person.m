//
//  Person.m
//  SharePredicate
//
//  Created by lanouhn on 16/1/4.
//  Copyright © 2016年 lanouhn0. All rights reserved.
//

#import "Person.h"

@implementation Person
//初始化方法
- (id)initWithPeopleName:(NSString *)peopleName withPeopleAge:(NSInteger)peopleAge{
    self = [super init];
    if (self) {
        self.peopleName = peopleName;
        self.peopleAge = peopleAge;
    }
    return self;
}

//便利构造器
+ (id)itemWithPeopleName:(NSString *)peopleName withPeopleAge:(NSInteger)peopleAge {
    return [[Person alloc] initWithPeopleName:peopleName withPeopleAge:peopleAge];
    
}
@end
