//
//  SecondViewController.m
//  LessonDataPersistence
//
//  Created by lanouhn on 15/11/20.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "SecondViewController.h"
#import "Contact.h"

@interface SecondViewController ()
@property (retain, nonatomic) IBOutlet UITextField *firstTF;
@property (retain, nonatomic) IBOutlet UITextField *secondTF;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//数据持久化方式三:归档, 需要服从NSCoding协议(Contact类.h中服从)
//归档:非基本数据类型 --- 归档 --- NSData --- 写入文件
//反归档:读取文件 --- NSData --- 反归档 --- 非基本数据类型

//归档
- (IBAction)archiveButtonAction:(id)sender {
    Contact *contact = [[Contact alloc] initWithName:self.firstTF.text gender:self.secondTF.text age:17 phone:@"1992"];
    //1.创建归档工具对象
    NSMutableData *mData = [NSMutableData data];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:mData];
    //2.归档,自动调用NSCoding协议中的encodeWithCoder:aCoder方法
    [archiver encodeObject:contact forKey:@"key"];
    //3.结束归档
    [archiver finishEncoding];
    
    //4.data 写入文件
    [mData writeToFile:[self filePath] atomically:YES];
    
    //内存释放
    [contact release];
    [archiver release];
}

//反归档
- (IBAction)antiarchiveButtonAction:(id)sender {
    //1.data 从本地读取数据
    NSData *data = [NSData dataWithContentsOfFile:[self filePath]];
    //2.创建反归档工具
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    //3.反归档,自动调用NSCoding协议中的initWithCoder:aDecoder方法
    Contact *contact = [unarchiver decodeObjectForKey:@"key"];//对应归档时的key
    //4.结束反归档
    [unarchiver finishDecoding];
    
    //内存释放
    [unarchiver release];
    
    //让第一个textField显示联系人年龄,第二个textField显示联系人电话
    self.firstTF.text = [NSString stringWithFormat:@"%ld", contact.age];
    self.secondTF.text = contact.phone;
    
}

//获取文件路径的方法
- (NSString *)filePath {
    //1.获取documents文件夹路径
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    //2.拼接上存储文件的路径,二进制后缀为data
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"Xialuo.data"];
    return filePath;
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
