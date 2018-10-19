//
//  Singleton.h
//  PassValue
//
//  Created by lanouhn on 15/12/24.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject
//便利构造器创建单例
+ (Singleton *)mainSingleton;

@property (nonatomic, strong) NSString *data;
@end
