//
//  YHNavigationController.m
//  weChatContacts
//
//  Created by 昱含 on 16/4/11.
//  Copyright © 2016年 YuHan. All rights reserved.
//

#import "YHNavigationController.h"

@interface YHNavigationController ()

@end

@implementation YHNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

}

+ (void)initialize{
    //获取外观代理对象
    UINavigationBar *navBar = [UINavigationBar appearance];
    //修改导航条的属性
    [navBar setTintColor:YHThemeColor];
}


@end
