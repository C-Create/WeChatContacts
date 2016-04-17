//
//  YHCoverView.m
//  weChatContacts
//
//  Created by 昱含 on 16/4/16.
//  Copyright © 2016年 YuHan. All rights reserved.
//

#import "YHCoverView.h"

@interface YHCoverView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, weak) UITableView *grayTableView;
@property (nonatomic, strong) NSArray *listArr;

@end
@implementation YHCoverView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //创建tableView
        UITableView *grayTableView = [[UITableView alloc]init];
       
        
        //设置tableView的属性
        grayTableView.layer.cornerRadius = 5;
        grayTableView.scrollEnabled = NO;

        [self addSubview:grayTableView];
         self.grayTableView = grayTableView;
        
        //设置tableView的代理及数据源方法
        self.grayTableView.delegate = self;
        self.grayTableView.dataSource = self;
    }
    return self;
}

//返回每行的方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.backgroundColor = YHRGBColor(223, 223, 223);
    }
    
    //给cell赋值
    NSDictionary *dict = self.listArr[indexPath.row];
    cell.textLabel.text = dict[@"YHTitle"];
    cell.imageView.image = [UIImage imageNamed:dict[@"YHIcon"]];
    
    return cell;
}

//MARK: - 选择某行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dict = self.listArr[indexPath.row];
    NSString *vcStr = dict[@"YHTargetVc"];
    Class vcClass = NSClassFromString(vcStr);
    UIViewController *obj = [[vcClass alloc]init];
    if (self.skipBlock) {
        //如果有值,让代理执行
        self.skipBlock(obj);
    }
    //跳转过去之后要让coverView消失,这样grayTableView就一起消失了
    [self removeFromSuperview];

}

//MARK: - 布局子控件
- (void)layoutSubviews{
    self.grayTableView.width = 160;
    self.grayTableView.height = 44 * self.listArr.count;
    self.grayTableView.y = 70;
    self.grayTableView.x = self.width - self.grayTableView.width - 5;

}
//MARK: - 懒加载
-(NSArray *)listArr{
    if (!_listArr) {
        _listArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:self.plistName ofType:@"plist"]];
    }
    return _listArr;
}

//MARK: - 触摸视图移除阴影遮罩
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self removeFromSuperview];
}
@end
