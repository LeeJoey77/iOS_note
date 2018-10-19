//
//  ContactListViewController.m
//  LessonUITableViewEdit
//
//  Created by lanouhn on 15/11/13.
//  Copyright (c) 2015年 lanouhn0. All rights reserved.
//

#import "ContactListViewController.h"

@interface ContactListViewController ()
@property (nonatomic, retain) UIImageView *imageView;

@end

@implementation ContactListViewController

//UIViewController 与 UITableViewController的对比:
//1.前者视图控制器的根视图是UIView对象,后者视图控制器的根视图是UITableView对象,并且无需自己创建
//2.前者需要创建UITableView对象,指定数据源和代理两个属性,服从对应的协议,然后实现协议中的方法,而后者不需要再指定代理和服从UIViewController的协议(系统封装该类时已经做过处理)(系统封装该类时已经做过处理), 常用的方法也已经罗列出来
//3.前者需要指定Edit按钮,并且重写Edit按钮的触发事件,找到控制tableView,然后控制tableView进入编辑状态,而后者自动集成


//何时需要继承自UITableViewController?
//当该界面需要tableView来展示数据的时候,并且tableView又是当前界面的主界面时(如通讯录)

- (void)viewDidLoad {
    [super viewDidLoad];
   

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    
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
