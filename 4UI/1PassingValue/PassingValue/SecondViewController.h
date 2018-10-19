//
//  SecondViewController.h
//  PassingValue
//
//  Created by lanouhn on 15/12/3.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import <UIKit/UIKit.h>

//代理传值
@protocol SecondViewControllerDelegate <NSObject>
- (void)passValue:(NSString *)data;
@end


typedef  void(^ReturnTextBlock)(NSString *data);
@interface SecondViewController : UIViewController
//Block传值方式一:Block属性传值
@property (nonatomic, copy) ReturnTextBlock returnTextBlock;

//Block传值方式二:用自定义方式传值
- (void)returnText:(ReturnTextBlock)aBlock;


//代理传值
@property (nonatomic, assign) id<SecondViewControllerDelegate> delegate;
@end
