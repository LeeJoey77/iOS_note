//
//  AddViewController.m
//  LessonSqlite
//
//  Created by lanouhn on 15/11/23.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "AddViewController.h"
#import "Contact.h"
@interface AddViewController () <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (retain, nonatomic) IBOutlet UIImageView *contactImage;

@property (retain, nonatomic) IBOutlet UITextField *genderTF;
@property (retain, nonatomic) IBOutlet UITextField *ageTF;
@property (retain, nonatomic) IBOutlet UITextField *nameTF;
@property (retain, nonatomic) IBOutlet UITextField *phoneTF;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)handleTapGestureRecognizer:(id)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"选择图像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册选择", nil];
    [sheet showInView:self.view];
    [sheet release];
    
}

- (IBAction)handleBackButtonAction:(UIBarButtonItem *)sender {//把sender的类型改为UIBarButtonItem
    //如果姓名, 电话为空, 则直接返回前一个界面
    if (!self.nameTF.text.length || !self.phoneTF.text.length) {
        [self dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    //如果不为空,代理传值
    //代理传值第六步
    if ([self.delegate respondsToSelector:@selector(addContact:)]) {
        Contact *contact = [Contact contactWithID:0 name:self.nameTF.text gender:self.genderTF.text age:self.ageTF.text phone:self.phoneTF.text image:self.contactImage.image];
        //让代理去干活
        [self.delegate addContact:contact];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -- imagePickerControllerDelegate
//获取图片后触发
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    self.contactImage.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}
#pragma mark - handle Photo
//action sheet 响应事件
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    //创建对象
    UIImagePickerController *imagePicker = [[[UIImagePickerController alloc] init] autorelease];
    //相片来源:1.photoAlum 2.camera 3.photoLibrary
    //指定相片来源
    switch (buttonIndex) {
        case 0: //拍照
            //判断是否支持相机
            if ([UIImagePickerController isSourceTypeAvailable:(UIImagePickerControllerSourceTypeCamera)]) {
                
                imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            } else {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"不支持相机拍照,请重新选择" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
                
                [alert show];
                [alert release];
                return;
            }
            break;
        case 1:
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary; //从相册选择
            break;
        case 2:
            return; //取消
        default:
            break;
    }
    //跳转模式
    imagePicker.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    //指定代理
    imagePicker.delegate = self;
    //弹出视图
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_genderTF release];
    [_ageTF release];
    [_nameTF release];
    [_contactImage release];
    [_phoneTF release];
    [super dealloc];
}
@end
