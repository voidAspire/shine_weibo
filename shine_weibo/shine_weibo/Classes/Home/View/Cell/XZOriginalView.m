//
//  XZOriginalView.m
//  shine_weibo
//
//  Created by shine on 16/4/15.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "XZOriginalView.h"
#import "XZStatus.h"
#import "XZStatusFrame.h"
#import "XZPhotosView.h"

#import "UIImageView+WebCache.h"

@interface XZOriginalView ()

// 头像
@property (nonatomic, weak) UIImageView *iconView;

// 昵称
@property (nonatomic, weak) UILabel *nameView;

// vip
@property (nonatomic, weak) UIImageView *vipView;

// 时间
@property (nonatomic, weak) UILabel *timeView;

// 来源
@property (nonatomic, weak) UILabel *sourceView;

// 正文
@property (nonatomic, weak) UILabel *textView;

// 配图
@property (nonatomic, weak) XZPhotosView *photosView;

@end

@implementation XZOriginalView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setUpAllChildView];
        
        self.userInteractionEnabled = YES;
        
        self.image = [UIImage imageNameWithStretchable:@"timeline_card_top_background"];
        
    }
    
    return self;
}

- (void)setUpAllChildView
{
    
    UIImageView *iconView = [[UIImageView alloc] init];
    [self addSubview:iconView];
    _iconView = iconView;
    
    
    UILabel *nameView = [[UILabel alloc] init];
    nameView.font = XZNameFont;
    [self addSubview:nameView];
    _nameView = nameView;
    
    
    UIImageView *vipView = [[UIImageView alloc] init];
    [self addSubview:vipView];
    _vipView = vipView;
    
    
    UILabel *timeView = [[UILabel alloc] init];
    timeView.font = XZTimeFont;
    [self addSubview:timeView];
    _timeView = timeView;
    
    
    UILabel *sourceView = [[UILabel alloc] init];
    sourceView.font = XZSourceFont;
    [self addSubview:sourceView];
    _sourceView = sourceView;
    
    
    UILabel *textView = [[UILabel alloc] init];
    textView.font = XZTextFont;
    textView.numberOfLines = 0;
    [self addSubview:textView];
    _textView = textView;
    
    XZPhotosView *photosView = [[XZPhotosView alloc] init];
    [self addSubview:photosView];
    _photosView = photosView;
}

- (void)setStatusFrame:(XZStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    
    [self setUpFrame];
    
    [self setUpData];
    
}

- (void)setUpData
{
    XZStatus *status = _statusFrame.status;
    
    [_iconView sd_setImageWithURL:status.user.profile_image_url placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    
    
    if (status.user.vip) {
        _nameView.textColor = [UIColor redColor];
    }else{
        _nameView.textColor = [UIColor blackColor];
    }
    _nameView.text = status.user.name;
    
    
    NSString *imageName = [NSString stringWithFormat:@"common_icon_membership_level%d",status.user.mbrank];
    UIImage *image = [UIImage imageNamed:imageName];
    
    _vipView.image = image;
    
    
    _timeView.text = status.created_at;
    if ([_timeView.text isEqualToString:@"刚刚"]) {
        _timeView.textColor = [UIColor orangeColor];
    }
    
    
    
    _sourceView.text = status.source;
    
    
    _textView.text = status.text;
    
    _photosView.pic_urls = status.pic_urls;
}

- (void)setUpFrame
{
    
    _iconView.frame = _statusFrame.originalIconFrame;

    
    _nameView.frame = _statusFrame.originalNameFrame;
    
    
    if (_statusFrame.status.user.vip) {
        _vipView.hidden = NO;
        _vipView.frame = _statusFrame.originalVipFrame;
    }else{
        _vipView.hidden = YES;
    }
    
    CGFloat timeX = _nameView.frame.origin.x;
    CGFloat timeY = CGRectGetMaxY(_nameView.frame) + XZStatusCellMargin * 0.5;
    CGSize timeSize = [_statusFrame.status.created_at sizeWithFont:XZTimeFont];
    _timeView.frame = (CGRect){{timeX,timeY},timeSize};

    
    
    CGFloat sourceX = CGRectGetMaxX(_timeView.frame) + XZStatusCellMargin;
    CGFloat sourceY = timeY;
    CGSize sourceSize = [_statusFrame.status.source sizeWithFont:XZSourceFont];
    _sourceView.frame = (CGRect){{sourceX,sourceY},sourceSize};

    
    
    _textView.frame = _statusFrame.originalTextFrame;
    

    _photosView.frame = _statusFrame.originalPhotosFrame;
    
}



@end
