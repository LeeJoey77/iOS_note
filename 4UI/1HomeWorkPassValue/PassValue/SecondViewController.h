//
//  SecondViewController.h
//  PassValue
//
//  Created by lanouhn on 15/12/24.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import <UIKit/UIKit.h>

//Block传值
typedef void (^ReturnTextBlock)(NSString *data);
//代理传值
@protocol SecondViewControllerDelegate <NSObject>
- (void)passValueToFirstVC:(NSString *)text;
@end

@interface SecondViewController : UIViewController
@property (nonatomic, assign) id<SecondViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UIButton *secondButton;
@property (weak, nonatomic) IBOutlet UITextField *secondTextField;


//block传值 方式一:Block属性传值
@property (nonatomic, copy) ReturnTextBlock passValue;

//Block传值 方式二:Block自定义方法传值
- (void)returnText:(ReturnTextBlock)block;
@end
