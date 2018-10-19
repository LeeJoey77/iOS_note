
//
//  BookCategoryController.m
//  HomeWorkBooks
//
//  Created by lanouhn on 15/12/30.
//  Copyright © 2015年 lanouhn0. All rights reserved.
//

#import "BookCategoryController.h"
#import "Header.h"
#import "AppDelegate.h"
#import "CollectionViewCell.h"
#import "BookCategory.h"
#import "BookTableViewController.h"
#import "Books.h"

@interface BookCategoryController ()
@property (nonatomic, strong) NSMutableArray *dataSource;
//数据管理器
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
//定义一个属性,接收alertView中创建的textField
@property (nonatomic, strong) UITextField *textField;
@end

@implementation BookCategoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor cyanColor];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(kItemWidth, kItemWidth);
    flowLayout.minimumLineSpacing = kMargin;
    flowLayout.sectionInset = UIEdgeInsetsMake(kMargin, kMargin, kMargin, kMargin);
    self.collectionView.collectionViewLayout = flowLayout;
    //左侧编辑按钮
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    //创建coreData数据库
    [self createCoreData];
}

//创建coreData数据库
- (void)createCoreData {
    //初始化数据源
    self.dataSource = [NSMutableArray array];
    //找到appDelegate
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    //得到appDelegate的数据管理器
    self.managedObjectContext = appDelegate.managedObjectContext;
    //沙盒路径
    NSLog(@"%@++++++++", NSHomeDirectory());
    
    //coredata --- 查询
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"BookCategory"];
    //通过请求进行查询
    NSArray *result = [self.managedObjectContext executeFetchRequest:request error:nil];
    //给数据源赋值
    [self.dataSource setArray:result];
}

//右侧添加
- (IBAction)handleAddBarButtonItem:(UIBarButtonItem *)sender {
    //1.创建UIAlertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"添加分类" preferredStyle:UIAlertControllerStyleAlert];
    //2.添加输入框
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入书籍分类";
        self.textField = textField;
    }];
    //3.创建alertAction并添加到alertController上
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (![self.textField.text isEqualToString:@""]) {
            //点击确定时,将数据插入数据库
            [self insertNewBookCategoryIntoCoreData];
        }
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    //4.模态到alertController
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)insertNewBookCategoryIntoCoreData {
    int bookNumber = arc4random() % (20 - 1 + 1) + 1;
    //coredata --- 插入
    //创建实例变量,并插入到临时数据库
    BookCategory *category = [NSEntityDescription insertNewObjectForEntityForName:@"BookCategory" inManagedObjectContext:self.managedObjectContext];
    //给实例变量赋值
    category.bookCategory = [NSString stringWithFormat:@"%@-%d", self.textField.text, bookNumber];
    category.bookNumber = [NSString stringWithFormat:@"%d", bookNumber];
    
    //给Books对象赋值
    for (int i = 0; i < bookNumber; i++) {
        //创建一个书籍对象
        Books *books = [NSEntityDescription insertNewObjectForEntityForName:@"Books" inManagedObjectContext:self.managedObjectContext];
        //给书籍赋值
        books.bookName = [NSString stringWithFormat:@"%d", i];
        NSInteger price = arc4random() % (77 - 10 + 1) + 10;
        books.bookPrice = @(price);
        //让book和category产生关系
        books.includedShip = category;
    }
    //插入到数据源
    [self.dataSource insertObject:category atIndex:0];
    //保存到真正的数据库,即存到沙盒中的数据库
    [self.managedObjectContext save:nil];
    //刷新列表
    NSIndexPath *insertIndexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    [self.collectionView insertItemsAtIndexPaths:@[insertIndexPath]];
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    BookCategory *category = self.dataSource[indexPath.row];
    cell.bookLB.text = category.bookCategory;
    return cell;
}

#pragma mark <UICollectionViewDelegate>
//选中item触发的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //点击了Edit,可以执行删除操作
    if (self.editing) {
        //coredata --- 删除
        //找到要删除的对象
        BookCategory *category = self.dataSource[indexPath.row];
        //从临时数据库中删除
        [self.managedObjectContext deleteObject:category];
        //从数组中删除
        [self.dataSource removeObject:category];
        //保存到数据库
        [self.managedObjectContext save:nil];
        //刷新界面
        [collectionView deleteItemsAtIndexPaths:@[indexPath]];
    }else {
        
        //每次添加的Item都会添加到第一个,因此sender后需要写indexPath
        [self performSegueWithIdentifier:@"toBookTableView" sender:[self.collectionView cellForItemAtIndexPath:indexPath]];
    }
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    BookTableViewController *bookTableVC = [segue destinationViewController];
    //得到了对应的indexPath
    NSIndexPath *indexOfCell = [self.collectionView indexPathForCell:sender];
    NSLog(@"%@", indexOfCell);
    bookTableVC.category = self.dataSource[indexOfCell.row];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
