//
//  XZSearchBar.m
//  shine_weibo
//
//  Created by shine on 16/4/12.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "XZSearchBar.h"

@implementation XZSearchBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.background = [UIImage imageNameWithStretchable:@"searchbar_textfield_background"];
        
        self.font = [UIFont systemFontOfSize:13];
        
        UIImageView *leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"searchbar_textfield_search_icon"]];
        leftView.contentMode = UIViewContentModeCenter;
        leftView.width += 10;
        self.leftView = leftView;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    
    return self;
}

@end
