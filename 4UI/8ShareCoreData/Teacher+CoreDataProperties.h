//
//  Teacher+CoreDataProperties.h
//  ShareCoreData
//
//  Created by lanouhn on 15/12/29.
//  Copyright © 2015年 lanouhn0. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Teacher.h"

NS_ASSUME_NONNULL_BEGIN

@interface Teacher (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *teacherCreateDate;
@property (nullable, nonatomic, retain) NSString *teacherName;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *studentShip;//对应多个学生,集合类型

@end

@interface Teacher (CoreDataGeneratedAccessors)

- (void)addStudentShipObject:(NSManagedObject *)value;
- (void)removeStudentShipObject:(NSManagedObject *)value;
- (void)addStudentShip:(NSSet<NSManagedObject *> *)values;
- (void)removeStudentShip:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
