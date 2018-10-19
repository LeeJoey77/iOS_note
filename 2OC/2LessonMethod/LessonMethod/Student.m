//
//  Student.m
//  LessonMethod
//
//  Created by lanouhn on 15/10/15.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Student.h"

@implementation Student
- (void)myName {
    NSLog(@"Ross");
}
- (NSString *)myGender {
    _gender = @"m";//(NSString *)类型赋值加 @
    return _gender;//或 return @"m";
}
- (void)myAge:(NSInteger)age {
    _age = age + 1;
}
- (CGFloat)myScore:(CGFloat)score credit:(CGFloat)credit {
    _score = score + credit;
    return _score;
}

@end
