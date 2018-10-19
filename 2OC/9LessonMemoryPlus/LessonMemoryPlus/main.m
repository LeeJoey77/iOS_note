

//
//  main.m
//  LessonMemoryPlus
//
//  Created by lanouhn on 15/10/29.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
      //集合内存管理:
            //1.当往集合中添加元素的时候,元素的引用计数 +1
            //2.当从集合中移除元素时,元素的引用计数 -1
            //3.当集合销毁时,会将集合中的所有元素的引用计数 -1
        
        Person *per = [[Person alloc] initWithName:@"" gender:@"" age:2];
        per.name = @"";
        Person *per2 = [per retain];
       
        NSLog(@"%ld", [per retainCount]);
    }
    return 0;
}
