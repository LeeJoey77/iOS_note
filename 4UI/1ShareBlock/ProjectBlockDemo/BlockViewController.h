//
//  BlockViewController.h
//  ProjectBlockDemo
//
//  Created by admin on 2018/2/24.
//  Copyright © 2018年 lanouhn0. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^GetOverBlock)(NSString *param1, NSString *param2);

@interface BlockViewController : UIViewController

@property (nonatomic, copy) GetOverBlock aBlock;

@end
