//
//  Student.h
//  LessonMethod
//
//  Created by lanouhn on 15/10/15.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
{
    NSString *_name;
    NSString *_gender;
    NSInteger _age;
    CGFloat _score;
}
- (void)myName;
- (NSString *)myGender;//姓名,性别都为 (NSString *) 字符串类型
- (void)myAge:(NSInteger)age;
- (CGFloat)myScore:(CGFloat)score credit:(CGFloat)credit;

@end
