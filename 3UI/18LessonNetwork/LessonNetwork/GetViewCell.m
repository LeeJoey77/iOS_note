//
//  GetViewCell.m
//  LessonNetwork
//
//  Created by lanouhn on 15/11/25.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "GetViewCell.h"
@implementation GetViewCell
//cell 赋值之二:重写business的setter方法,给cell的控件进行赋值
- (void)setBusiness:(Business *)business {
    if (_business != business) {
        [_business release];
        _business = [business retain];//给business赋值
    }
    //利用business给cell控件赋值
    self.firstLabel.text = business.name;
    self.secondLabel.text = business.address;
    self.thirdLabel.text = business.telephone;
}

//给cell赋值第三种方法
- (void)configureCellWithModel:(Business *)business {
    self.firstLabel.text = business.name;
    self.secondLabel.text = business.address;
    self.thirdLabel.text = business.telephone;
}

- (void)dealloc {
    self.business = nil;
    [_firstLabel release];
    [_secondLabel release];
    [_thirdLabel release];
    [super dealloc];
}
@end
