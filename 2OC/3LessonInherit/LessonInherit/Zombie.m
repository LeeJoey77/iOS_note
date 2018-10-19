//
//  Zombie.m
//  LessonInherit
//
//  Created by lanouhn on 15/10/16.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Zombie.h"

@implementation Zombie
- (void)setTotalBlood:(NSInteger)totalblood {
    _totalBlood = totalblood;
}
- (void)setAttack:(NSInteger)attack {
    _attack = attack;
}
- (void)setSpeed:(NSInteger)speed {
    _speed = speed;
}
- (NSInteger)totalblood {
    return _totalBlood;
}
- (NSInteger)attack {
    return _attack;
}
- (NSInteger)speed {
    return _speed;
}

@end
