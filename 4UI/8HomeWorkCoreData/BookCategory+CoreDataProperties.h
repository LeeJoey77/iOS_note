//
//  BookCategory+CoreDataProperties.h
//  HomeWorkBooks
//
//  Created by lanouhn on 15/12/31.
//  Copyright © 2015年 lanouhn0. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "BookCategory.h"

NS_ASSUME_NONNULL_BEGIN

@interface BookCategory (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *bookCategory;
@property (nullable, nonatomic, retain) NSString *bookNumber;
@property (nullable, nonatomic, retain) NSSet<Books *> *includeShip;

@end

@interface BookCategory (CoreDataGeneratedAccessors)

- (void)addIncludeShipObject:(Books *)value;
- (void)removeIncludeShipObject:(Books *)value;
- (void)addIncludeShip:(NSSet<Books *> *)values;
- (void)removeIncludeShip:(NSSet<Books *> *)values;

@end

NS_ASSUME_NONNULL_END
