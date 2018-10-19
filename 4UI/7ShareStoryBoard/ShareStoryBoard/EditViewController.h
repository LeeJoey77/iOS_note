//
//  EditViewController.h
//  ShareStoryBoard
//
//  Created by lanouhn on 15/12/25.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController
//属性传值
@property (nonatomic, strong) NSString *oldName;

//Block传值
@property (nonatomic, copy) void(^changedName)(NSString *newName);
@end
