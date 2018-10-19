//
//  NSOperationViewController.m
//  LessonThread
//
//  Created by admin on 2018/5/21.
//  Copyright © 2018年 lanouhn0. All rights reserved.
//


#import "NSOperationViewController.h"
#import "KCImageData.h"
#define ROW_COUNT 5
#define COLUMN_COUNT 3
#define ROW_HEIGHT 100
#define ROW_WIDTH ROW_HEIGHT
#define CELL_SPACING 10
#define IMAGE_COUNT 15

@interface NSOperationViewController ()
@property (nonatomic, strong) NSMutableArray *imageViewArr;
@property (nonatomic, strong) NSMutableArray *imageNameArr;
@end

@implementation NSOperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
     使用NSOperation和NSOperationQueue进行多线程开发类似于C#中的线程池，只要将一个NSOperation（实际开中需要使用其子类NSInvocationOperation、NSBlockOperation）放到NSOperationQueue这个队列中线程就会依次启动。NSOperationQueue负责管理、执行所有的NSOperation，在这个过程中可以更加容易的管理线程总数和控制线程之间的依赖关系。
     
     NSOperation有两个常用子类用于创建线程操作：NSInvocationOperation和NSBlockOperation，两种方式本质没有区别，但是是后者使用Block形式进行代码组织，使用相对方便。
     */
    /*
     使用NSBlockOperation方法，所有的操作不必单独定义方法，同时解决了只能传递一个参数的问题。
     调用主线程队列的addOperationWithBlock:方法进行UI更新，不用再定义一个参数实体（之前必须定义一个KCImageData解决只能传递一个参数的问题）。
     使用NSOperation进行多线程开发可以设置最大并发线程，有效的对线程进行了控制（上面的代码运行起来你会发现打印当前进程时只有有限的线程被创建，如上面的代码设置最大线程数为5，则图片基本上是五个一次加载的）。

     */
    [self layoutUI];

}

#pragma mark 界面布局
-(void)layoutUI{
    //创建多个图片控件用于显示图片
    self.imageViewArr = [NSMutableArray array];
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
    self.imageNameArr = [NSMutableArray array];
    for (int i=0; i<IMAGE_COUNT; i++) {
        [self.imageNameArr addObject:[NSString stringWithFormat:@"https://imgs.qunarzz.com/p/tts6/1801/e2/5193811a5790a102.jpg_r_390x260x90_55bca04a.jpg"]];
    }
}

#pragma mark 将图片显示到界面
-(void)updateImageWithData:(NSData *)data andIndex:(int )index{
    UIImage *image=[UIImage imageWithData:data];
    UIImageView *imageView= self.imageViewArr[index];
    imageView.image=image;
}

#pragma mark 请求图片数据
-(NSData *)requestData:(int )index{
    NSURL *url=[NSURL URLWithString:self.imageNameArr[index]];
    NSData *data=[NSData dataWithContentsOfURL:url];
    
    return data;
}

#pragma mark 加载图片
-(void)loadImage:(NSNumber *)index{
    int i=[index integerValue];
    
    //请求数据
    NSData *data= [self requestData:i];
    NSLog(@"%@",[NSThread currentThread]);
    //更新UI界面,此处调用了主线程队列的方法（mainQueue是UI主线程）
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self updateImageWithData:data andIndex:i];
    }];
}

#pragma mark 多线程下载图片
-(void)loadImageWithMultiThread{
    int count=ROW_COUNT*COLUMN_COUNT;
    /*
    //创建操作队列
    NSOperationQueue *operationQueue=[[NSOperationQueue alloc]init];
    operationQueue.maxConcurrentOperationCount=5;//设置最大并发线程数
    //创建多个线程用于填充图片
    for (int i=0; i<count; ++i) {
        //方法1：创建操作块添加到队列
        //        //创建多线程操作
        //        NSBlockOperation *blockOperation=[NSBlockOperation blockOperationWithBlock:^{
        //            [self loadImage:[NSNumber numberWithInt:i]];
        //        }];
        //        //创建操作队列
        //
        //        [operationQueue addOperation:blockOperation];
        
        //方法2：直接使用操队列添加操作
        [operationQueue addOperationWithBlock:^{
            [self loadImage:[NSNumber numberWithInt:i]];
        }];
        
    }
    */
    
    /**创建一个调用操作
     object:调用方法参数
     */
    /*
    NSInvocationOperation *invocationOperation=[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(loadImage) object:nil];
    //创建完NSInvocationOperation对象并不会调用，它由一个start方法启动操作，但是注意如果直接调用start方法，则此操作会在主线程中调用，一般不会这么操作,而是添加到NSOperationQueue中
    //    [invocationOperation start];
    
    //创建操作队列
    NSOperationQueue *operationQueue=[[NSOperationQueue alloc]init];
    //注意添加到操作队后，队列会开启一个线程执行此操作
    [operationQueue addOperation:invocationOperation];
    */
    
    //线程执行顺序
    /*
     前面使用NSThread很难控制线程的执行顺序，但是使用NSOperation就容易多了，每个NSOperation可以设置依赖线程。假设操作A依赖于操作B，线程操作队列在启动线程时就会首先执行B操作，然后执行A。对于前面优先加载最后一张图的需求，只要设置前面的线程操作的依赖线程为最后一个操作即可
     
     可以看到虽然加载最后一张图片的操作最后被加入到操作队列，但是它却是被第一个执行的。操作依赖关系可以设置多个，例如A依赖于B、B依赖于C…但是千万不要设置为循环依赖关系（例如A依赖于B，B依赖于C，C又依赖于A），否则是不会被执行的。
     */
    //创建操作队列
    NSOperationQueue *operationQueue=[[NSOperationQueue alloc]init];
    operationQueue.maxConcurrentOperationCount=5;//设置最大并发线程数
    
    NSBlockOperation *lastBlockOperation=[NSBlockOperation blockOperationWithBlock:^{
        [self loadImage:[NSNumber numberWithInt:(count-1)]];
    }];
    //创建多个线程用于填充图片
    for (int i=0; i<count-1; ++i) {
        //方法1：创建操作块添加到队列
        //创建多线程操作
        NSBlockOperation *blockOperation=[NSBlockOperation blockOperationWithBlock:^{
            [self loadImage:[NSNumber numberWithInt:i]];
        }];
        //设置依赖操作为最后一张图片加载操作
        [blockOperation addDependency:lastBlockOperation];
        
        [operationQueue addOperation:blockOperation];
        
    }
    //将最后一个图片的加载操作加入线程队列
    [operationQueue addOperation:lastBlockOperation];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
