//
//  RootViewController.m
//  LessonPassingValue
//
//  Created by lanouhn on 15/12/3.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"
@interface RootViewController () <FirstViewControllerDelegate>
@property (nonatomic, retain) UILabel *label;
@end

@implementation RootViewController

- (void)dealloc
{
    self.label = nil;
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];
    [self setupLBAndBT];
    
    //配置导航条
    [self configureNavigationBar];
}

- (void)setupLBAndBT {
    //创建时必须用self. 不能用_label
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(60, 150, 250, 40)];
    //以下三个只需找到视图,所以可以用_label
    _label.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:_label];
    [_label release];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(120, 400, 100, 40);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"click" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(handleButtonAction:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
}

- (void)configureNavigationBar {
    self.navigationItem.title = @"首页";
    NSDictionary *dic = @{NSForegroundColorAttributeName:[UIColor blackColor], NSFontAttributeName:[UIFont systemFontOfSize:20]};
    self.navigationController.navigationBar.titleTextAttributes = dic;
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:nil];
    self.navigationItem.leftBarButtonItem = left;
}

//block放在常量区,调用时copy到栈区,必须copy一下拷贝到堆区
- (void)handleButtonAction:(UIButton *)sender {
    FirstViewController *firstVC = [[FirstViewController alloc] init];
/*
    firstVC.returnBool = ^{
        return YES;
    };

 
    firstVC.returnValue = ^(NSString *text) {
        self.label.text = text;
        NSLog(@"%s %d", __FUNCTION__, __LINE__);
    };
*/
    //Block 传值方式二:用自定义方法传值
    NSLog(@"++++++++++");
    [firstVC returnText:^(NSString *data) {
        self.label.text = data;
    }];

    
    //属性传值
//    firstVC.delegate = self;
    
    [self.navigationController pushViewController:firstVC animated:YES];
}

- (void)passValue:(NSString *)data {
    self.label.text = data;
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
