//
//  UIBarButtonItem+XZItem.m
//  shine_weibo
//
//  Created by shine on 16/4/12.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "UIBarButtonItem+XZItem.h"

@implementation UIBarButtonItem (XZItem)

+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image highImage:(UIImage *)highImage target:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highImage forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:controlEvents];
    [button sizeToFit];
    
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
