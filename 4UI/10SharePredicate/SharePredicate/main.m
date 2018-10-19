//
//  main.m
//  SharePredicate
//
//  Created by lanouhn on 16/1/4.
//  Copyright © 2016年 lanouhn0. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //字符串比较都是区分大小写和重音符号的。如：café和cafe是不一样的，Cafe和cafe也是不一样的。如果希望字符串比较运算不区分大小写和重音符号，请在这些运算符后使用[c]，[d]选项。其中[c]是不区分大小写，[d]是不区分重音符号，其写在字符串比较运算符之后，比如：name LIKE[cd] 'cafe'，那么不论name是cafe、Cafe还是café上面的表达式都会返回YES。
        //谓词
        NSArray *array = [NSArray arrayWithObjects:[Person itemWithPeopleName:@"iMac" withPeopleAge:20], [Person itemWithPeopleName:@"iPhone" withPeopleAge:30], [Person itemWithPeopleName:@"iWatch" withPeopleAge:25], [Person itemWithPeopleName:@"iCloud" withPeopleAge:35], [Person itemWithPeopleName:@"iPad" withPeopleAge:5], [Person itemWithPeopleName:@"iPod" withPeopleAge:10], [Person itemWithPeopleName:@"iTouch" withPeopleAge:15], nil];
        
        //一、关系运算符 > < =
        //1.创建谓词
        NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"peopleAge > 30"];
        //通过谓词进行筛选
        NSArray *result1 = [array filteredArrayUsingPredicate:predicate1];
        for (Person *temp in result1) {
            NSLog(@"one = %@", temp.peopleName);
        }
        
        //二、字符串,用单引号 ' '
        NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"peopleName = 'iPhone'"];
        NSArray *result2 = [array filteredArrayUsingPredicate:predicate2];
        for (Person *temp in result2) {
            NSLog(@"two = %@", temp.peopleName);
        }

        //三、多个筛选条件
        NSPredicate *predicate3 = [NSPredicate predicateWithFormat:@"peopleName = 'iPhone' || peopleName = 'iPad'"];
        NSArray *result3 = [array filteredArrayUsingPredicate:predicate3];
        for (Person *temp in result3) {
            NSLog(@"three = %@", temp.peopleName);
        }
        
        //四、整体包含,关键字 in可以大写
        NSPredicate *predicate4 = [NSPredicate predicateWithFormat:@"peopleName IN{'iPhone', 'iWatch'}"];
        NSArray *result4 = [array filteredArrayUsingPredicate:predicate4];
        for (Person *temp in result4) {
            NSLog(@"four = %@", temp.peopleName);
        }

        //五、beginswith --- 以什么开头
        //endswith --- 以什么结尾
        //contains --- 包含某些字符
        NSPredicate *predicate5 = [NSPredicate predicateWithFormat:@"peopleName CONTAINS 'e'"];
        NSArray *result5 = [array filteredArrayUsingPredicate:predicate5];
        for (Person *temp in result5) {
            NSLog(@"five = %@", temp.peopleName);
        }

        //六、模糊搜索, 关键字LIKE
        // * 代表任意多个字符
        // ? 一个字符，占一位
        NSPredicate *predicate6 = [NSPredicate predicateWithFormat:@"peopleName LIKE '*e*'"];
        NSArray *result6 = [array filteredArrayUsingPredicate:predicate6];
        for (Person *temp in result6) {
            NSLog(@"six = %@", temp.peopleName);
        }

        
    }
    return 0;
}
