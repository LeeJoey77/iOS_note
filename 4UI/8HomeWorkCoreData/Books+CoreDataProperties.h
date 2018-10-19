//
//  Books+CoreDataProperties.h
//  HomeWorkBooks
//
//  Created by lanouhn on 15/12/31.
//  Copyright © 2015年 lanouhn0. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Books.h"

NS_ASSUME_NONNULL_BEGIN

@interface Books (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *bookName;
@property (nullable, nonatomic, retain) NSNumber *bookPrice;
@property (nullable, nonatomic, retain) BookCategory *includedShip;

@end

NS_ASSUME_NONNULL_END
