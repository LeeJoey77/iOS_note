//
//  Book.m
//  LessonCollection
//
//  Created by lanouhn on 15/10/20.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Book.h"

@implementation Book
//setter
- (void)setName:(NSString *)name {
    _name = name;
}
- (void)setPrice:(CGFloat)price {
    _price = price;
}

//getter
- (NSString *)name {
    return _name;
}
- (CGFloat)price {
    return _price;
}

//自定义初始化
- (id)initWithName:(NSString *)name price:(CGFloat)price {
    self = [super init];
    if (self) {
        _name = name;
        _price = price;
    }
    return self;
}

//便利构造器
+ (id)bookWithName:(NSString *)name price:(CGFloat)price {
    Book *book = [[Book alloc] initWithName:name price:price];
    return book;
}













@end
