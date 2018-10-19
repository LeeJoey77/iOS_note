//
//  ResponderView.m
//  LessonResponserChain
//
//  Created by lanouhn on 15/11/5.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "ResponderView.h"

@implementation ResponderView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //匹配tag值
    switch (self.tag) {
        case 200:
            NSLog(@"红色");
            break;
        case 201:
            NSLog(@"黄色");
            break;
        case 202:
            NSLog(@"绿色");
            break;
        case 203:
            NSLog(@"蓝色");
            break;

        default:
            break;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

@end
