//
//  main.m
//  LessonNSDate
//
//  Created by lanouhn on 15/10/22.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
//   //1.创建 NSDate 对象,创建的 NSDate 对象获取的是零时区的时间
    NSDate *date = [NSDate date];//便利构造器
    NSLog(@"%@", date);
    //通过某一时间,获取另一时间
    //看似能够获得东八区的时间,其实,还是根据零时区的时间推算的
    NSDate *BJDate = [NSDate dateWithTimeInterval:8 * 3600 sinceDate:date];
    NSLog(@"%@", BJDate);
//    //获取明天时间
//    NSDate *tomorrowDate = [NSDate dateWithTimeInterval:24 * 3600 sinceDate:BJDate];
//    NSLog(@"%@", tomorrowDate);
//    //获取北京时间的昨天的同一时刻
//    NSDate *yesterdayDate = [NSDate dateWithTimeInterval:-24 *3600 sinceDate:BJDate];
//    NSLog(@"%@", yesterdayDate);
    
    
//    //2.获取时间间隔,时间间隔不是对象
//    NSTimeInterval timeInterval = [BJDate timeIntervalSince1970];
//    NSLog(@"%f", timeInterval);
//    //根据1970年的时间,获取相差 timeInterval 这么长时间之后的时间
//    NSDate *timeSince1970 = [NSDate dateWithTimeIntervalSince1970:timeInterval];
//    NSLog(@"%@", timeSince1970);
//    //从2001年1月1日到现在的时间间隔
//    NSTimeInterval timeInterval1 = [BJDate timeIntervalSinceReferenceDate];
//    NSLog(@"%f", timeInterval1);
//    //timeInterva 获取的是当前的零时区的时间,与某一时间的间隔
//    NSTimeInterval timeInterval2 = [BJDate timeIntervalSinceNow];
//    NSLog(@"%f", timeInterval2);
//    //已给定的时间为基准计算两个 NSDate 对象的时间间隔
//    NSTimeInterval timeInterval3 = [BJDate timeIntervalSinceDate:date];
//    NSLog(@"%f", timeInterval3);

    
//    //3.日期比较
//    //比较两个日期是否相等
//    BOOL isEqual = [tomorrowDate isEqualToDate:yesterdayDate];
//    NSLog(@"%d", isEqual);
//    //获取两个时间中较早的时间
//    NSDate *earlierDate = [tomorrowDate earlierDate:yesterdayDate];
//    NSLog(@"%@", earlierDate);
//    //获取两个时间中较晚的时间
//    NSDate *laterDate = [tomorrowDate laterDate:yesterdayDate];
//    NSLog(@"%@", laterDate);
    
    //4.日期转换的处理
    //NSDate 和 NSString 之间的转换
    //(1)NSDate 转化为 NSString
    //创建 NSDate 对象
//    NSDate *currentDate = [NSDate date];
//    NSLog(@"%@", currentDate);
//    //创建日期转换工具
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    //设定日期转换格式
//    [formatter setDateFormat:@"yyyy年MM月dd日 hh:mm:ss"];
//    //通过日期转换工具将 NSDate 对象转化为 NSString 对象
//    NSString *timeString = [formatter stringFromDate:currentDate];
//    NSLog(@"%@", timeString);
    
    //日期格式:
    //yyyy:表示年
    //Y:表示年
    //M:表示月份,只显示当前月数字
    //MM:表示月份,只显示当前月的数字,如果数字不足两位,会补 0
    //MMM:表示月份,显示当前月的数字和一个"月"字
    //MMMM:表示月份,以中文形式显示当前月份,例如:十月
    //d:表示当月的第几天
    //D:表示当年的第几天
    //E:表示周几
    //a:便是上午/下午
    //hh:表示时间,12小时制的时间
    //HH:表示时间,24小时制的时间
    //mm:表示分钟
    //ss:表示秒
    
    
    //(2)NSString 转化为 NSDate
    //创建NSString对象
//    NSString *string = @"2016年04月28日 10点59分08秒";

//    NSString *string = @"2016-04-28 10:59:08";
    //创建转换工具
//    NSDateFormatter *formatterStr = [[NSDateFormatter alloc] init];
    //设置转换格式
//    [formatterStr setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    [formatterStr setDateFormat:@"yyyy年MM月dd日 HH点mm分ss秒"];
    //NSString 对象,转 NSDate 对象
//    NSDate *newDate = [formatterStr dateFromString:string];
//    NSLog(@"%@", newDate);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    return 0;
}
