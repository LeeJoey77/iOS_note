//
//  main.m
//  LessonExtension
//
//  Created by lanouhn on 15/10/22.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
   
    Student *stu = [[Student alloc] init];
    //本类, .h中的方法,外界可以随便访问
    [stu setName:@"zhangsan"];
    NSLog(@"%@", [stu name]);//name 的getter 方法中调用了类的延展方法sayHi
    //[stu sayHi];类的延展中的方法只能在本类中调用
    //NSLog(@"%@", [stu age]);类的延展中定义的实例变量age,只能在本类中访问
    //若在.h中声明@property NSInteger age;则可以在main 中访问实例变量age
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    return 0;
}
