//
//  XZStatusBar.m
//  shine_weibo
//
//  Created by shine on 16/4/15.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "XZStatusBar.h"
#import "XZStatus.h"

@interface XZStatusBar ()

@property (nonatomic, strong) NSMutableArray *btns;
@property (nonatomic, strong) NSMutableArray *divideVs;

@property (nonatomic, weak) UIButton *retweet;
@property (nonatomic, weak) UIButton *comment;
@property (nonatomic, weak) UIButton *unlike;

@end

@implementation XZStatusBar

- (NSMutableArray *)btns
{
    if (_btns == nil) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

- (NSMutableArray *)divideVs
{
    if (_divideVs == nil) {
        
        _divideVs = [NSMutableArray array];
    }
    
    return _divideVs;
}



- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
        [self setUpAllChildView];
        self.userInteractionEnabled = YES;
        
        self.image = [UIImage imageNameWithStretchable:@"timeline_card_bottom_background"];
    }
    return self;
}


- (void)setUpAllChildView
{
    
    UIButton *retweet = [self setUpOneButtonWithTitle:@"转发" image:[UIImage imageNamed:@"timeline_icon_retweet"]];
    _retweet = retweet;
    
    
    UIButton *comment = [self setUpOneButtonWithTitle:@"评论" image:[UIImage imageNamed:@"timeline_icon_comment"]];
    _comment = comment;
    
    
    UIButton *unlike = [self setUpOneButtonWithTitle:@"赞" image:[UIImage imageNamed:@"timeline_icon_unlike"]];
    _unlike = unlike;
    
    for (int i = 0; i < 2; i++) {
        UIImageView *divideV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timeline_card_bottom_line"]];
        [self addSubview:divideV];
        [self.divideVs addObject:divideV];
    }
    
}

- (UIButton *)setUpOneButtonWithTitle:(NSString *)title image:(UIImage *)image
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    
    [self addSubview:btn];
    [self.btns addObject:btn];
    return btn;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    
    NSUInteger count = self.btns.count;
    CGFloat w = XZScreenW / count;
    CGFloat h = self.height;
    CGFloat x = 0;
    CGFloat y = 0;
    for (int i = 0; i < count ; i++) {
        UIButton *btn = self.btns[i];
        x = i * w;
        btn.frame = CGRectMake(x, y, w, h);
    }
    
    int i = 1;
    
    for (UIImageView *divide in self.divideVs) {
        UIButton *btn = self.btns[i];
        divide.x = btn.x;
        i++;
    }
    
}


- (void)setStatus:(XZStatus *)status
{
    _status = status;
    
    
    
    [self setBtn:_retweet title:status.reposts_count];
    
    
    [self setBtn:_comment title:status.comments_count];
    
    
    [self setBtn:_unlike title:status.attitudes_count];
    
    
}


- (void)setBtn:(UIButton *)btn title:(NSInteger)count
{
    
    NSString *title = nil;
    if (count) {
        
        if (count > 10000) {
            CGFloat floatCount = count / 10000.0;
            title = [NSString stringWithFormat:@"%.1f万",floatCount];
            title = [title stringByReplacingOccurrencesOfString:@".0" withString:@""];
        }else{
            title = [NSString stringWithFormat:@"%ld",count];
        }
        
        [btn setTitle:title forState:UIControlStateNormal];
    }
}

@end
