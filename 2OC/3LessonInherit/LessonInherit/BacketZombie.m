//
//  BacketZombie.m
//  LessonInherit
//
//  Created by lanouhn on 15/10/16.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "BacketZombie.h"

@implementation BacketZombie
- (void)setShield:(NSInteger)shield {
    _shield = shield;
}
- (void)setWeakness:(NSInteger)weakness {
    _weakness = weakness;
}
- (NSInteger)shield {
    return _shield;
}
- (NSInteger)weakness {
    return _weakness;
}
@end
