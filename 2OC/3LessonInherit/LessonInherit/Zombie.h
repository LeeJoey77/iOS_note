//
//  Zombie.h
//  LessonInherit
//
//  Created by lanouhn on 15/10/16.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>
//公共父类的使用场景:当多个类之间存在部分相同的特征以及行为时,为了防止多个类中写重复的代码,新建一个公共父类,父类中填写多个类中相同的实例变量以及行为,让多个类继承即可
@interface Zombie : NSObject
{
    NSInteger _totalBlood;
    NSInteger _attack;
    NSInteger _speed;
}
- (void)setTotalBlood:(NSInteger)totalblood;
- (void)setAttack:(NSInteger)attack;
- (void)setSpeed:(NSInteger)speed;
- (NSInteger)totalblood;
- (NSInteger)attack;
- (NSInteger)speed;
@end
