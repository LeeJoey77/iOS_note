//
//  RootViewController.m
//  SharedPicker
//
//  Created by lanouhn on 15/12/3.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "RootViewController.h"
#import "Person.h"
@interface RootViewController () <PersonProtocol>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
    //创建UIDatePicker
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 80, self.view.frame.size.width, 216)];
    
    //_datePicker.datePickerMode = UIDatePickerModeCountDownTimer; //倒计时秒表形式
    //[self.datePicker  setCountDownDuration:10 * 60]; //设置倒计时时长,以秒为单位
    //_datePicker.datePickerMode = UIDatePickerModeDate; //只显示日期
    //_datePicker.datePickerMode = UIDatePickerModeDateAndTime; //只显示日期和时间
    //_datePicker.datePickerMode = UIDatePickerModeTime; //显示上午和下午
    
    //设置背景颜色
    self.datePicker.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //添加事件
    [self.datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
    //添加到根视图
    [self.view addSubview:self.datePicker];
    //释放
    [self.datePicker release];
    
    //设置显示的格式
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    NSLog(@"%@", [NSLocale availableLocaleIdentifiers]);//输出所有语言格式
    self.datePicker.locale = locale;
    [locale release];
    
    //在当前的时间上加上某一时间:格里高利历
    NSCalendar *greforian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    //当前时间
    NSDate *localDate = [NSDate date];
    
    //创建日期组件
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];//创建日期组件
    //设置时间
    [offsetComponents setYear:0];
    [offsetComponents setMonth:0];
    [offsetComponents setDay:0];
    [offsetComponents setHour:10];
    [offsetComponents setMinute:0];
    [offsetComponents setSecond:0];
    
    //设置最大时间值
    NSDate *maxDate = [greforian dateByAddingComponents:offsetComponents toDate:localDate options:0];
    //设置允许的最大值
    self.datePicker.maximumDate = maxDate;
    //设置允许的最小值
    self.datePicker.minimumDate = localDate;
    [greforian release];
    [offsetComponents release];
    
    //设置showLabel显示
    self.showLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.datePicker.frame) + 20, CGRectGetWidth(self.datePicker.frame), 30)];
    _showLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    _showLabel.textAlignment = NSTextAlignmentCenter;
    _showLabel.text = @"显示获取的日期时间";
    [self.view addSubview:self.showLabel];
    [self.showLabel release];
    
    
    
}

- (void)dateChanged:(UIDatePicker *)sender {
    NSDate *date = sender.date;
    NSLog(@"dateChanged 响应事件:%@", date);
    
    //将NSDate格式转换为NSString格式
    NSDate *pickerDate = [self.datePicker date];//获取用户通过UIDatePicker设置的日期和时间
    NSDateFormatter *pickerFormatter = [[NSDateFormatter alloc] init];//创建日期格式
    [pickerFormatter setDateFormat:@"yyyy年MM月dd日(EEEE) HH:mm:ss"];
    NSString *dateString = [pickerFormatter stringFromDate:pickerDate];
    _showLabel.text = dateString;
    
    //打印显示的时间
    NSLog(@"格式化显示时间:%@", dateString);
    [pickerFormatter release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    self.datePicker = nil;
    self.showLabel = nil;
    [super dealloc];
}

- (void)todoSomething {
    
}
 
@end
