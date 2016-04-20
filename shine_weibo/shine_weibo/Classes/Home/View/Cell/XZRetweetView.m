//
//  XZRetweetView.m
//  shine_weibo
//
//  Created by shine on 16/4/15.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "XZRetweetView.h"
#import "XZStatusFrame.h"
#import "XZStatus.h"
#import "XZPhotosView.h"

@interface XZRetweetView ()


@property (nonatomic, weak) UILabel *nameView;


@property (nonatomic, weak) UILabel *textView;


@property (nonatomic, weak) XZPhotosView *photosView;

@end

@implementation XZRetweetView



- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        
        [self setUpAllChildView];
        self.userInteractionEnabled = YES;
        self.image = [UIImage imageNameWithStretchable:@"timeline_retweet_background"];
    }
    return self;
}


- (void)setUpAllChildView
{
    
    
    UILabel *nameView = [[UILabel alloc] init];
    nameView.font = XZNameFont;
    [self addSubview:nameView];
    _nameView = nameView;
    
    
    
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
    
    
    XZStatus *status = statusFrame.status;
    
    _nameView.frame = statusFrame.retweetNameFrame;
    _nameView.text = status.retweeted_status.user.name;
    
    
    _textView.frame = statusFrame.retweetTextFrame;
    _textView.text = status.retweeted_status.text;
    
    _photosView.frame = statusFrame.retweetPhotosFrame;
    _photosView.pic_urls = status.retweeted_status.pic_urls;
}

@end
