//
//  ContactCell.m
//  LessonSqlite
//
//  Created by lanouhn on 15/11/23.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "ContactCell.h"

@implementation ContactCell
//为子控件进行赋值(也可以重写setter方法)
- (void)configureCellWithModel:(Contact *)contact {
    self.contactImage.image = contact.image;
    self.nameLabel.text = contact.name;
    self.phoneLabel.text = contact.phone;
}

- (void)dealloc {
    [_contactImage release];
    [_nameLabel release];
    [_phoneLabel release];
    [super dealloc];
}
@end
