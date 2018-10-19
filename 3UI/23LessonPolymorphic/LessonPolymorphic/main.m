//
//  main.m
//  LessonPolymorphic
//
//  Created by lanouhn on 15/10/29.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Plant.h"
#import "Zombie.h"
#import "ConeheadZombie.h"
#import "BucketZombie.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //多态:
        //不同类型对象在响应同一个方法时的实现不同
        //父类指针可以指向不同的子类对象
        
        //创建植物类对象
        Plant *plant = [[Plant alloc] init];
        //创僵尸类对象
        Zombie *zombie = [[Zombie alloc] init];
        [plant hitZombie:zombie];
        //创建路障僵尸类对象
        ConeheadZombie *coneHeadZombie = [[ConeheadZombie alloc] init];
        [plant hitZombie:coneHeadZombie];
        //创建铁桶僵尸类对象
        BucketZombie *bucketZombie = [[BucketZombie alloc] init];
        [plant hitZombie:bucketZombie];
        
        
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    }
    return 0;
}
