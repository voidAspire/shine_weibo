//
//  XZNewFeatureCell.m
//  shine_weibo
//
//  Created by shine on 16/4/13.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "XZNewFeatureCell.h"
#import "XZTabBarController.h"

@interface XZNewFeatureCell ()

@property (nonatomic, weak) UIImageView *imageView;

@property (nonatomic, weak) UIButton *shareButton;

@property (nonatomic, weak) UIButton *beginButton;

@end

@implementation XZNewFeatureCell

- (UIImageView *)imageView
{
    if (!_imageView) {
        
        UIImageView *imageV = [[UIImageView alloc] init];
        
        _imageView = imageV;
        
        [self.contentView addSubview:imageV];
    }
    
    return _imageView;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    self.imageView.image = image;
}

- (UIButton *)shareButton
{
    if (!_shareButton) {
        UIButton *share = [[UIButton alloc] init];
        [share setTitle:@"分享给大家" forState:UIControlStateNormal];
        [share setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
        [share setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
        [share setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [share sizeToFit];
        [share addTarget:self action:@selector(shareChange) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:share];
        
        _shareButton = share;
    }
    
    return _shareButton;
}

- (UIButton *)beginButton
{
    if (!_beginButton) {
        UIButton *begin = [[UIButton alloc] init];
        [begin setTitle:@"开始微博" forState:UIControlStateNormal];
        [begin setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button"] forState:UIControlStateNormal];
        [begin setBackgroundImage:[UIImage imageNamed:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
        [begin sizeToFit];
        [begin addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:begin];

        _beginButton = begin;
    }
    
    return _beginButton;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
    
    self.shareButton.center = CGPointMake(self.width * 0.5, self.height * 0.7);
    self.beginButton.center = CGPointMake(self.width * 0.5, self.height * 0.8);

}

- (void)isFinalPageWithCurrent:(NSInteger)current all:(NSInteger)all
{
    if (current == all) {
        self.shareButton.hidden = NO;
        self.beginButton.hidden = NO;
    }else{
        self.shareButton.hidden = YES;
        
        self.beginButton.hidden = YES;
    }
}

- (void)shareChange
{
    self.shareButton.selected = !self.shareButton.selected;
}

- (void)start
{
    XZTabBarController *tabBarVc = [[XZTabBarController alloc] init];
    XZKeyWindow.rootViewController = tabBarVc;
}

@end
