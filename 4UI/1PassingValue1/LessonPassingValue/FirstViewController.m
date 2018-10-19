//
//  FirstViewController.m
//  LessonPassingValue
//
//  Created by lanouhn on 15/12/3.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "FirstViewController.h"
@interface FirstViewController ()
@property (nonatomic, retain) UITextField *textField;

@end

@implementation FirstViewController

- (void)dealloc
{
    self.textField = nil;
    self.returnValue = nil;
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];
    [self setupTF];
    
    //配置导航条
    [self configureNavigationBar];
    
}

//代理传值
//- (void)viewWillDisappear:(BOOL)animated {
//    if ([self.delegate respondsToSelector:@selector(passValue:)]) {
//        [self.delegate passValue:self.textField.text];
//    }
//}


//Block 传值方式一:Block属性传值
//视图将要消失时回调
- (void)viewWillDisappear:(BOOL)animated {
    if (self.returnBool) {
        NSLog(@"%d", self.returnBool());
    }
    if (self.returnValue) {
        //调用Block
        NSLog(@"********");
        self.returnValue(self.textField.text);
    }
}

////Block 传值方式二:用自定义方法传值
- (void)returnText:(ReturnTextBlock)block {
    NSLog(@"-----");
    //让self.returnValue Block指向block
    self.returnValue = block;
}

- (void)setupTF {
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 300, 200, 40)];
    _textField.backgroundColor = [UIColor redColor];
    //(1)设置输入框的提示文字(占位符)
    _textField.placeholder = @"请输入用户名";
    [self.view addSubview:_textField];
    [_textField release];

}

- (void)configureNavigationBar {
    self.navigationItem.title = @"第一页";
    NSDictionary *dic = @{NSForegroundColorAttributeName:[UIColor blackColor], NSFontAttributeName:[UIFont systemFontOfSize:20]};
    self.navigationController.navigationBar.titleTextAttributes = dic;
    //    self.navigationItem.rightBarButtonItem = self.editButtonItem;//editButtonItem是方法,不是属性
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:nil];
    self.navigationItem.rightBarButtonItem = right;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
