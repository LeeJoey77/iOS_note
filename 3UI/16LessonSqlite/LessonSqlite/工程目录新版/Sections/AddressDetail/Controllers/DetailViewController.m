//
//  DetailViewController.m
//  LessonSqlite
//
//  Created by lanouhn on 15/11/23.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "DetailViewController.h"
#import "Contact.h"
@interface DetailViewController () <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (retain, nonatomic) IBOutlet UIImageView *contactImage;
@property (retain, nonatomic) IBOutlet UITextField *nameTF;
@property (retain, nonatomic) IBOutlet UITextField *genderTF;
@property (retain, nonatomic) IBOutlet UITextField *ageTF;
@property (retain, nonatomic) IBOutlet UITextField *phoneTF;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //给控件赋值
    self.contactImage.image = self.data.image;
    self.nameTF.text = self.data.name;
    self.genderTF.text = self.data.gender;
    self.ageTF.text = self.data.age;
    self.phoneTF.text = self.data.phone;
    
    //Edit 按钮
    self.navigationItem.rightBarButtonItem = self.editButtonItem;

}

- (void)viewDidAppear:(BOOL)animated {
    //控制自身控件的交互
    [self dependUserInteraction:NO];

}

//edit 按钮触发事件
- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    //控制自身控件的交互
    [self dependUserInteraction:editing];
    if (!editing) {
        //如果此时点击Done按钮,要保存数据
        [self saveData];
    }
}

//控制自身控件的交互
- (void)dependUserInteraction:(BOOL)enabled {
    self.contactImage.userInteractionEnabled = enabled;
    self.nameTF.enabled = enabled;
    self.genderTF.enabled = enabled;
    self.ageTF.enabled = enabled;
    self.phoneTF.enabled = enabled;
}

//保存修改后的数据
- (void)saveData {
    //1.将内存中的contact(data)对象数据更改
    self.data.name = self.nameTF.text;
    self.data.gender = self.genderTF.text;
    self.data.age = self.ageTF.text;
    self.data.phone = self.phoneTF.text;
    self.data.image = self.contactImage.image;
    //2.让前一个界面更改数据库中的数据
    //代理六
    if ([self.delegate respondsToSelector:@selector(modifyContact:)]) {
        [self.delegate modifyContact:self.data];
    }
    
}

- (IBAction)handleTapGestureAction:(UITapGestureRecognizer *)sender {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"选择图像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册选择", nil];
    [sheet showInView:self.view];
    [sheet release];
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

- (void)dealloc {
    self.data = nil;
    [_contactImage release];
    [_nameTF release];
    [_genderTF release];
    [_ageTF release];
    [_phoneTF release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
