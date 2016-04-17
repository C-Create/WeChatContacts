//
//  YHRecentsController.m
//  weChatContacts
//
//  Created by 昱含 on 16/4/11.
//  Copyright © 2016年 YuHan. All rights reserved.
//

#import "YHRecentsController.h"
#import "YHCoverView.h"
@interface YHRecentsController ()

@end

@implementation YHRecentsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置标题
    self.navigationItem.title = @"通话记录";
    //设置右侧添加按钮
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_add"] style:UIBarButtonItemStylePlain target:self action:@selector(addItemClick:)];

    self.navigationItem.rightBarButtonItem = addItem;
}

//MARK: - 点击添加按钮
- (void)addItemClick:(UIBarButtonItem *)addItem{
    
    //创建无色阴影遮罩
    YHCoverView *coverView = [[YHCoverView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    coverView.plistName = @"YHAddList";
    
    coverView.skipBlock = ^(UIViewController *obj){
        [self.navigationController pushViewController:obj animated:YES];
    };
    
    //阴影遮罩的添加位置
    [self.tabBarController.view addSubview:coverView];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
