//
//  Car.h
//  ShareKVCAndKVO
//
//  Created by lanouhn on 15/12/24.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
@property (nonatomic, assign) NSInteger distanceValue;//行驶距离
@property (nonatomic, assign) NSInteger oilValue;//油量
@property (nonatomic, strong) NSMutableArray *people;


//必须同时重写insert 和 remove方法
//重写insert方法
//id 类型不加 *  !!!!!!!!!!!
- (void)insertObject:(id)object inPeopleAtIndex:(NSUInteger)index;
//重写remove方法
- (void)removeObjectFromPeopleAtIndex:(NSUInteger)index;
@end
