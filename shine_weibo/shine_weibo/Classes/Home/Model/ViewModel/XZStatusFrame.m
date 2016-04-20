//
//  XZStatusFrame.m
//  shine_weibo
//
//  Created by shine on 16/4/15.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "XZStatusFrame.h"
#import "XZStatus.h"
#import "XZUser.h"



@implementation XZStatusFrame

- (void)setStatus:(XZStatus *)status
{
    _status = status;
    
    
    [self setUpOriginalViewFrame];
    
    CGFloat toolBarY = CGRectGetMaxY(_originalViewFrame);
    
    if (status.retweeted_status) {
        
        
        [self setUpRetweetViewFrame];
        
        toolBarY = CGRectGetMaxY(_retweetViewFrame);
    }
    
    CGFloat toolBarX = 0;
    CGFloat toolBarW = XZScreenW;
    CGFloat toolBarH = 35;
    _barFrame = CGRectMake(toolBarX, toolBarY, toolBarW, toolBarH);
    
    
    _cellHeight = CGRectGetMaxY(_barFrame);
    
}

#pragma mark - 计算原创微博
- (void)setUpOriginalViewFrame
{
    
    CGFloat imageX = XZStatusCellMargin;
    CGFloat imageY = imageX;
    CGFloat imageWH = 35;
    _originalIconFrame = CGRectMake(imageX, imageY, imageWH, imageWH);
    
    
    CGFloat nameX = CGRectGetMaxX(_originalIconFrame) + XZStatusCellMargin;
    CGFloat nameY = imageY;
    CGSize nameSize = [_status.user.name sizeWithFont:XZNameFont];
    _originalNameFrame = (CGRect){{nameX,nameY},nameSize};
    
    
    if (_status.user.vip) {
        CGFloat vipX = CGRectGetMaxX(_originalNameFrame) + XZStatusCellMargin;
        CGFloat vipY = nameY;
        CGFloat vipWH = 14;
        _originalVipFrame = CGRectMake(vipX, vipY, vipWH, vipWH);
        
    }
    
    
//    CGFloat timeX = nameX;
//    CGFloat timeY = CGRectGetMaxY(_originalNameFrame) + XZStatusCellMargin * 0.5;
//    CGSize timeSize = [_status.created_at sizeWithFont:XZTimeFont];
//    _originalTimeFrame = (CGRect){{timeX,timeY},timeSize};
    
    
//    CGFloat sourceX = CGRectGetMaxX(_originalTimeFrame) + XZStatusCellMargin;
//    CGFloat sourceY = timeY;
//    CGSize sourceSize = [_status.source sizeWithFont:XZSourceFont];
//    _originalSourceFrame = (CGRect){{sourceX,sourceY},sourceSize};
    
    
    CGFloat textX = imageX;
    CGFloat textY = CGRectGetMaxY(_originalIconFrame) + XZStatusCellMargin;
    
    CGFloat textW = XZScreenW - 2 * XZStatusCellMargin;
    CGSize textSize = [_status.text sizeWithFont:XZTextFont constrainedToSize:CGSizeMake(textW, MAXFLOAT)];
    _originalTextFrame = (CGRect){{textX,textY},textSize};

    CGFloat originH = CGRectGetMaxY(_originalTextFrame) + XZStatusCellMargin;

    if (_status.pic_urls.count) {
        CGFloat photosX = textX;
        CGFloat photosY = CGRectGetMaxY(_originalTextFrame) + XZStatusCellMargin;
        CGSize photosSize = [self photosSizeWithCount:_status.pic_urls.count];
        _originalPhotosFrame = (CGRect){{photosX, photosY}, photosSize};
        originH = CGRectGetMaxY(_originalPhotosFrame) + XZStatusCellMargin;
        
    }
    
    
    CGFloat originX = 0;
    CGFloat originY = 10;
    CGFloat originW = XZScreenW;

    _originalViewFrame = CGRectMake(originX, originY, originW, originH);
    
}

- (CGSize)photosSizeWithCount:(NSInteger)count
{
    
    NSInteger cols = count == 4? 2 : 3;
    
    NSInteger rols = (count - 1) / cols + 1;
    CGFloat photoWH = 70;
    CGFloat w = cols * photoWH + (cols - 1) * XZStatusCellMargin;
    CGFloat h = rols * photoWH + (rols - 1) * XZStatusCellMargin;
    
    
    return CGSizeMake(w, h);
    
}

#pragma mark - 计算转发微博
- (void)setUpRetweetViewFrame
{
    
    CGFloat nameX = XZStatusCellMargin;
    CGFloat nameY = nameX;
    
    CGSize nameSize = [_status.retweeted_status.user.name sizeWithFont:XZNameFont];
    _retweetNameFrame = (CGRect){{nameX,nameY},nameSize};
    
    
    CGFloat textX = nameX;
    CGFloat textY = CGRectGetMaxY(_retweetNameFrame) + XZStatusCellMargin;
    
    CGFloat textW = XZScreenW - 2 * XZStatusCellMargin;
    
    CGSize textSize = [_status.retweeted_status.text sizeWithFont:XZTextFont constrainedToSize:CGSizeMake(textW, MAXFLOAT)];
    _retweetTextFrame = (CGRect){{textX,textY},textSize};
    
    
    CGFloat retweetH = CGRectGetMaxY(_retweetTextFrame) + XZStatusCellMargin;

    if (_status.retweeted_status.pic_urls.count) {
        CGFloat photosX = textX;
        CGFloat photosY = CGRectGetMaxY(_retweetTextFrame) + XZStatusCellMargin;
        CGSize photosSize = [self photosSizeWithCount:_status.retweeted_status.pic_urls.count];
        _retweetPhotosFrame = (CGRect){{photosX, photosY}, photosSize};
        retweetH = CGRectGetMaxY(_retweetPhotosFrame) + XZStatusCellMargin;
        
    }
    
    
    
    CGFloat retweetX = 0;
    CGFloat retweetY = CGRectGetMaxY(_originalViewFrame);
    CGFloat retweetW = XZScreenW;
    _retweetViewFrame = CGRectMake(retweetX, retweetY, retweetW, retweetH);
    
}




@end
