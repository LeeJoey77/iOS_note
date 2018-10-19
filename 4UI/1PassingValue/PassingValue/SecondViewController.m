//
//  SecondViewController.m
//  PassingValue
//
//  Created by lanouhn on 15/12/3.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (retain, nonatomic) IBOutlet UITextField *textField;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
//代理传值
- (void)viewWillDisappear:(BOOL)animated {
    if ([self.delegate respondsToSelector:@selector(passValue:)]) {
        [self.delegate passValue:self.textField.text];
    }
}
*/

/**/
//Block传值方式一:Block属性传值
- (void)viewWillDisappear:(BOOL)animated {
    if (self.returnTextBlock) {
        self.returnTextBlock(self.textField.text);
        NSLog(@"%@", self.textField.text);
    }
}


//Block传值方式二:用自定义方法传值
- (void)returnText:(ReturnTextBlock)aBlock {
    //传值
    self.returnTextBlock = aBlock;
    NSLog(@"++++++++");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_textField release];
    [super dealloc];
}
@end
