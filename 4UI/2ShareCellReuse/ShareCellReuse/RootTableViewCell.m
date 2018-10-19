//
//  RootTableViewCell.m
//  xxx
//
//  Created by TongLi on 15/10/20.
//  Copyright © 2015年 lanouhn. All rights reserved.
//

#import "RootTableViewCell.h"

@implementation RootTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 50, 30)];
        self.titleLabel.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:self.titleLabel];
        
        self.dianZan = [[ButtonOfCell alloc]initWithFrame:CGRectMake(280, 10, 30, 30)];
        self.dianZan.backgroundColor = [UIColor cyanColor];
        [self.contentView addSubview:self.dianZan];
        
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
