//
//  HeaderView.m
//  LessonUICollectionView
//
//  Created by lanouhn on 11/30/15.
//  Copyright (c) 2015 hdy. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView
//重写初始化方法, 添加控件
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //添加控件
        [self addSubview:self.imageView];
    }
    return self;
}

//lazy loading

- (UIImageView *)imageView {
    if (!_imageView) {
        self.imageView = [[[UIImageView alloc] initWithFrame:self.bounds] autorelease];
    }
    return [[_imageView retain] autorelease];
}









- (void)dealloc {
    self.imageView = nil;
    [super dealloc];
}
@end
