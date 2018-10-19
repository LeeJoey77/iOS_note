//
//  main.m
//  LessonDelegateAndProtocol
//
//  Created by lanouhn on 15/10/28.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Man.h"
#import "Woman.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Man *man = [Man manWithName:@"lilei" gender:@"man" age:20];
        Woman *woman = [Woman womanWithName:@"hanmeimei" gender:@"woman" age:20];
        woman.delegate = man;
        
        //女人发现地脏了
        [woman floorDirty];
        //饿了
        [woman hungry];
        //衣服脏了
        [woman clothesDirty];
        //寂寞
        [woman lonely];

    
    }
    return 0;
}







