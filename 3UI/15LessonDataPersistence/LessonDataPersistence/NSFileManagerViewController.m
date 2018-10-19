//
//  NSFileManagerViewController.m
//  LessonDataPersistence
//
//  Created by apple on 16/5/10.
//  Copyright © 2016年 lanouhn0. All rights reserved.
//

#import "NSFileManagerViewController.h"

@interface NSFileManagerViewController ()

@end

@implementation NSFileManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    // Do any additional setup after loading the view.
    
    //创建文件夹
    [self createDir];
    
    //创建文件
    [self createFile];
    
    //文件属性
    [self fileAttributes];
    
    //文件删除
    [self deleteFile];
}

//创建文件夹
- (void)createDir {
    NSString *documentsPath = [self dirDoc];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testDirectoryPath = [documentsPath stringByAppendingPathComponent:@"test"];
    //创建目录
    BOOL isSuccess = [fileManager createDirectoryAtPath:testDirectoryPath withIntermediateDirectories:YES attributes:nil error:nil];
    if (isSuccess) {
        NSLog(@"文件夹创建成功");
    }else {
        NSLog(@"文件夹创建失败");
    }
}

//创建文件
- (void)createFile {
    NSString *documentsPath = [self dirDoc];
    NSString *testDirectory = [documentsPath stringByAppendingPathComponent:@"test"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testPath = [testDirectory stringByAppendingPathComponent:@"test.txt"];
    BOOL isSuccess = [fileManager createFileAtPath:testPath contents:nil attributes:nil];
    if (isSuccess) {
        NSLog(@"文件创建成功: %@", testPath);
    }else {
        NSLog(@"文件创建失败");
    }
    NSLog(@"文件是否存在: %@",[fileManager fileExistsAtPath:testPath]?@"YES":@"NO");

}

//获取Documents目录路径
- (NSString *)dirDoc {
//    [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"app_home_doc: %@", documentsDirectory);
    return documentsDirectory;
}

//删除文件
- (void)deleteFile {
    NSString *documentsPath = [self dirDoc];
    NSString *testDirectory = [documentsPath stringByAppendingPathComponent:@"test"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testPath = [testDirectory stringByAppendingPathComponent:@"test.txt"];
    BOOL isSuccess = [fileManager removeItemAtPath:testPath error:nil];
    if (isSuccess) {
        NSLog(@"删除文件成功");
    }else {
        NSLog(@"删除文件失败");
    }
    NSLog(@"文件是否存在: %@",[fileManager isExecutableFileAtPath:testPath]?@"YES":@"NO");

}

//文件属性
- (void)fileAttributes {
    NSString *documentsPath = [self dirDoc];
    NSString *testDirectory = [documentsPath stringByAppendingPathComponent:@"test"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *testPath = [testDirectory stringByAppendingPathComponent:@"test.txt"];
    NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:testPath error:nil];
    NSArray *keys;
    id key, value;
    keys = [fileAttributes allKeys];
    NSInteger count = [keys count];
    for (int i = 0; i < count; i++) {
        key = [keys objectAtIndex:i];
        value = [fileAttributes objectForKey:key];
        NSLog(@"key: %@ for value: %@", key, value);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
