//
//  XZTabBar.m
//  shine_weibo
//
//  Created by shine on 16/4/12.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "XZTabBar.h"
#import "XZTabBarButton.h"

@interface XZTabBar ()

@property (nonatomic, weak) UIButton *plusButton;

@property (nonatomic, weak) UIButton *selectedButton;

@property (nonatomic, strong) NSMutableArray *buttons;


@end

@implementation XZTabBar



- (void)setItems:(NSArray *)items
{
    _items = items;
    
    for (UITabBarItem *item in items) {
        
        XZTabBarButton *btn = [XZTabBarButton buttonWithType:UIButtonTypeCustom];
        btn.item = item;
        btn.tag = self.buttons.count;

        
        [btn addTarget:self action:@selector(didSelect:) forControlEvents:UIControlEventTouchUpInside];
        
        if (btn.tag == 0) {
            [self didSelect:btn];
        }
        
        [self addSubview:btn];
        [self.buttons addObject:btn];
        
    }
}

- (void)didSelect:(UIButton *)button
{
    _selectedButton.selected = NO;
    button.selected = YES;
    _selectedButton = button;
    
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectIndex:)]) {
        [self.delegate tabBar:self didSelectIndex:button.tag];
    }
    
}

- (UIButton *)plusButton
{
    if (!_plusButton) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabbar_compose_background_icon_add"] forState:UIControlStateHighlighted];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];

        
        [btn sizeToFit];
        
        _plusButton = btn;
        
        [self addSubview:btn];
    }
    
    return _plusButton;
}

- (NSMutableArray *)buttons
{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    
    return _buttons;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat w = self.bounds.size.width;
    CGFloat h = self.bounds.size.height;
    
    CGFloat btnW = w / (self.items.count + 1);
    CGFloat btnH = h;
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    
    NSInteger i = 0;
    for (UIView *tabBarButton in self.buttons) {
        if (i == self.items.count / 2) {
            self.plusButton.center = CGPointMake(w / 2, h / 2);
            i++;
        }
        
        btnX = i * btnW;
        tabBarButton.frame = CGRectMake(btnX, btnY, btnW, btnH);

        i++;
    }
}

@end
