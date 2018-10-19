//
//  Student.m
//  LessonXMLAndJSON
//
//  Created by lanouhn on 15/11/24.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "Student.h"

@implementation Student
- (void)dealloc
{
    self.name = nil;
    self.gender = nil;
    self.age = nil;
    self.phone = nil;
    self.motto = nil;
    self.position = nil;
    [super dealloc];
}
@end
