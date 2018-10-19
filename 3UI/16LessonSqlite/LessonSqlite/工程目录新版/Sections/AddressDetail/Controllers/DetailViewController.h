//
//  DetailViewController.h
//  LessonSqlite
//
//  Created by lanouhn on 15/11/23.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Contact;
//代理传值一:
@protocol DetailViewControllerDelegate <NSObject>
- (void)modifyContact:(Contact *)con;//修改联系人信息
@end

@interface DetailViewController : UIViewController
@property (nonatomic, retain) Contact *data;//存储联系人界面传入的数据

//代理传值二:
@property (nonatomic, assign) id<DetailViewControllerDelegate> delegate;
@end
