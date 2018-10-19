//
//  Person.h
//  SharedPicker
//
//  Created by admin on 2018/9/26.
//  Copyright © 2018年 lanouhn0. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PersonProtocol <NSObject>
- (void)todoSomething;
@end

@interface Person : NSObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) id<PersonProtocol> delegate;

@end

NS_ASSUME_NONNULL_END
