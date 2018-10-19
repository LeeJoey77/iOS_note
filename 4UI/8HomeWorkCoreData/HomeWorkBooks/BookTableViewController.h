//
//  BookTableViewController.h
//  HomeWorkBooks
//
//  Created by lanouhn on 15/12/31.
//  Copyright © 2015年 lanouhn0. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Books.h"
#import "BookCategory.h"

@interface BookTableViewController : UITableViewController
@property (nonatomic, strong) BookCategory *category;
@end
