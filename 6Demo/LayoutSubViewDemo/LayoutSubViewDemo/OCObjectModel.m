//
//  OCObjectModel.m
//  LayoutSubViewDemo
//
//  Created by admin on 2018/9/12.
//  Copyright © 2018年 zywlw. All rights reserved.
//

#import "OCObjectModel.h"

@implementation OCObjectModel

- (void)getMethod {
    for (int i = 0; i < 10000; i++) {
//        @autoreleasepool {
            NSMutableArray *arr = [NSMutableArray arrayWithCapacity:1];
            NSLog(@"%@", arr);
//        }
    }

}

@end
