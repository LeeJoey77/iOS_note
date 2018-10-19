//
//  RootViewController.m
//  LessonUICollectionView
//
//  Created by lanouhn on 11/30/15.
//  Copyright (c) 2015 hdy. All rights reserved.
//

#import "RootViewController.h"
#import "ImageCell.h"
#import "HeaderView.h"
#import "FooterView.h"
@interface RootViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, retain) NSMutableArray *dataSource;//数据源
@end


//设置重用标识符
static NSString *identifier = @"reuse";
static NSString *headerIden = @"header";
static NSString *footerIden = @"footer";
@implementation RootViewController
-(NSArray *)dataSource {
    if (!_dataSource) {
        self.dataSource = [@[] mutableCopy];
    }
    return [[_dataSource retain] autorelease];
}

//从plist文件中读取数据
- (void)readDataFromPlist {
    //1.获取文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"contact(1).plist" ofType:nil];
    //2.根据文件路径, 获取数据
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    for (NSString *key in dic) {
        //根据key获取对应的数组
        NSArray *contactArr = dic[key];
        for (NSDictionary *tempDic in contactArr) {
            [self.dataSource addObject:tempDic[@"image"]];
        }
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
 
    //UICollectionView ----- UITableView的升级版
    [self readDataFromPlist];
    
    //创建布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //设置cell的大小 －－－－ item
    flowLayout.itemSize = CGSizeMake(90, 90);
    //设置分区的边界距离
    flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    //设置行间距
    flowLayout.minimumLineSpacing = 50;
    //设置两个item之间的距离
    flowLayout.minimumInteritemSpacing = 10;
    //设置滚动方向
    //flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;//水平方向
    //设置页眉大小
    flowLayout.headerReferenceSize = CGSizeMake(320, 40);
    //设置页脚大小
    flowLayout.footerReferenceSize = CGSizeMake(320, 40);
    
    //NSIndexPath初始化方法:NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:4];

    
    //创建UICollectionView对象
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowLayout];
    //1.配置数据源对象
    collectionView.dataSource = self;
    //设置代理对象
    collectionView.delegate = self;
    
    //注册cell(item)
    [collectionView registerClass:[ImageCell class] forCellWithReuseIdentifier:identifier];
    //注册页眉(header)
    [collectionView registerClass:[HeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerIden];
    //注册页脚(footer)
    [collectionView registerClass:[FooterView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerIden];
    
    //设置背景颜色
    collectionView.backgroundColor = [UIColor redColor];
    //添加到父視圖
    [self.view addSubview:collectionView];
    //释放
    [flowLayout release];
    [collectionView release];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//NSIndexPath初始化方法:NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:4];

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor blackColor];
    cell.imageView.image = [UIImage imageNamed:self.dataSource[indexPath.row]];
    return cell;
}

//设置分区页眉页脚 --- 页眉和页脚采用重用机制
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        //获取页眉 --- 重用
        HeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerIden forIndexPath:indexPath];
        headerView.backgroundColor = [UIColor orangeColor];
        headerView.imageView.image = [UIImage imageNamed:@"屏幕快照 2015-11-30 3.20.43 PM"];
        //返回页眉
        return headerView;
    } else {
        //获取页脚 -- 重用
        FooterView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:footerIden forIndexPath:indexPath];
        footerView.backgroundColor = [UIColor grayColor];
        footerView.label.text = [NSString stringWithFormat:@"section:%ld", indexPath.section];//显示分区的索引
        //返回
        return footerView;
        
    }
}

#pragma mark --- UICollectionViewDelegate
//选中item触发的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"点击跳转");
}



#pragma mark --- UICollectionViewDelegateFlowLayout
//灵活的设置每一个item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.item % 2 ? CGSizeMake(100, 100) : CGSizeMake(100, 150);
}

//灵活的设置每一个分区的缩进(距离上, 左, 下, 右边缘的距离)
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5);
    
}

//灵活的设置每个分区item的最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}
//灵活的设置每个分区item之间的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}

//灵活的设置每个分区页眉的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(320, 40);
}

//灵活的设置每个分区页脚的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(320, 40);
}


- (void)dealloc {
    self.dataSource = nil;
    [super dealloc];
}

@end
