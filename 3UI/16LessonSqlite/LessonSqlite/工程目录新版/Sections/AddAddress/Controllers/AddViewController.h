//
//  AddViewController.h
//  LessonSqlite
//
//  Created by lanouhn on 15/11/23.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
@protocol AddViewControllerDelegate <NSObject>

- (void)addContact:(Contact *)contact;

@end
@interface AddViewController : UIViewController

@property (nonatomic, assign) id<AddViewControllerDelegate> delegate;
@end
