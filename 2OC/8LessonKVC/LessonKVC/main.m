//
//  main.m
//  LessonKVC
//
//  Created by lanouhn on 15/10/23.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
int main(int argc, const char * argv[]) {
   
    Person *per = [[Person alloc] init];
    per.name = @"华为";
    per.gender = @"男";
    per.age = 18;
    NSLog(@"%@ %@ %ld", per.name, per.gender, per.age);
    
    //通过KVC 进行赋值
    //1.setValue:(id) forKey:(NSString *)
    [per setValue:@"任正非" forKey:@"name"];
    [per setValue:@"男" forKey:@"gender"];
    [per setValue:@59 forKey:@"age"];//setValue 后跟对象,forKey 后跟字符串对象
    NSLog(@"%@ %@ %@", per.name, [per valueForKey:@"gender"], [per valueForKey:@"age"]);
   
    //2.setValue:(id) forUndefinedKey:(NSString *)
    
    //3.setValuesForKeysWithDictionary:(NSDictionary *)
    NSDictionary *dic = @{@"name":@"马丽", @"gender":@"女", @"age":@17};
    [per setValuesForKeysWithDictionary:dic];
    NSLog(@"%@ %@ %ld", per.name, per.gender, per.age);
    
    //4.per setValue:(id) forKeyPath:(NSString *)
    Student *stu1 = [[Student alloc] init];
    per.stu = stu1;//将stu1 的地址赋给 Person 的stu
    [per setValue:@"郝建" forKeyPath:@"stu.name"];
    NSLog(@"%@", stu1.name);
    per.stu.name = @"dada";
    NSLog(@"%@", per.stu.name);
    
    
    
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    return 0;
}
