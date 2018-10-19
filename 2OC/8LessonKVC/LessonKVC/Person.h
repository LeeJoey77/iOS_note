//
//  Person.h
//  LessonKVC
//
//  Created by lanouhn on 15/10/23.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
@interface Person : NSObject
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *gender;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, retain) id ID;

@property (nonatomic, retain) Student *stu;




@end
