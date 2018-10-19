//
//  FooterView.m
//  LessonUICollectionView
//
//  Created by lanouhn on 11/30/15.
//  Copyright (c) 2015 hdy. All rights reserved.
//

#import "FooterView.h"

@implementation FooterView
- (void)dealloc {
    self.label = nil;
    [super dealloc];
}

//重写初始化方法
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //添加控件
        [self addSubview:self.label];
    }
    return self;
}

//lazy loading
- (UILabel *)label {
    if (!_label) {
        self.label = [[[UILabel alloc] initWithFrame:self.bounds] autorelease];
        self.label.tintColor = [UIColor whiteColor];
        self.label.textAlignment = NSTextAlignmentCenter;//居中
    }
    return [[_label retain] autorelease];
}
@end
