//
//  RootViewController.m
//  LessonThread
//
//  Created by lanouhn on 15/12/1.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "RootViewController.h"
#import "Singleton.h"

@interface RootViewController ()


@end

@implementation RootViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Singleton *si = [Singleton mainSingleton];
    NSLog(@"%p", &si);
    
    [self testMethod];
    [self testMethod];
    [self setupButtons];
}

- (void)testMethod {
    static NSInteger num = 3;
    num += 1;
    NSLog(@"%ld", (long)num);
}

- (void)setupButtons {
    //GCD中的队列分为并发队列和串行队列两类
    //不管是串行还是并行，队列都是按照FIFO的原则依次触发任务
    //两个通用队列：
    //串行队列：所有任务会在一条线程中执行（有可能是当前线程也有可能是新开辟的线程），并且一个任务执行完毕后，才开始执行下一个任务。（等待完成）
    //并行队列：可以开启多条线程并行执行任务（但不一定会开启新的线程），并且当一个任务放到指定线程开始执行时，下一个任务就可以开始执行了。（等待发生）
    
    //两个特殊队列:
    //主队列(main queue)：是Serial Queue中特殊的一种。只能在主线程中进行，并且主队列里面的任务，只有当主线程空闲的时候才能被执行。用来刷新UI使用。
    //全局队列(global queue)：系统为我们创建好的一个并行队列，使用起来与我们自己创建的并行队列无本质差别。用来执行耗时操作。
    
    //任务执行方式
    //说完队列，相应的，任务除了管理，还得执行, 并且在GCD中并不能直接开辟线程执行任务，所以在任务加入队列之后，GCD给出了两种执行方式——同步执行（sync）和异步执行（async）。
    //同步执行：在当前线程执行任务，不会开辟新的线程。必须等到Block函数执行完毕后，dispatch函数才会返回。
    //异步执行：可以在新的线程中执行任务，但不一定会开辟新的线程。dispatch函数会立即返回, 然后Block在后台异步执行。
    
    //如果有多任务，首选global Queue + 异步。单任务、刷新UI就用main Queue + 异步。
    NSArray *array = @[@"串行队列", @"并行对列", @"分组队列", @"一次", @"障碍队列", @"延迟", @"重复"];
    for (int i = 0; i < 7; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(100, 100 + i * 60, 200, 50);
        button.backgroundColor = [UIColor cyanColor];
        [button setTitle:array[i] forState:UIControlStateNormal];
        button.tag = 100 + i;
        [button addTarget:self action:@selector(handleButtonAction:)forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        [button release];
    }
}

- (void)handleButtonAction:(UIButton *)sender {
    switch (sender.tag) {
        case 100: {//串行队列
            //1.创建串行队列对象
            //(1)获取系统创建好的串行队列,在主线程中实现线程同步
            dispatch_queue_t queue1 = dispatch_get_main_queue();
            //(2)自己创建串行队列,任务在子线程中实现线程同步
            dispatch_queue_t queue2 = dispatch_queue_create("com.lanou3g.leo", DISPATCH_QUEUE_SERIAL);//字符串是对列的唯一标示,DISPATCH_QUEUE_SERIAL是指定为串行队列
            //2.往队列中添加任务
            dispatch_async(queue1, ^{
                NSLog(@"任务一 %@", [NSThread currentThread]);
            });
            dispatch_async(queue2, ^{
                NSLog(@"任务二 %@", [NSThread currentThread]);
            });
            dispatch_async(queue2, ^{
                NSLog(@"任务三 %@", [NSThread currentThread]);
            });
            dispatch_async(queue2, ^{
                NSLog(@"任务四 %@", [NSThread currentThread]);
            });
            //释放
            dispatch_release(queue2);
            break;
        }
        case 101: {//并行队列
            //1.创建并行(并发)队列,系统创建好了四个
            //(1)使用系统创建好的并发队列
            dispatch_queue_t queue1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);//两个参数分别是:优先级,预留参数
            //(2)自己创建并发队列
            dispatch_queue_t queue2 = dispatch_queue_create("com.lanou3g.frank", DISPATCH_QUEUE_CONCURRENT);//字符串是指定唯一标示,DISPATCH_QUEUE_CONCURRENT是指定的并发队列
            //2.往队列中添加任务
            dispatch_async(queue1, ^{
                NSLog(@"任务一 %@", [NSThread currentThread]);
            });
            dispatch_async(queue2, ^{
                NSLog(@"任务二 %@", [NSThread currentThread]);
            });
            dispatch_async(queue2, ^{
                NSLog(@"任务三 %@", [NSThread currentThread]);
            });
            dispatch_async(queue2, ^{
                //请求图片数据
                //跳转到主线程刷新界面
                dispatch_sync(dispatch_get_main_queue(), ^{
                    //更新UI显示的图片
                    
                });
            });
            dispatch_release(queue2);
            break;
        }
        case 102: {//分组对列
            //1.创建并行队列
            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            //2.创建分组
            dispatch_group_t group = dispatch_group_create();
            //3.往分组中添加任务
            dispatch_group_async(group, queue, ^{
                NSLog(@"请求 0 - 10M的数据");
            });
            dispatch_group_async(group, queue, ^{
                NSLog(@"请求 10 - 20M的数据");
            });
            dispatch_group_async(group, queue, ^{
                NSLog(@"how to live a life");
            });
            dispatch_group_async(group, queue, ^{
                NSLog(@"i can");
            });
            dispatch_group_async(group, queue, ^{
                NSLog(@"no");
            });
            //4.当分组内的所有任务完成之后
            dispatch_group_notify(group, queue, ^{
                NSLog(@"拼接数据操作");
            });
            //5.释放
            dispatch_release(group);
            break;
        }
        case 103: {//一次
            
            //如单例Singleton
            break;
        }
        case 104: {//障碍队列
            //障碍任务的作用:可以保证障碍之后到的并发的任务,必须在障碍之前的并发任务全部执行结束之后,才可以继续往下执行
            //注意:如果要添加障碍任务,必须要使用自己创建的并发队列
            
            //创建并发队列
            dispatch_queue_t queue = dispatch_queue_create("com.lanou3g.zhengzhou", DISPATCH_QUEUE_CONCURRENT);
            //往队列中添加任务
            dispatch_async(queue, ^{
                NSLog(@"A 写入文件File1");
            });
            dispatch_async(queue, ^{
                NSLog(@"B 写入文件File2");
            });
            dispatch_async(queue, ^{
                NSLog(@"C 写入文件File3");
            });
            dispatch_async(queue, ^{
                NSLog(@"D 写入文件File4");
            });
            
            //添加障碍任务
            dispatch_barrier_async(queue, ^{
                NSLog(@"这是一个障碍任务");
            });
            dispatch_async(queue, ^{
                NSLog(@"E 读取文件File1");
            });
            dispatch_async(queue, ^{
                NSLog(@"F 读取文件File2");
            });
            
            //释放
            dispatch_release(queue);
            break;
        }
        case 105: {//延迟
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                NSLog(@"延迟5秒");
            });//dispatch_get_main_queue 在主线程中执行,如果想在子线程中执行,此处改为子线程即可
            break;
        }
        case 106: {//重复
            //反复执行并发队列,至少有一次在主线程中执行
            dispatch_apply(10, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t index) {
                NSLog(@"反复执行的次数%ld,当前线程%@", index, [NSThread currentThread]);
            });//size_t 之后要添加参数名,例如index

            break;
        }
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
