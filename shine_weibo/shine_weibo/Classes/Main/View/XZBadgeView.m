//
//  XZBadgeView.m
//  shine_weibo
//
//  Created by shine on 16/4/12.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "XZBadgeView.h"

#define XZBadgeViewFont [UIFont systemFontOfSize:9]

@implementation XZBadgeView



- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = NO;
        
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        
        self.titleLabel.font = XZBadgeViewFont;
        
        [self sizeToFit];
    }
    
    return self;
}

- (void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue  = badgeValue;
    
    if (badgeValue.length == 0 || [badgeValue isEqualToString:@"0"]) {
        
        self.hidden = YES;
        
    }else{
        
        self.hidden = NO;
        
    }
    
    CGSize badgeValueSize = [badgeValue sizeWithFont:XZBadgeViewFont];
    
    if (badgeValueSize.width > self.width) {
        [self setImage:[UIImage imageNamed:@"new_dot"] forState:UIControlStateNormal];
        [self setTitle:nil forState:UIControlStateNormal];
        [self setBackgroundImage:nil forState:UIControlStateNormal];
    }else{
        [self setTitle:badgeValue forState:UIControlStateNormal];
        [self setImage:nil forState:UIControlStateNormal];
    }
    
}


@end
