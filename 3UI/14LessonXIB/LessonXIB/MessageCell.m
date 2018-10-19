//
//  MessageCell.m
//  LessonXIB
//
//  Created by lanouhn on 15/11/19.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_nameLabel release];
    [super dealloc];
}
@end
