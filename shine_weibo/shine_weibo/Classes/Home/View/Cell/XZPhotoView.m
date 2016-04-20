//
//  XZPhotoView.m
//  shine_weibo
//
//  Created by shine on 16/4/17.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "XZPhotoView.h"
#import "XZPhoto.h"

#import "UIImageView+WebCache.h"

@interface XZPhotoView ()

@property (nonatomic, weak) UIImageView *gifView;

@end


@implementation XZPhotoView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        self.contentMode = UIViewContentModeScaleAspectFill;
        
        self.clipsToBounds = YES;
        UIImageView *gifView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"timeline_image_gif"]];
        [self addSubview:gifView];
        _gifView = gifView;
    }
    
    return self;
}

- (void)setPhoto:(XZPhoto *)photo
{
    _photo = photo;
    
    
    [self sd_setImageWithURL:photo.thumbnail_pic placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
    
    
    NSString *urlStr = photo.thumbnail_pic.absoluteString;
    if ([urlStr hasSuffix:@".gif"]) {
        self.gifView.hidden = NO;
    }else{
        self.gifView.hidden = YES;
    }
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.gifView.x = self.width - self.gifView.width;
    self.gifView.y = self.height - self.gifView.height;
    
}

@end
