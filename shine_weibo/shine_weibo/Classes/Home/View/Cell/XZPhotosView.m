//
//  XZPhotosView.m
//  shine_weibo
//
//  Created by shine on 16/4/16.
//  Copyright © 2016年 shine. All rights reserved.
//



#import "XZPhotosView.h"
#import "XZPhotoView.h"
#import "XZPhoto.h"

#import "MJPhoto.h"
#import "MJPhotoBrowser.h"



@implementation XZPhotosView



- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {

        
        [self setUpAllChildView];
    }
    
    return self;
}


- (void)setUpAllChildView
{
    for (NSInteger i = 0; i < 9; i++) {
        
        XZPhotoView *imageV = [[XZPhotoView alloc] init];
        
        imageV.tag = i;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [imageV addGestureRecognizer:tap];
        
        [self addSubview:imageV];
    }
}

- (void)tap:(UITapGestureRecognizer *)tap
{
    UIImageView *tapView = (UIImageView *)tap.view;
    NSInteger i = 0;
    NSMutableArray *arrM = [NSMutableArray array];
    for (XZPhoto *photo in _pic_urls) {
        
        MJPhoto *p = [[MJPhoto alloc] init];
        NSString *urlStr = photo.thumbnail_pic.absoluteString;
        urlStr = [urlStr stringByReplacingOccurrencesOfString:@"thumbnail" withString:@"bmiddle"];
        p.url = [NSURL URLWithString:urlStr];
        p.index = (int)i;
        p.srcImageView = tapView;
        [arrM addObject:p];
        i++;
    }
    
    
    
    MJPhotoBrowser *brower = [[MJPhotoBrowser alloc] init];
    
    brower.photos = arrM;
    brower.currentPhotoIndex = tapView.tag;
    [brower show];
}

- (void)setPic_urls:(NSArray *)pic_urls
{
    
    _pic_urls = pic_urls;
    NSInteger count = self.subviews.count;
    for (int i = 0; i < count; i++) {
        
        XZPhotoView *imageV = self.subviews[i];
        
        if (i < _pic_urls.count) {
            imageV.hidden = NO;
            
            
            XZPhoto *photo = _pic_urls[i];
            
            imageV.photo = photo;
            
            
        }else{
            imageV.hidden = YES;
        }
        
    }
    
}

// 计算尺寸
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = 70;
    CGFloat h = 70;
    CGFloat margin = 10;
    NSInteger col = 0;
    NSInteger rol = 0;
    NSInteger cols = _pic_urls.count==4?2:3;
    
    for (NSInteger i = 0; i < _pic_urls.count; i++) {
        col = i % cols;
        rol = i / cols;
        XZPhotoView *imageV = self.subviews[i];
        x = col * (w + margin);
        y = rol * (h + margin);
        imageV.frame = CGRectMake(x, y, w, h);
    }
    
}





@end
