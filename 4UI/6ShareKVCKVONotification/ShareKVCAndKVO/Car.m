//
//  Car.m
//  ShareKVCAndKVO
//
//  Created by lanouhn on 15/12/24.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "Car.h"

@implementation Car
//重写insert方法
//id 类型不加 *  !!!!!!!!!!!
- (void)insertObject:(id)object inPeopleAtIndex:(NSUInteger)index {
    [self.people insertObject:object atIndex:index];
}
//重写remove方法
- (void)removeObjectFromPeopleAtIndex:(NSUInteger)index {
    [self.people removeObjectAtIndex:index];
}

@end
