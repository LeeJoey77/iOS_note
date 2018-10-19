//
//  RentProtocol.h
//  LessonProtocol
//
//  Created by lanouhn on 15/10/22.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>
//协议的作用:为有源代码的类,扩充方法,协议相当于一张任务清单,罗列出所有的任务,协议中的方法只有声明,谁服从了某个协议就要实现协议中必须实现的方法,可选的方法,可实现可不实现(视具体情况而定)
@protocol RentProtocol <NSObject>
//打扫卫生
@required//必须要实现的方法(系统默认)
- (void)cleanHouse;
//交房租
- (void)payRentMoney;
//爱护公物
- (void)protectPublicThings;
//交水电费
@optional//可选择的,可做可不做                                                                   
- (void)payElectAndWater;









@end
