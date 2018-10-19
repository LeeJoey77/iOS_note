//
//  Movie.m
//  LessonNetwork
//
//  Created by lanouhn on 15/11/25.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)dealloc
{
    self.actorsArr = nil;
    self.area = nil;
    [super dealloc];
}
@end
