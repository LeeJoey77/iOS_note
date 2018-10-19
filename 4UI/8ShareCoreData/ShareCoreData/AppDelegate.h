//
//  AppDelegate.h
//  ShareCoreData
//
//  Created by lanouhn on 15/12/29.
//  Copyright © 2015年 lanouhn0. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//一:coredata 基本用法:增, 删, 改, 查 - 操作的是数据管理器(临时数据库), 然后调用save方法,同步到沙盒的数据库中
//关系: 一对一和一对多, 一对多如数组的本地持久化.一对一如对象的本地持久化


//二:数据库升级(又叫数据库的迁移):
//1.创建一个新的模型版本.     Edit --- Add Model Version
//2.修改新的模型版本进行修改, 如增加属性,修改属性等
//3.切换到新的模型版本.      打开右边属性框,在Model Version中选择新的模型版本
//4.添加到映射文件.         command + n ---- mapping Model
//5.在appdelegate.m中找到数据链接器,把option参数进行修改
//6.创建新的模型.h和.m


//数据管理器
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
//数据模型器
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
//数据链接器
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

