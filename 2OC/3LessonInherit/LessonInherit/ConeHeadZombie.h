//
//  ConeHeadZombie.h
//  LessonInherit
//
//  Created by lanouhn on 15/10/16.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Zombie.h"

@interface ConeHeadZombie : Zombie
{
    NSInteger _shield;
}
- (void)setShield:(NSInteger)shield;
- (NSInteger)shield;
@end
