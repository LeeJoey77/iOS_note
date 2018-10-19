//
//  BacketZombie.h
//  LessonInherit
//
//  Created by lanouhn on 15/10/16.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Zombie.h"

@interface BacketZombie : Zombie
{
    NSInteger _weakness;
    NSInteger _shield;
}
- (void)setShield:(NSInteger)shield;
- (void)setWeakness:(NSInteger)weakness;
- (NSInteger)shield;
- (NSInteger)weakness;
@end
