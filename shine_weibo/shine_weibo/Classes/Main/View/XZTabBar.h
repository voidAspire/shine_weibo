//
//  XZTabBar.h
//  shine_weibo
//
//  Created by shine on 16/4/12.
//  Copyright © 2016年 shine. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XZTabBar;

@protocol XZTabBarDelegate <NSObject>

@optional
- (void)tabBar:(XZTabBar *)tabBar didSelectIndex:(NSInteger)index;


@end

@interface XZTabBar : UIView

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, weak) id<XZTabBarDelegate> delegate;

@end
