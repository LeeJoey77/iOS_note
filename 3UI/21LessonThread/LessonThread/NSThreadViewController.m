//
//  NSThreadViewController.m
//  LessonThread
//
//  Created by admin on 2018/5/21.
//  Copyright © 2018年 lanouhn0. All rights reserved.
//

#import "NSThreadViewController.h"
#import "KCImageData.h"
#define ROW_COUNT 5
#define COLUMN_COUNT 3
#define ROW_HEIGHT 100
#define ROW_WIDTH ROW_HEIGHT
#define CELL_SPACING 10
#define IMAGE_COUNT 15
@interface NSThreadViewController ()
@property (nonatomic, strong) UIImageView *imageV;
@property (nonatomic, strong) NSMutableArray *imageViewArr;
@property (nonatomic, strong) NSMutableArray *imageNameArr;
@property (nonatomic, strong) NSMutableArray *threadArr;

@end

@implementation NSThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //NSThread是轻量级的多线程开发，需要自己管理线程生命周期。
    //可以使用对象方法 detachNewThreadSelector 直接将操作添加到线程中并启动，也可以使用对象方法 initWithTarget 创建一个线程对象，然后调用start方法启动线程。
    //单线程
//    [self layoutUI];
    
    //多线程
//    [self layoutMutiUI];
    
    //线程状态
    [self layoutUI];
}
/*
#pragma mark --------------------- 解决线程阻塞问题
//在资源下载过程中，由于网络原因有时候很难保证下载时间，如果不使用多线程可能用户完成一个下载操作需要长时间的等待，这个过程中无法进行其他操作。下面演示一个采用多线程下载图片的过程，在这个示例中点击按钮会启动一个线程去下载图片，下载完成后使用UIImageView将图片显示到界面中。可以看到用户点击完下载按钮后，不管图片是否下载完成都可以继续操作界面，不会造成阻塞。
//界面布局
- (void)layoutUI {
    self.imageV =[[UIImageView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    self.imageV.contentMode=UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.imageV];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(50, 600, 220, 25);
    [button setTitle:@"加载图片" forState:UIControlStateNormal];
    //添加方法
    [button addTarget:self action:@selector(loadImageWithMultiThread) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

//将图片显示到界面
- (void)updateImage:(NSData *)imageData {
    UIImage *image = [UIImage imageWithData:imageData];
    self.imageV.image = image;
}

//请求图片数据
- (NSData *)requestData {
    NSURL *url = [NSURL URLWithString:@"https://imgs.qunarzz.com/p/tts6/1801/e2/5193811a5790a102.jpg_r_390x260x90_55bca04a.jpg"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    return data;
}

//加载图片
- (void)loadImage {
    NSData *data = [self requestData];
    //将数据显示到UI控件,注意只能在主线程中更新UI,
     //另外performSelectorOnMainThread方法是NSObject的分类方法，每个NSObject对象都有此方法，
     //它调用的selector方法是当前调用控件的方法，例如使用UIImageView调用的时候selector就是UIImageView的方法
     //Object：代表调用方法的参数,不过只能传递一个参数(如果有多个参数请使用对象进行封装)
     //waitUntilDone:是否线程任务完成执行
 
    [self performSelectorOnMainThread:@selector(updateImage:) withObject:data waitUntilDone:YES];
}

//多线程下载图片
- (void)loadImageWithMultiThread {
    //方法1：使用对象方法
    //    //创建一个线程，第一个参数是请求的操作，第二个参数是操作方法的参数
    //    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(loadImage) object:nil];
    //    //启动一个线程，注意启动一个线程并非就一定立即执行，而是处于就绪状态，当系统调度时才真正执行
    //    [thread start];
    
    //方法2：使用类方法
    [NSThread detachNewThreadSelector:@selector(loadImage) toTarget:self withObject:nil];
}

*/

