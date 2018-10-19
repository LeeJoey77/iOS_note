//
//  ImageCell.m
//  LessonUICollectionView
//
//  Created by lanouhn on 11/30/15.
//  Copyright (c) 2015 hdy. All rights reserved.
//

#import "ImageCell.h"



@implementation ImageCell


//重写初始化方法, 在cell上添加控件
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //添加子控件
        [self.contentView addSubview:self.imageView];
    }
    return self;
}

//1.当视图大小发生变化时触发
//2.当添加到父视图时触发
//3.当屏幕旋转时触发
//可以修改子视图的大小, 位置等
- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}

//lazy loading
- (UIImageView *)imageView {
    if (!_imageView) {
        self.imageView = [[[UIImageView alloc] initWithFrame:self.bounds] autorelease];
        _imageView.image = [UIImage imageNamed:@"cbb"];
    }
    return [[_imageView retain] autorelease];
}
- (void)dealloc {
    self.imageView = nil;
    [super dealloc];
}
@end
