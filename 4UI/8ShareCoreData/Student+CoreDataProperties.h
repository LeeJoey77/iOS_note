//
//  Student+CoreDataProperties.h
//  ShareCoreData
//
//  Created by lanouhn on 15/12/29.
//  Copyright © 2015年 lanouhn0. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Student.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *studentName;
@property (nullable, nonatomic, retain) NSString *studentSex;
@property (nullable, nonatomic, retain) NSString *studentAge;
@property (nullable, nonatomic, retain) Teacher *teacherShip;

@end

NS_ASSUME_NONNULL_END
