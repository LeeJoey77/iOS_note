//
//  UIViewController+AssociatedObjects.h
//  LayoutSubViewDemo
//
//  Created by admin on 2018/9/19.
//  Copyright © 2018年 zywlw. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (AssociatedObjects)

@property (strong, nonatomic) NSString *associatedObject_retain;
@property (copy, nonatomic) NSString *associatedObject_copy;
@property (assign, nonatomic) BOOL associatedObject_assign;

@end

NS_ASSUME_NONNULL_END
