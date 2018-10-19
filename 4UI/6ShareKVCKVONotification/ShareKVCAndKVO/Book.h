//
//  Book.h
//  ShareKVCAndKVO
//
//  Created by lanouhn on 15/12/24.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Author.h"
@interface Book : NSObject
{
    //对象
    @private
    NSString *bookName;
    NSString *_bookName;
    NSString *__bookName;
    
    //基本数据类型
    float bookPrice;//价格
    
    //通过keyPath访问
    Author *bookAuthor;//作者
    
    //一对多
    NSMutableArray *relatedBook;//相关书籍
    
}

////setter
//- (void)setBookName:(NSString *)bookName;
////getter
//- (NSString *)bookName;
@end
