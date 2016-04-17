//
//  UIView+YHExtension.m
//  01-工具类
//
//  Created by 昱含 on 16/4/16.
//  Copyright © 2016年 itheima. All rights reserved.
//

#import "UIView+YHExtension.h"

@implementation UIView (YHExtension)

- (void)setX:(CGFloat)x {
    
    CGRect frame = self.frame;
    
    frame.origin.x = x;
    
    self.frame = frame;
    
}


- (CGFloat)x {
    
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    
    // 1.获取控件的frame
    CGRect frame = self.frame;
    
    // 2.修改frame的y
    frame.origin.y = y;
    
    // 3.修改后赋值给控件
    self.frame = frame;
    

}


- (CGFloat)y {
    
    return self.frame.origin.y;
}


- (void)setWidth:(CGFloat)width {
    
    CGRect frame = self.frame;
    
    frame.size.width = width;
    
    self.frame = frame;
    
}


- (CGFloat)width {
    
    return self.frame.size.width;
}


- (void)setHeight:(CGFloat)height {
    
    CGRect frame = self.frame;
    
    frame.size.height = height;
    
    self.frame = frame;
    
}


- (CGFloat)height {
    
    return self.frame.size.height;
}



- (void)setCenterX:(CGFloat)centerX {
    
    CGPoint center = self.center;
    
    center.x = centerX;
    
    self.center = center;
}

- (CGFloat)centerX {
    
    return self.center.x;
    
}


- (void)setCenterY:(CGFloat)centerY {
    
    CGPoint center = self.center;
    
    center.y = centerY;
    
    self.center = center;
}

- (CGFloat)centerY {
    
    return self.center.y;
    
}


@end
