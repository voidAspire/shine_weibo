//
//  UIView+XZFram.m
//  shine_weibo
//
//  Created by shine on 16/4/12.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "UIView+XZFram.h"

@implementation UIView (XZFram)

- (void)setX:(CGFloat)x
{
    CGRect fram = self.frame;
    fram.origin.x = x;
    self.frame = fram;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect fram = self.frame;
    fram.origin.y = y;
    self.frame = fram;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect fram = self.frame;
    fram.size.width = width;
    self.frame = fram;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect fram = self.frame;
    fram.size.height = height;
    self.frame = fram;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

@end
