//
//  Student.h
//  LessonExtension
//
//  Created by lanouhn on 15/10/22.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    NSString *_name;
    NSString *_gender;
   
}
//@property NSInteger age;

//setter
- (void)setName:(NSString *)name;
- (void)setGender:(NSString *)gender;

//getter
- (NSString *)name;
- (NSString *)gender;








































@end
