//
//  TwoTableViewCell.h
//  ShareStoryBoard
//
//  Created by lanouhn on 15/12/25.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *twoHeaderImage;
@property (weak, nonatomic) IBOutlet UILabel *twoNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *twoSignatureLabel;

@end
