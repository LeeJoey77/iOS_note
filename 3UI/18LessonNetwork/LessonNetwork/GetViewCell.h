//
//  GetViewCell.h
//  LessonNetwork
//
//  Created by lanouhn on 15/11/25.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Business.h"
#import "Movie.h"
@interface GetViewCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UILabel *firstLabel;
@property (retain, nonatomic) IBOutlet UILabel *secondLabel;
@property (retain, nonatomic) IBOutlet UILabel *thirdLabel;

//给cell赋值第二种方法
@property (nonatomic, retain) Business *business;

//给cell赋值第三种方法
- (void)configureCellWithModel:(Business *)business;

@end
