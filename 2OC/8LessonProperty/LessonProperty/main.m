//
//  main.m
//  LessonProperty
//
//  Created by lanouhn on 15/10/23.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
int main(int argc, const char * argv[]) {
    //创建Person对象
    Person *per = [[Person alloc] init];
    [per setName:@"lily"];
    NSLog(@"%@", [per name]);
    
    //点语法
    //凡是符合setter 和getter 方法书写规范的方法,都可以使用点语法来调用
    //当per.name 在等号的左侧时,自动调用setter 方法为实例变量赋值
    //当per.name 在等号的右侧时,或者直接使用per.name 时,自动调用getter 方法
    per.name = @"张三";
    NSLog(@"%@", per.name);
    NSString *name = per.name;
    NSLog(@"%@", name);
    //凡是符合setter 和getter 方法书写规范的方法,都可以使用点语法来调用
    //getter 型 --- sayHello
    Student *stu = [Student studentWithName:@"li" gender:@"m" age:22 score:77];
    Student *s = [stu copy];
    NSLog(@"%@, %lu, %lu", stu.sayHello, [stu retainCount], [s retainCount]);
   
    
    
    
    
    return 0;
}
