//
//  ContactCell.h
//  LessonSqlite
///Users/lanouhn/Documents/My file/1Lesson/3UI/16LessonSqlite/LessonSqlite.xcodeproj
//  Created by lanouhn on 15/11/23.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
@interface ContactCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *contactImage;
@property (retain, nonatomic) IBOutlet UILabel *nameLabel;
@property (retain, nonatomic) IBOutlet UILabel *phoneLabel;

//为子控件进行赋值(也可以重写setter方法)
- (void)configureCellWithModel:(Contact *)contact;
@end
