//
//  StudentTableViewController.h
//  ShareCoreData
//
//  Created by lanouhn on 15/12/29.
//  Copyright © 2015年 lanouhn0. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Teacher.h"
@interface StudentTableViewController : UITableViewController
@property (nonatomic, strong) Teacher *teacher;
@end
