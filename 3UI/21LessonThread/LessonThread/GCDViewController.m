//
//  GCDViewController.m
//  LessonThread
//
//  Created by admin on 2018/5/21.
//  Copyright © 2018年 lanouhn0. All rights reserved.
//

#import "GCDViewController.h"
#define ROW_COUNT 5
#define COLUMN_COUNT 3
#define ROW_HEIGHT 100
#define ROW_WIDTH ROW_HEIGHT
#define CELL_SPACING 10
#define IMAGE_COUNT 15
@interface GCDViewController ()
@property (nonatomic, strong) NSMutableArray *imageViewArr;
@property (nonatomic, strong) NSMutableArray *imageNameArr;
@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //GCD中的队列分为并发队列和串行队列两类：
    //串行队列(Serial Queue)：只有一个线程，加入到队列中的操作按添加顺序依次执行。
    //并发队列(Concurrent Queue)：有多个线程，操作进来之后它会将这些队列安排在可用的处理器上，同时保证先进来的任务优先处理。
    
    //主队列(main queue)：是Serial Queue中特殊的一种。只能在主线程中进行，并且主队列里面的任务，只有当主线程空闲的时候才能被执行。用来刷新UI使用。
    //全局队列(global queue)：是Concurrent Queue中特殊的一种。用来执行耗时操作。
    
    //异步（asynchronous）具备开启新线程的能力，也具备跳过当前代码继续往下执行的能力。
    //同步(synchronous)不具备开启新线程的能力，也不具备跳过当前代码继续往下执行的能力。
    
    //在GDC中一个操作是多线程执行还是单线程执行取决于当前队列类型和执行方法，只有队列类型为并行队列并且使用异步方法执行时才能在多个线程中执行。
    //串行队列可以按顺序执行，并行队列的异步方法无法确定执行顺序。
    //如果有多任务，首选global Queue + 异步。单任务、刷新UI就用main Queue + 同步。
    
    [self layoutUI];
}

//界面布局
-(void)layoutUI{
    //创建多个图片控件用于显示图片
    self.imageViewArr=[NSMutableArray array];
    for (int r=0; r<ROW_COUNT; r++) {
        for (int c=0; c<COLUMN_COUNT; c++) {
            UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(c*ROW_WIDTH+(c*CELL_SPACING),100 +  r*ROW_HEIGHT+(r*CELL_SPACING                           ), ROW_WIDTH, ROW_HEIGHT)];
            imageView.contentMode=UIViewContentModeScaleAspectFit;
            //            imageView.backgroundColor=[UIColor redColor];
            [self.view addSubview:imageView];
            [self.imageViewArr addObject:imageView];
            
        }
    }
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(50, 500, 220, 25);
    [button setTitle:@"加载图片" forState:UIControlStateNormal];
    //添加方法
    [button addTarget:self action:@selector(loadImageWithMultiThread) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //创建图片链接
    self.imageNameArr=[NSMutableArray array];
    for (int i=0; i<ROW_COUNT*COLUMN_COUNT; i++) {
        [self.imageNameArr addObject:[NSString stringWithFormat:@"https://imgs.qunarzz.com/p/tts6/1801/e2/5193811a5790a102.jpg_r_390x260x90_55bca04a.jpg"]];
    }
    
}

//将图片显示到界面
-(void)updateImageWithData:(NSData *)data andIndex:(int )index{
    UIImage *image=[UIImage imageWithData:data];
    UIImageView *imageView= self.imageViewArr[index];
    imageView.image=image;
}

//请求图片数据
-(NSData *)requestData:(int )index{
    NSURL *url=[NSURL URLWithString:self.imageNameArr[index]];
    NSData *data=[NSData dataWithContentsOfURL:url];
    
    return data;
}

//加载图片
- (void)loadImage:(NSNumber *)index {
    NSLog(@"thread is: %@", [NSThread currentThread]);
    int i = [index integerValue];
    //请求数据
    NSData *data = [self requestData:i];
    //生成一个串行队列，队列中的block按照先进先出（FIFO）的顺序去执行，实际上为单线程执行。第一个参数是队列的名称，在调试程序时会非常有用，所有尽量不要重名了
    //更新 UI 界面, 此处调用了 GCD 主线程队列的方法, 串行队列
    //实际编程经验告诉我们，尽可能避免使用dispatch_sync，多个 dispatch_sync 嵌套使用时还容易引起程序死锁。
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    //同步
    dispatch_sync(mainQueue, ^{
        [self updateImageWithData:data andIndex:i];
    });
}

//串行队列
//使用串行队列时首先要创建一个串行队列，然后调用异步调用方法，在此方法中传入串行队列和线程操作即可自动执行。下面使用线程队列演示图片的加载过程，你会发现多张图片会按顺序加载，因为当前队列中只有一个线程。
//多线程下载图片
/*
- (void)loadImageWithMultiThread {
    //注意 serialQueue 是对象不是指针类型
    dispatch_queue_t serialQueue = dispatch_queue_create("com.beibei.nao", DISPATCH_QUEUE_SERIAL);
    //创建多个线程
    for (int i = 0; i < IMAGE_COUNT ; i++) {
        //异步
        dispatch_async(serialQueue, ^{
            [self loadImage:[NSNumber numberWithInt:i]];
        });
    }
    //非ARC环境请释放
    dispatch_release(serialQueue);
}
*/

//并发队列
//并发队列同样是使用dispatch_queue_create()方法创建，只是最后一个参数指定为DISPATCH_QUEUE_CONCURRENT进行创建，但是在实际开发中我们通常不会重新创建一个并发队列而是使用dispatch_get_global_queue()方法取得一个全局的并发队列（当然如果有多个并发队列可以使用前者创建）。下面通过并行队列演示一下多个图片的加载。代码与上面串行队列加载类似，只需要修改照片加载方法如下：
-(void)loadImageWithMultiThread{
    int count=ROW_COUNT*COLUMN_COUNT;
    
    //取得全局队列
    //第一个参数：线程优先级
    //第二个参数：标记参数，目前没有用，一般传入0
 
    dispatch_queue_t globalQueue=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //创建多个线程用于填充图片
    for (int i=0; i<count; ++i) {
        //异步执行队列任务
        dispatch_async(globalQueue, ^{
            [self loadImage:[NSNumber numberWithInt:i]];
        });
    }
}


//GCD中还有dispatch_async()异步调用方法，还有一个dispatch_sync()方法同步调用方法
//使用同步方法, 所有图片的加载全部在主线程中（可以打印线程查看），主线程被阻塞，造成图片最终是一次性显示。可以得出结论：

//在GDC中一个操作是多线程执行还是单线程执行取决于当前队列类型和执行方法，只有队列类型为并行队列并且使用异步方法执行时才能在多个线程中执行。
//串行队列可以按顺序执行，并行队列的异步方法无法确定执行顺序。
//UI界面的更新最好采用同步方法，其他操作采用异步方法。

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