/*
#pragma mark --------------------- 多个线程并发
//上面这个演示并没有演示多个子线程操作之间的关系，现在不妨在界面中多加载几张图片，每个图片都来自远程请求。
//界面布局
- (void) layoutMutiUI {
    //创建多个图片控件用于显示图片
    //创建时必须用 self., 否则提前释放
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
    [button addTarget:self action:@selector(loadMutiImageWithMultiThread) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

//将图片显示到界面
- (void) updateMutilImage:(KCImageData *)imageData{
    UIImage *image=[UIImage imageWithData:imageData.data];
    UIImageView *imageView= self.imageViewArr[imageData.index];
    imageView.image=image;
}

//请求图片数据
-(NSData *)requestMutiData:(int)index{
//    NSURL *url=[NSURL URLWithString:@"https://imgs.qunarzz.com/p/tts0/1609/19/d017db2aacbdae02.jpg_r_390x260x90_645a3bd4.jpg"];
//    NSData *data=[NSData dataWithContentsOfURL:url];
    
    //2. 改变线程执行属性方式二: 线程状态
    //对非最后一张图片加载线程休眠2秒
    if (index!=(ROW_COUNT*COLUMN_COUNT-1)) {
        [NSThread sleepForTimeInterval:2.0];
    }
    NSURL *url=[NSURL URLWithString:@"https://imgs.qunarzz.com/p/tts0/1609/19/d017db2aacbdae02.jpg_r_390x260x90_645a3bd4.jpg"];
    NSData *data=[NSData dataWithContentsOfURL:url];
    
    return data;
}

//加载图片
-(void)loadMutiImage:(NSNumber *)index{
    //    NSLog(@"%i",i);
    //currentThread方法可以取得当前操作线程
    NSLog(@"current thread:%@",[NSThread currentThread]);
    
    int i = [index integerValue];
    
    //    NSLog(@"%i",i);//未必按顺序输出
    
    NSData *data= [self requestMutiData:i];
    
    KCImageData *imageData=[[KCImageData alloc]init];
    imageData.index=i;
    imageData.data=data;
    [self performSelectorOnMainThread:@selector(updateMutilImage:) withObject:imageData waitUntilDone:YES];
}

//多线程下载图片
- (void)loadMutiImageWithMultiThread{
 
    //创建多个线程用于填充图片
    for (int i=0; i <ROW_COUNT*COLUMN_COUNT; ++i) {
                [NSThread detachNewThreadSelector:@selector(loadImage:) toTarget:self withObject:[NSNumber numberWithInt:i]];
        NSThread *thread=[[NSThread alloc]initWithTarget:self selector:@selector(loadMutiImage:) object:[NSNumber numberWithInt:i]];
        thread.name=[NSString stringWithFormat:@"myThread%i",i];设置线程名称
        [thread start];
    }
 
    
    //改变线程执行顺序
    //1. 改变线程优先级
    //从上面的运行效果大家不难发现，图片并未按顺序加载，原因有两个：第一，每个线程的实际执行顺序并不一定按顺序执行（虽然是按顺序启动）；第二，每个线程执行时实际网络状况很可能不一致。当然网络问题无法改变，只能尽可能让网速更快，但是可以改变线程的优先级，让15个线程优先执行某个线程。线程优先级范围为0~1，值越大优先级越高，每个线程的优先级默认为0.5。修改图片下载方法如下，改变最后一张图片加载的优先级，这样可以提高它被优先加载的几率，但是它也未必就第一个加载。因为首先其他线程是先启动的，其次网络状况我们没办法修改：
    NSMutableArray *threads=[NSMutableArray array];
    int count=ROW_COUNT*COLUMN_COUNT;
    //创建多个线程用于填充图片
    for (int i=0; i<count; ++i) {
        //        [NSThread detachNewThreadSelector:@selector(loadImage:) toTarget:self withObject:[NSNumber numberWithInt:i]];
        NSThread *thread=[[NSThread alloc]initWithTarget:self selector:@selector(loadMutiImage:) object:[NSNumber numberWithInt:i]];
        thread.name=[NSString stringWithFormat:@"myThread%i",i];//设置线程名称
        if(i==(count-1)){
            thread.threadPriority=1.0;
        }else{
            thread.threadPriority=0.0;
        }
        [threads addObject:thread];
    }
    
    for (int i=0; i<count; i++) {
        NSThread *thread=threads[i];
        [thread start];
    }
    
}
*/

