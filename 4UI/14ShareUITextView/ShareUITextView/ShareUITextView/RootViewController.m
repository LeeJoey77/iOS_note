//
//  RootViewController.m
//  ShareUITextView
//
//  Created by lanouhn on 15/11/17.
//  Copyright (c) 2015年 Sara.Burton. All rights reserved.
//

#import "RootViewController.h"

#define kMax_Input 20

@interface RootViewController () <UITextViewDelegate>

@property (nonatomic, retain) UITextView *textView;
@property (nonatomic, retain) UILabel *label;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(50, 50, [UIScreen mainScreen].bounds.size.width - 100, 100)];
    self.textView.tag = 200;
    
    //常规属性设置
    self.textView.text = @"输入你想输入的内容...";
    self.textView.textAlignment = NSTextAlignmentLeft;
    self.textView.textColor = [UIColor lightGrayColor];
    self.textView.font = [UIFont systemFontOfSize:20];
    self.textView.backgroundColor = [UIColor  grayColor];
    self.textView.layer.cornerRadius = 10;
    self.textView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.textView.layer.borderWidth = 2;
    
    //其他常用属性设置
    //editing 的默认设置为 YES, 当为 NO 时, 只能用来显示, 不能删减内容, 可以进行选择和拷贝
//    self.textView.editable = NO;
    //selectable 的默认设置为 YES, 当为 NO 时, 不能被选中
    self.textView.selectable = YES;
    
    //代理
    self.textView.delegate = self;
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"This is an example by @marcelofabri_"];
    [attributedString addAttribute:NSLinkAttributeName value:@"username://marcelofabri_" range:[[attributedString string] rangeOfString:@"@marcelofabri_"]];
    
    
    NSDictionary *linkAttributes = @{NSForegroundColorAttributeName: [UIColor blueColor], NSUnderlineColorAttributeName: [UIColor lightGrayColor], NSUnderlineStyleAttributeName: @(NSUnderlinePatternSolid)};
    
    self.textView.linkTextAttributes = linkAttributes; // customizes the appearance of links
    self.textView.attributedText = attributedString;
    
    
    //label
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, _textView.bounds.size.height - 20, _textView.bounds.size.width, 15)];
    self.label.backgroundColor = [UIColor clearColor];
    self.label.text = [NSString stringWithFormat:@"还可以输入%d个字", kMax_Input];
    self.label.textAlignment = NSTextAlignmentRight;
    self.label.textColor = [UIColor lightGrayColor];
    [self.textView addSubview:self.label];
    [self.label release];
    
    [self.view addSubview:self.textView];
    [self.textView release];
}

#pragma mark - UITextView Delegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    textView.text = @"";
    textView.textColor = [UIColor darkGrayColor];
    NSLog(@"将要开始编辑");
    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    NSLog(@"将要结束编辑");
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    NSLog(@"开始编辑");
}

- (void)textViewDidEndEditing:(UITextView *)textView{
    if (0 == textView.text.length) {
        textView.text = @"输入你想输入的内容...";
        textView.textColor = [UIColor lightGrayColor];
    }
    
    //当字符串长度超过设置的值时,用省略号代替
    if (textView.text.length > 10) {
        NSString *oldStr = textView.text;
        NSMutableString *newStr = [[[oldStr substringToIndex:10] stringByAppendingString:@"..."] copy];
        textView.text = newStr;
    }
    NSLog(@"结束编辑");
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    self.label.text = [NSString stringWithFormat:@"还可输入%lu个字", kMax_Input - range.location];
    if ([text isEqualToString:@""] && range.length > 0) {
        //删除字符肯定是安全的
        return YES;
    }
    else {
        if (textView.text.length - range.length + text.length > 20) {
            //textView.text.length 为原本的文本长度
            //range.length 为选中的文本长度
            //text.length 为将要输入的文本长度
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"超出最大可输入长度" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alert show];
            return NO;
        }
        else {
            return YES;
        }
    }
}

- (void)textViewDidChange:(UITextView *)textView{
    NSLog(@"已经改变内容");
    //获取文字高度
//    CGFloat height = textView.contentSize.height;
//    //限制高度
//    if (height > 100) {
//        return;
//    }
//    textView.bounds = CGRectMake(0, 0, textView.bounds.size.width, height);
    
    //自适应高度
//    CGFloat height = textView.contentSize.height;
//    textView.bounds = CGRectMake(0, 0, textView.bounds.size.width, height);
    
    //textview 改变字体的行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    paragraphStyle.lineSpacing = 2;// 字体的行间距
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15], NSParagraphStyleAttributeName:paragraphStyle};
    
    textView.attributedText = [[NSAttributedString alloc] initWithString:textView.text attributes:attributes];
    
}

- (void)textViewDidChangeSelection:(UITextView *)textView{
    NSLog(@"选中内容");
   
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    NSLog(@"点击超链接");
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITextView *textView = (UITextView *)[self.view viewWithTag:200];
    [textView resignFirstResponder];
}

#pragma mark - 内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    self.textView = nil;
    self.label = nil;
    [super dealloc];
}

@end
