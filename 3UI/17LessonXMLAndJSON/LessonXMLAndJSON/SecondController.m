//
//  SecondController.m
//  LessonXMLAndJSON
//
//  Created by lanouhn on 15/11/24.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "SecondController.h"
#import "GDataXMLNode.h"
#import "Student.h"
/*
 GDataXMLNode 是由Google提供的开源的基于DOM工作原理的XML解析方式,底层是基于C语音的libxml2动态连接库而封装的OC的使用方式,所以效率比较高
 准备工作:
 1.Build Phases --- 添加动态连接库libmxl2
 2.Build Setting --- Header Seacher Paths 添加 /usr/include/libxml2
*/
@interface SecondController ()
@property (nonatomic, retain) NSMutableArray *dataSource;//存储student对象
@end

@implementation SecondController

- (void)dealloc
{
    self.dataSource = nil;
    [super dealloc];
}

//懒加载,为数组开辟空间
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        self.dataSource = [NSMutableArray arrayWithCapacity:1];
    }
    return [[_dataSource retain] autorelease];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark --- RootParser解析
- (IBAction)handleRootParserButtonAction:(UIBarButtonItem *)sender {
    //防止重复解析
    [self.dataSource removeAllObjects];
    
    //1.获取要解析的文件的路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Student.xml" ofType:nil];
    //2.根据文件路径初始化NSString对象
    NSString *xmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    //3.将解析内容读入到GDataXMLDocument
    GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithXMLString:xmlString options:0 error:nil];
    //4.获取根节点
    //GDataXMLElement 可以创建节点对象
    GDataXMLElement *rootElement = [document rootElement];
    //5.获取根节点下所有的student
    NSArray *stuElements = [rootElement elementsForName:@"m:student"];
    //6.获取m:student节点下的子节点
    for (GDataXMLElement *stuElement in stuElements) {
        //获取student节点下的name节点
        GDataXMLElement *nameElement = [[stuElement elementsForName:@"m:name"] firstObject];
        //获取student节点下的gender节点
        GDataXMLElement *genderElement = [[stuElement elementsForName:@"m:gender"] firstObject];
        //获取student节点下的age节点
        GDataXMLElement *ageElement = [[stuElement elementsForName:@"m:age"] firstObject];
        //获取student节点下的phone节点
        GDataXMLElement *phoneElement = [[stuElement elementsForName:@"m:phone"] firstObject];
        //获取student节点下的motto节点
        GDataXMLElement *mottoElement = [[stuElement elementsForName:@"m:motto"] firstObject];
        
        Student *stu = [[Student alloc] init];
        //获取叶子节点中的数据,数据放在开始标签与结束标签之间
        stu.name = [nameElement stringValue];
        stu.gender = [genderElement stringValue];
        stu.age = [ageElement stringValue];
        stu.phone = [phoneElement stringValue];
        stu.motto = [mottoElement stringValue];
        
        //获取节点中的属性对象
        GDataXMLNode *positionNode = [stuElement attributeForName:@"position"];
        stu.position = [positionNode stringValue];
        
        [self.dataSource addObject:stu];
        [stu release];
    }
       //重新刷新界面
    [self.tableView reloadData];
}


#pragma mark --- XPath解析
- (IBAction)handleXPathButtonAction:(id)sender {
    //防止重复解析
    [self.dataSource removeAllObjects];
    
    //1.获取要解析的文件的路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Student.xml" ofType:nil];
    //2.根据文件路径初始化NSString对象
    NSString *xmlString = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    //3.将解析内容读入到GDataXMLDocument
    GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithXMLString:xmlString options:0 error:nil];
    //4.获取所有的叶子节点
    //(1)获取所有的name节点
    NSArray *nameElements = [document nodesForXPath:@"//m:name" error:nil];
    //(2)获取所有的gender节点
    NSArray *genderElements = [document nodesForXPath:@"//m:gender" error:nil];
    //(3)获取所有的age节点
    NSArray *ageElements = [document nodesForXPath:@"//m:age" error:nil];
    //(4)获取所有的phone节点
    NSArray *phoneElements = [document nodesForXPath:@"//m:phone" error:nil];
    //(5)获取所有的motto节点
    NSArray *mottoElements = [document nodesForXPath:@"//m:motto" error:nil];
    //(6)获取所有的student节点
    NSArray *stuElements = [document nodesForXPath:@"//m:student" error:nil];
    
    int count = (int)stuElements.count;
    for (int i = 0; i < count; i++) {
        GDataXMLElement *nameElement = nameElements[i];
        GDataXMLElement *genderElement = genderElements[i];
        GDataXMLElement *ageElement = ageElements[i];
        GDataXMLElement *phoneElement = phoneElements[i];
        GDataXMLElement *mottoElement = mottoElements[i];
        GDataXMLNode *positionNode = [stuElements[i] attributeForName:@"position"];
        
        Student *stu = [[Student alloc] init];
        stu.name = [nameElement stringValue];
        stu.gender = [genderElement stringValue];
        stu.age = [ageElement stringValue];
        stu.phone = [phoneElement stringValue];
        stu.motto = [mottoElement stringValue];
        stu.position = [positionNode stringValue];
        
        //添加到数组
        [self.dataSource addObject:stu];
        [stu release];
    }
    [self.tableView reloadData];//刷新界面
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark --- Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
    cell.textLabel.text = ((Student *)self.dataSource[indexPath.row]).name;
    cell.detailTextLabel.text = ((Student *)self.dataSource[indexPath.row]).phone;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