/*
#pragma mark ------------------- 线程状态
//线程状态分为isExecuting（正在执行）、isFinished（已经完成）、isCancellled（已经取消）三种。其中取消状态程序可以干预设置，只要调用线程的cancel方法即可。但是需要注意在主线程中仅仅能设置线程状态，并不能真正停止当前线程，如果要终止线程必须在线程中调用exist方法，这是一个静态方法，调用该方法可以退出当前线程。
//界面布局
-(void)layoutUI{
    //创建多个图片空间用于显示图片
    self.imageViewArr =[NSMutableArray array];
    for (int r=0; r<ROW_COUNT; r++) {
        for (int c=0; c<COLUMN_COUNT; c++) {
            UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(c*ROW_WIDTH+(c*CELL_SPACING), r*ROW_HEIGHT+(r*CELL_SPACING                           ), ROW_WIDTH, ROW_HEIGHT)];
            imageView.contentMode=UIViewContentModeScaleAspectFit;
            //            imageView.backgroundColor=[UIColor redColor];
            [self.view addSubview:imageView];
            [self.imageViewArr addObject:imageView];
            
        }
    }
    
    //加载按钮
    UIButton *buttonStart=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonStart.frame=CGRectMake(50, 500, 100, 25);
    [buttonStart setTitle:@"加载图片" forState:UIControlStateNormal];
    [buttonStart addTarget:self action:@selector(loadImageWithMultiThread) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonStart];
    
    //停止按钮
    UIButton *buttonStop=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    buttonStop.frame=CGRectMake(160, 500, 100, 25);
    [buttonStop setTitle:@"停止加载" forState:UIControlStateNormal];
    [buttonStop addTarget:self action:@selector(stopLoadImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonStop];
    
    //创建图片链接
    self.imageNameArr =[NSMutableArray array];
    for (int i=0; i<IMAGE_COUNT; i++) {
        [self.imageNameArr addObject:[NSString stringWithFormat:@"https://imgs.qunarzz.com/p/tts0/1609/19/d017db2aacbdae02.jpg_r_390x260x90_645a3bd4.jpg"]];
    }
}
     
//将图片显示到界面
- (void) updateImage:(KCImageData *)imageData{
         UIImage *image=[UIImage imageWithData:imageData.data];
         UIImageView *imageView= self.imageViewArr[imageData.index];
         imageView.image=image;
     }
     
//请求图片数据
- (NSData *) requestData:(int )index{
         NSURL *url=[NSURL URLWithString:self.imageNameArr[index]];
         NSData *data=[NSData dataWithContentsOfURL:url];
         return data;
     }
     
//加载图片
- (void) loadImage:(NSNumber *)index{
         int i=[index integerValue];
         
         NSData *data= [self requestData:i];
         
         
         NSThread *currentThread=[NSThread currentThread];
         
         //    如果当前线程处于取消状态，则退出当前线程
         if (currentThread.isCancelled) {
             NSLog(@"thread(%@) will be cancelled!",currentThread);
             [NSThread exit];//取消当前线程
         }
         
         KCImageData *imageData=[[KCImageData alloc]init];
         imageData.index=i;
         imageData.data=data;
         [self performSelectorOnMainThread:@selector(updateImage:) withObject:imageData waitUntilDone:YES];
     }
     
//多线程下载图片
- (void) loadImageWithMultiThread{
         int count=ROW_COUNT*COLUMN_COUNT;
         self.threadArr=[NSMutableArray arrayWithCapacity:count];
         
         //创建多个线程用于填充图片
         for (int i=0; i<count; ++i) {
             NSThread *thread=[[NSThread alloc]initWithTarget:self selector:@selector(loadImage:) object:[NSNumber numberWithInt:i]];
             thread.name=[NSString stringWithFormat:@"myThread%i",i];//设置线程名称
             [self.threadArr addObject:thread];
         }
         //循环启动线程
         for (int i=0; i<count; ++i) {
             NSThread *thread= self.threadArr[i];
             [thread start];
         }
     }
     
//停止加载图片
- (void)stopLoadImage {
         for (int i=0; i<ROW_COUNT*COLUMN_COUNT; i++) {
             NSThread *thread= self.threadArr[i];
             //判断线程是否完成，如果没有完成则设置为取消状态
             //注意设置为取消状态仅仅是改变了线程状态而言，并不能终止线程
             if (!thread.isFinished) {
                 [thread cancel];
             }
         }
}
*/


/*
#pragma mark ------------------- 扩展--NSObject分类扩展方法

为了简化多线程开发过程，苹果官方对NSObject进行分类扩展(本质还是创建NSThread)，对于简单的多线程操作可以直接使用这些扩展方法。

- (void)performSelectorInBackground:(SEL)aSelector withObject:(id)arg：在后台执行一个操作，本质就是重新创建一个线程执行当前方法。

- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(id)arg waitUntilDone:(BOOL)wait：在指定的线程上执行一个方法，需要用户创建一个线程对象。

- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(id)arg waitUntilDone:(BOOL)wait：在主线程上执行一个方法（前面已经使用过）。


//例如前面加载图多个图片的方法，可以改为后台线程执行：

- (void) loadImageWithMultiThread {
    int count=ROW_COUNT*COLUMN_COUNT;
    for (int i=0; i<count; ++i) {
        [self performSelectorInBackground:@selector(loadImage:) withObject:[NSNumber numberWithInt:i]];
    }
}

*/


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
