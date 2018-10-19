//
//  UIViewController+AssociatedObjects.m
//  LayoutSubViewDemo
//
//  Created by admin on 2018/9/19.
//  Copyright © 2018年 zywlw. All rights reserved.
//

#import "UIViewController+AssociatedObjects.h"
#import "objc/runtime.h"

static char kAssociatedObject_retain_Key;
static void *kAssociatedObject_copy_Key = &kAssociatedObject_copy_Key;

@implementation UIViewController (AssociatedObjects)

- (NSString *)associatedObject_retain {
    return objc_getAssociatedObject(self, &kAssociatedObject_retain_Key);
}

- (void)setAssociatedObject_retain:(NSString *)associatedObject_retain {
    objc_setAssociatedObject(self, &kAssociatedObject_retain_Key, associatedObject_retain, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)associatedObject_copy {
    return objc_getAssociatedObject(self, kAssociatedObject_copy_Key);
}

- (void)setAssociatedObject_copy:(NSString *)associatedObject_copy {
    objc_setAssociatedObject(self, kAssociatedObject_copy_Key, associatedObject_copy, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)associatedObject_assign {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)setAssociatedObject_assign:(BOOL)associatedObject_assign {
    objc_setAssociatedObject(self, @selector(associatedObject_assign), @(associatedObject_assign), OBJC_ASSOCIATION_ASSIGN);
}

@end
