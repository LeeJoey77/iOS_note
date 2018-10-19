//
//  RootTableViewCell.m
//  TuWenDemo
//
//  Created by TongLi on 15/12/16.
//  Copyright © 2015年 lanouhn. All rights reserved.
//

#import "RootTableViewCell.h"

@implementation RootTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 0)];
        self.contentLabel.font = [UIFont systemFontOfSize:13];
        self.contentLabel.numberOfLines = 0;
        self.contentLabel.backgroundColor = [UIColor cyanColor];
        [self.contentView addSubview:self.contentLabel];
        
        self.photoView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 0)];
        [self.contentView addSubview:self.photoView];
        
        
        
        
        
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
