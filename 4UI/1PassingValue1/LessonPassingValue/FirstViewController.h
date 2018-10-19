//
//  FirstViewController.h
//  LessonPassingValue
//
//  Created by lanouhn on 15/12/3.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import <UIKit/UIKit.h>

//代理传值
@protocol FirstViewControllerDelegate <NSObject>
- (void)passValue:(NSString *)data;
@end


//Block传值
typedef void(^ReturnTextBlock)(NSString *data);
typedef BOOL(^ReturnBlock)();

@interface FirstViewController : UIViewController
//Block 传值方式一:Block属性传值
@property (nonatomic, copy) ReturnTextBlock returnValue;//不需要加 *,必须用copy
@property (nonatomic, copy) ReturnBlock returnBool;

//Block 传值方式二:用自定义方法传值
- (void)returnText:(ReturnTextBlock)block;



//代理传值
@property (nonatomic, assign) id<FirstViewControllerDelegate> delegate;
@end
