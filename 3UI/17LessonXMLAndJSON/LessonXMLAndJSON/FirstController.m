//
//  FirstController.m
//  LessonXMLAndJSON
//
//  Created by lanouhn on 15/11/24.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "FirstController.h"
#import "Student.h"
@interface FirstController () <NSXMLParserDelegate>
@property (nonatomic, retain) NSMutableArray *dataSource;//存储学生对象
@property (nonatomic, retain) Student *stu;//保存当前的Student对象
@property (nonatomic, copy) NSString *string;//保存当前读取到的标签后的内容
@end

//解析:按照约定好(假象)的格式提取数据的过程叫做解析
//数据提供方(后台)按照某一格式存放数据,数据提取方(前端)就要按照某一格式提取数据
//主流的数据结构:XML(SAX 和 DOM<RootParser, XPath>) 和 JSON
/*
 XML数据结构的特点:
 1.由标签组成,而且标签是成对存在的,一对儿开始标签和结束标签叫做节点
 2.节点可以有子节点和父节点,没有父节点的节点叫做根节点,没有子节点的节点叫做叶子节点
 3.节点可以用来存储数据
*/
@implementation FirstController

- (void)dealloc
{
    self.dataSource = nil;
    self.stu = nil;
    self.string = nil;
    [super dealloc];
}

//懒加载,给数组开辟空间
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        self.dataSource = [NSMutableArray arrayWithCapacity:1];
    }
    return [[_dataSource retain] autorelease];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}
/*
 XML解析原理:
 SAX解析:是一种基于事件回调的解析机制(主要通过代理方法进行解析),逐行解析,逐行读入内存,适合大数据解析,效率比较低,系统解析就是这种解析方式
 DOM解析:将数据全部存入内存,将数据读成树状结构的数据,逐层进行解析,适用于小数据解析,效率比较高,第三方的解析原理即是这种方式
*/

//解析按钮点击事件
- (IBAction)handleAnalysisButtonAction:(id)sender {
   //1.获取要解析的文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Student.xml" ofType:nil];
    //2.根据文件路径初始化NSData对象
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    //3.创建解析工具
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    //处理命名空间问题
    parser.shouldProcessNamespaces = YES;
    //4.设置代理,检测解析过程
    parser.delegate = self;
    //5.开始解析
    [parser parse];
    //6.释放
    [parser release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- NSXMLParserDelegate
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    NSLog(@"开始解析");
}
//当读取到开始标签时触发
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    NSLog(@"%@", elementName);
    //当读取到Student开始标签时,创建Student对象(创建对象开辟空间时用"self.", 在setter或getter方法中用"_")
    if ([elementName isEqualToString:@"student"]) {
        self.stu = [[[Student alloc] init] autorelease];
        self.stu.position = attributeDict[@"position"];//解析时,position(key)和position(value)以字典方式保存
        NSLog(@"%@", self.stu.position);
    }
}
//当读取到标签后的内容时触发
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    NSLog(@"%@", string);
    self.string = string;//保存标签后的内容
}
//当读取到结束标签时触发
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    NSLog(@"%@", elementName);
    if ([elementName isEqualToString:@"name"]) {//过滤掉换行符和空格
        self.stu.name = self.string;//这个时间标签中的内容已经读取出来
    }else if ([elementName isEqualToString:@"gender"]) {
        self.stu.gender = self.string;
    }else if ([elementName isEqualToString:@"age"]) {
        self.stu.age = self.string;
    }else if ([elementName isEqualToString:@"phone"]) {
        self.stu.phone = self.string;
    }else if ([elementName isEqualToString:@"motto"]) {
        self.stu.motto = self.string;
    }else if ([elementName isEqualToString:@"student"]) {
        //当读取到student结束标签时,将对象添加到数组
        [self.dataSource addObject:self.stu];
    }
}
//当解析结束时触发
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    NSLog(@"game over");
    //解析结束之后,tableView刷新界面
    [self.tableView reloadData];
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse" forIndexPath:indexPath];
    cell.textLabel.text = ((Student *)self.dataSource[indexPath.row]).position;//输出
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
