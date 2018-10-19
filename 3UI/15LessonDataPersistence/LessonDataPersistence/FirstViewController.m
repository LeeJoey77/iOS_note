//
//  FirstViewController.m
//  LessonDataPersistence
//
//  Created by lanouhn on 15/11/20.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (retain, nonatomic) IBOutlet UITextField *firstTF;
@property (retain, nonatomic) IBOutlet UITextField *secondTF;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
 文件读取支持类型:(字符串, 数组, 字典, 二进制数据(NSData))
 1.写入文件
 writeToFile:atomically: --- 针对于数组,字典,二进制数据
 writeToFile:atomically:encoding:error: --- 针对于字符串
 
 2.从文件中读取数据
 [类名  类名withContentsOfFile:(文件路径)]; --- 针对于数组, 字典, 二进制数据
 [类名  类名withContentsOfFile:(文件路径) encoding:error:]; --- 针对于字符串
 
 3.对于数组, 字典等大容器来说,如果想要实现文件的读写,必须保证容器中的元素也是字符串, 数组, 字典, 二进制数据类型之一.
 */

//数据持久化方式二:写入, 读取
//写入Button点击事件
- (IBAction)handleWriteButton:(id)sender {
    /*
    //1.字符串写入文件
    //让第二个输入框显示第一个输入框与以前文件拼接形成的字符串
    //写之前先读取原文件中的内容
    NSError *error = nil;
    NSString *oldStr = [NSString stringWithContentsOfFile:[self filePath] encoding:NSUTF8StringEncoding error:&error];
    //将原有数据与新数据拼接在一起
    NSString *newStr = [oldStr stringByAppendingFormat:@"%@", self.firstTF.text];
    if (!newStr) {
        newStr = self.firstTF.text;//避免第一次拼接为空时,写入失败
    }
    //atomically 保证写入安全,一次只能由一个进程写入
    BOOL isSuccess = [newStr writeToFile:[self filePath] atomically:YES encoding:NSUTF8StringEncoding error:&error];//error参数是 NSError ** 双重指针类型
    if (isSuccess) {
        NSLog(@"写入成功");
    }else {
        NSLog(@"写入失败");
    }
    */
    
    /**/
    //2.数组写入文件
    //让第二个输入框显示第一个输入框的内容,第一个输入框显示第二个输入框的内容
    NSArray *dataArray = @[self.firstTF.text, self.secondTF.text];
    [dataArray writeToFile:[self filePath] atomically:YES];//返回值为BOOL型
    
    
    /*
    //3.字典写入文件
    //让第二个输入框显示第一个输入框的内容,第一个输入框显示第二个输入框的内容
    NSDictionary *dataDic = @{@"firstTF":self.firstTF.text, @"secondTF":self.secondTF.text};
    [dataDic writeToFile:[self filePath] atomically:YES];//返回值为BOOL型
    */
}

//读取Button点击事件
- (IBAction)handleReadButton:(id)sender {
    /*
    //1.从文件中读取字符串
    NSString *text = [NSString stringWithContentsOfFile:[self filePath] encoding:NSUTF8StringEncoding error:nil];
    self.secondTF.text = text;
    */
    
    /**/
    //2.从文件中读取字符串数组
    NSArray *dataArray = [NSArray arrayWithContentsOfFile:[self filePath]];
    self.firstTF.text = [dataArray lastObject];
    self.secondTF.text = [dataArray firstObject];
    
    
    /*
    //3.从文件中读取字符串字典
    NSDictionary *dataDic = [NSDictionary dictionaryWithContentsOfFile:[self filePath]];
    self.firstTF.text = dataDic[@"secondTF"];
    self.secondTF.text = dataDic[@"firstTF"];
    */
}

//获取文件路径
- (NSString *)filePath {
    
    //1.获取Documents(存放永久存储的数据)文件夹路径
    //该方法一开始是用于MacOS开发,对于PC端来说,可以有多个用户,所以获取时,会获取到所有用户的文件夹路径.但是该方法用于iOS开发时,移动端用户只有一个,所以获取到的路径也只有一个
    //参数:(1)查找的文件路径 (2)在哪个域中查找 (3)是否显示详细路径
    NSArray *documentDirectoryPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [documentDirectoryPaths firstObject];
    //2.拼接上文件路径,字符串后缀写txt
    NSString *filePath = [documentPath stringByAppendingPathComponent:@"lanou.txt"];
    /*
    //或
    NSString *homePath = NSHomeDirectory();
    NSString *filePath = [homePath stringByAppendingPathComponent:@"/Documents/lanou.txt"];
    */
    NSLog(@"%@+++++++", filePath);
    return filePath;
}

- (IBAction)handlePushButton:(id)sender {
    [self performSegueWithIdentifier:@"segue" sender:nil];
}

- (void)dealloc {
    [_firstTF release];
    [_secondTF release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
