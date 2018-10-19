//
//  Singleton.h
//  LessonPassValue
//
//  Created by lanouhn on 15/11/11.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import <Foundation/Foundation.h>

//界面间传值之三:多个界面之间传值
//单例传值
//一:定义单例类,提供创建单例对象的 + 号方法,
//二:在单例中定义属性,存储要传递的数据(属性的类型要和传递的数据的类型一致)
//三:在进入下一界面之前,将数据让单例对象存储
//四:在其他界面中直接从单例对象中获取数据即可

//单例:保证一个类的对象只有一个,无论创建多少次,对象都是同一个!!!!!!
//单例不需要释放,用便利构造器创建的Button也不需要手动释放,否则会crush


//系统提供的单例类
//[UIApplication sharedApplication];
//[UIScreen mainScreen];
//[NSUserDefaults standardUserDefaults];
//[NSFileManager defaultManager];

@interface Singleton : NSObject

//单例传值第一步:提供创建对象的加号方法,即便利构造器(命名规则:以main, shared, standard, default开头)
//单例的优势:(1)节省空间 (2)共享内存单元
+ (Singleton *)mainSingleton;
//单例传值第二步:定义属性,存储要传输的数据
@property (nonatomic, retain) NSString *data;

@end
