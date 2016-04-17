//
//  YHCoverView.h
//  weChatContacts
//
//  Created by 昱含 on 16/4/16.
//  Copyright © 2016年 YuHan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^skipBlock)(UIViewController *);

@interface YHCoverView : UIView

@property (nonatomic, copy) NSString *plistName;
@property (nonatomic, copy) skipBlock skipBlock;

@end
