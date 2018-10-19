//
//  RootViewController.m
//  ShareKVCAndKVO
//
//  Created by lanouhn on 15/12/24.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "RootViewController.h"
#import "Book.h"
#import "Car.h"
@interface RootViewController ()
@property (nonatomic, strong) Car *car;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *label1;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
    //KVC的操作顺序
    //1.如果有setter, getter方法,先执行setter, getter方法
    //2.先_key, 后key
    //3.如果上面两个都不成立,执行 setValue:forUndefinedKey: 程序崩溃
    
    //对象类型
    //创建book对象
    //KVC,通过间接访问和设置实例变量,即使这个变量是私有的,key必须和实例变量名一致
    Book *book = [[Book alloc] init];
//    book->bookName = @"论语";
//    NSLog(@"%@", book->bookName);
    [book setValue:@"论语" forKey:@"bookName"];
    NSLog(@"%@", [book valueForKey:@"bookName"]);
    
    //基本数据类型
    //要设置基本数据类型,需要对其封装
//    [book setValue:@20.2 forKey:@"bookPrice"];
    [book setValue:[NSNumber numberWithFloat:20.2] forKey:@"bookPrice"];
    //对基本数据类型访问,需要解封
    NSLog(@"%f", [[book valueForKey:@"bookPrice"] floatValue]);
    
    //通过路径(keyPath)访问
    //创建一个作者类
    Author *autor = [[Author alloc] init];
    //给作者赋上姓名
    [autor setValue:@"孔子" forKey:@"authorName"];
    //给书赋上作者
    [book setValue:autor forKey:@"bookAuthor"];
    //通过路径(keyPath)去访问
    NSLog(@"%@", [book valueForKeyPath:@"bookAuthor.authorName"]);
    //通过路径(keyPath)去设置
    [book setValue:@"孔子及其弟子" forKeyPath:@"bookAuthor.authorName"];
    NSLog(@"%@", [book valueForKeyPath:@"bookAuthor.authorName"]);
    
    //一对多,例如relatedBook数组
    //相关书籍的名字
    NSMutableArray *relatedBookName = [NSMutableArray arrayWithObjects:@"道德经", @"大学", @"孟子", nil];
    //相关书籍价格
    NSMutableArray *relatedBookPrice = [NSMutableArray arrayWithObjects:@30.3, @40.4, @50.5, nil];
    NSMutableArray *relatedBookArray = [NSMutableArray array];
    for (int i = 0; i < 3; i++) {
        //创建一个相关书籍
        Book *relatedBook = [[Book alloc] init];
        //相关书籍的名字
        [relatedBook setValue:relatedBookName[i] forKey:@"bookName"];
        //相关书籍价格
        [relatedBook setValue:relatedBookPrice[i] forKey:@"bookPrice"];
        [relatedBookArray addObject:relatedBook];
    }
    //设置数组
    [book setValue:relatedBookArray forKey:@"relatedBook"];
    NSMutableArray *array = [book valueForKey:@"relatedBook"];
    for (Book *tempBook in array) {
        NSLog(@"%@---", [tempBook valueForKey:@"bookName"]);
    }
    //访问数组
    NSLog(@"%@++++", [book valueForKey:@"relatedBook"]);
    
    //KVC的简单运算
    //求个数
    NSNumber *relationBookCount = [book valueForKeyPath:@"relatedBook.@count"];
    NSLog(@"%@", relationBookCount);
    //求和
    NSNumber *relatedBookPriceSum = [book valueForKeyPath:@"relatedBook.@sum.bookPrice"];
    NSLog(@"%@", relatedBookPriceSum);
    //求平均数
    NSNumber *relatedBookPriceAvg = [book valueForKeyPath:@"relatedBook.@avg.bookPrice"];
    NSLog(@"%@", relatedBookPriceAvg);
    //求最大值
    NSNumber *relatedBookPriceMax = [book valueForKeyPath:@"relatedBook.@max.bookPrice"];
    NSLog(@"%@", relatedBookPriceMax);
    //求最小值
    NSNumber *relatedBookPriceMin = [book valueForKeyPath:@"relatedBook.@min.bookPrice"];
    NSLog(@"%@", relatedBookPriceMin);
    */
    
    
    //KVO --- 键值观察者
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.frame = CGRectMake(130, 200, 70, 30);
    button1.backgroundColor = [UIColor purpleColor];
    [button1 addTarget:self action:@selector(handleButton1Action:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button1];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(100, 250, 65, 30)];
    _label.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_label];
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(165, 250, 65, 30)];
    _label1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_label1];

    //实例化小汽车
    self.car = [[Car alloc] init];
    _car.distanceValue = 0;
    _car.oilValue = 10;
    //添加观察者
    [_car addObserver:self forKeyPath:@"distanceValue" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    [_car addObserver:self forKeyPath:@"oilValue" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:nil];
    
    //一对多, context可以传值
    self.car.people = [NSMutableArray array];
    [self.car addObserver:self forKeyPath:@"people" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:@"hello world"];
}

- (void)handleButton1Action:(UIButton *)sender {
    //前进一米
    self.car.distanceValue++;
    //油量减少
    self.car.oilValue--;
    //前进一米,人数加一
    //[self.car.people addObject:[NSString stringWithFormat:@"people_%ld", self.car.distanceValue]];//使用该方法往数组中添加元素, 不能正常观察
   
    //执行顺序
    //distanceValue++  observeValue oilValue-- observeValue
    
    
    
    //数组中 new代表添加, old代表删除
    //第一种方法
//    //数组中添加元素
//    [[self.car mutableArrayValueForKey:@"people"] addObject:[NSString stringWithFormat:@"people_%ld", self.car.distanceValue]];
//    //删除数组中元素
//    [[self.car mutableArrayValueForKey:@"people"] removeObject:[NSString stringWithFormat:@"people_%ld", self.car.distanceValue]];
    
    //第二种方法,重写 insert方法和 remove方法
    //必须同时重写insert 和 remove方法  !!!!!!!!!!
    //往数组中添加元素
    [self.car insertObject:[NSString stringWithFormat:@"people_%ld", self.car.distanceValue] inPeopleAtIndex:0];
    //删除数组中的元素
    [self.car removeObjectFromPeopleAtIndex:0];
    
    
}

//观察者触发的方法,只要被观察者Car的属性改变,就触发该方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSLog(@"%@", change);
    NSLog(@"%@", keyPath);

    if ([keyPath isEqualToString:@"distanceValue"]) {
        self.label.text = [NSString stringWithFormat:@"%@ KM", [change objectForKey:@"new"]];
        //如果距离超过10KM就移除观察者
        if ([[change objectForKey:@"new"] isEqual:@10]) {
            //移除观察者
            [_car removeObserver:self forKeyPath:@"distanceValue"];
        }
    }
    if ([keyPath isEqualToString:@"oilValue"]) {
        self.label1.text = [NSString stringWithFormat:@"%@ L", [change objectForKey:@"new"]];
        if (_car.oilValue == 0) {
            self.label1.text = @"没油了";
            self.label1.backgroundColor = [UIColor redColor];
        }
        //移除观察者
        if ([[change objectForKey:@"new"] isEqual:@0]) {
            [_car removeObserver:self forKeyPath:@"oilValue"];
        }
    }
    
    //一对多
    if ([keyPath isEqualToString:@"people"]) {
        NSLog(@"%@", context);
        NSLog(@"人数:%@", [change objectForKey:@"new"]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
