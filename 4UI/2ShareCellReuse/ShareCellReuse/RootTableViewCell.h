//
//  RootTableViewCell.h
//  xxx
//
//  Created by TongLi on 15/10/20.
//  Copyright © 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonOfCell.h"

@interface RootTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;

//自己封装的button, 有属性indexOfCell, 用来区别Cell上的button
@property (nonatomic, strong) ButtonOfCell *dianZan;
@end
