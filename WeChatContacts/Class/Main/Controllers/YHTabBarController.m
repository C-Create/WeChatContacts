//
//  YHTabBarController.m
//  weChatContacts
//
//  Created by 昱含 on 16/4/11.
//  Copyright © 2016年 YuHan. All rights reserved.
//

#import "YHTabBarController.h"
#import "YHNavigationController.h"

@interface YHTabBarController ()
@property (nonatomic, strong) NSArray *childVcArr;
@end

@implementation YHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加子视图
    [self setChildController];

}

- (void)setChildController{
#warning mark - 注意可变数组的创建位置
    //创建临时可变数组,要放在遍历外面,否则出了block作用域被销毁
    NSMutableArray *arrM = [NSMutableArray array];
    
    [self.childVcArr enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        //创建跳转控制器
        //获取控制器字符串
        NSString *className = obj[@"YHRootVcName"];
        
        //由字符串转化为类类型
        Class classVc = NSClassFromString(className);
        UIViewController *vc = [[classVc alloc]init];
        vc.view.backgroundColor = [UIColor whiteColor];
        
        //tabBar的内容由vc导航栏属性决定
        vc.tabBarItem.title = obj[@"YHTabBarTitle"];
        vc.tabBarItem.image = [[UIImage imageNamed:obj[@"YHNorImageName"]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:obj[@"YHSelectedImageName"]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [vc.tabBarItem setTitleTextAttributes:@{
                                                NSForegroundColorAttributeName : YHThemeColor
                                                } forState:UIControlStateSelected];
        
        //创建导航控制器
        YHNavigationController *nav = [[YHNavigationController alloc]initWithRootViewController:vc];
        [arrM addObject:nav];
    }];
    
    self.viewControllers = arrM;
}

//MARK:- 懒加载
- (NSArray *)childVcArr{
    if (!_childVcArr) {
        _childVcArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"YHChildVc.plist" ofType:nil]];
    }
    return _childVcArr;
}

@end
