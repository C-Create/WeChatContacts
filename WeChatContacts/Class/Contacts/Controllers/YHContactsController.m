//
//  YHContactsController.m
//  weChatContacts
//
//  Created by 昱含 on 16/4/11.
//  Copyright © 2016年 YuHan. All rights reserved.
//

#import "YHContactsController.h"
#import <Contacts/CNContact+Predicates.h>
#import "YHNavigationController.h"

@interface YHContactsController ()<CNContactViewControllerDelegate>

@property (nonatomic, weak) UIBarButtonItem *addContactsItem;

@property (nonatomic, strong) NSArray *allContacts;

@end

@implementation YHContactsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加segment
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc]initWithItems:@[@"免费",@"全部"]];
    segmentControl.width = 140;
    [segmentControl setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColor.whiteColor} forState: UIControlStateSelected];
    [segmentControl setTitleTextAttributes:@{NSForegroundColorAttributeName:YHThemeColor} forState:UIControlStateNormal];
    //默认"全部"被选中
    segmentControl.selectedSegmentIndex = 1;
    self.navigationItem.titleView = segmentControl;
    
    //添加segment点击事件
    [segmentControl addTarget:self action:@selector(segmentControlValueChanged:) forControlEvents:UIControlEventTouchUpInside];
    
    //设置左边按钮
    UIBarButtonItem *chooseItem = [[UIBarButtonItem alloc]initWithTitle:@"选择" style:UIBarButtonItemStylePlain target:self action:@selector(chooseItemClick:)];
    self.navigationItem.leftBarButtonItem = chooseItem;
    
    //添加右侧按钮
    UIBarButtonItem *addContactsItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_add_free_freinds"] style:UIBarButtonItemStylePlain target:self action:@selector(addContactsItemClick:)];
    self.navigationItem.rightBarButtonItem = addContactsItem;
    self.addContactsItem = addContactsItem;
}

//MARK: - 左侧选择按钮的点击事件
- (void)chooseItemClick:(UIBarButtonItem *)sender{
    if ([sender.title isEqualToString:@"选择"]) {
        sender.title = @"取消";
        self.addContactsItem.image = nil;
        self.addContactsItem.title = @"全选";
    }else{
        sender.title = @"选择";
        self.addContactsItem.image = [UIImage imageNamed:@"icon_add_free_freinds"];
        self.addContactsItem.title = nil;

    }
}

//MARK: - 右侧按钮的点击事件
- (void)addContactsItemClick:(UIBarButtonItem *)sender{
    
    //创建控制器
    CNContactViewController *addContactVc = [CNContactViewController viewControllerForNewContact:[[CNContact alloc]init]];
    addContactVc.navigationItem.title = @"新建联系人";

    //设置代理
    addContactVc.delegate = self;
    
    //包装成导航控制器
    YHNavigationController *nav = [[YHNavigationController alloc]initWithRootViewController:addContactVc];
    
    //跳转显示控制器
    [self presentViewController:nav animated:YES completion:nil];
}

//MARK: - CNContactViewControllerDelegate
- (void)contactViewController:(CNContactViewController *)viewController didCompleteWithContact:(CNContact *)contact{
    //销毁控制器
    [self dismissViewControllerAnimated:YES completion:nil];
}

//MARK: - segmentControl的点击事件
- (void)segmentControlValueChanged:(UISegmentedControl *)segmentControl{
    NSLog(@"刷新联系人信息");
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}

//MARK: - 懒加载数组
- (NSArray *)allContacts{
    if (!_allContacts) {
        
    }
    return _allContacts;
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
