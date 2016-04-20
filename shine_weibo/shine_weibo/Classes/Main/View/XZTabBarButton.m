//
//  XZTabBarButton.m
//  shine_weibo
//
//  Created by shine on 16/4/12.
//  Copyright © 2016年 shine. All rights reserved.
//



#import "XZTabBarButton.h"
#import "XZBadgeView.h"

@interface XZTabBarButton ()

@property (nonatomic, weak) XZBadgeView *badgeView;

@end

@implementation XZTabBarButton



- (XZBadgeView *)badgeView
{
    if (!_badgeView) {
        
        XZBadgeView *view = [XZBadgeView buttonWithType:UIButtonTypeCustom];
        
        _badgeView = view;
        
        [self addSubview:view];
    }
    
    return _badgeView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        
        self.imageView.contentMode = UIViewContentModeCenter;

        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        
    }

    return self;
}

- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    
    [item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"selectedimage" options:NSKeyValueObservingOptionNew context:nil];
    [item addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew context:nil];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    [self setTitle:_item.title forState:UIControlStateNormal];
    [self setImage:_item.image forState:UIControlStateNormal];
    [self setImage:_item.selectedImage forState:UIControlStateSelected];
    

    self.badgeView.badgeValue = _item.badgeValue;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat imageX = 0;
    CGFloat imageY = 0;
    CGFloat imageWidth = self.bounds.size.width;
    CGFloat imageHeight = self.bounds.size.height * 0.7;
    self.imageView.frame = CGRectMake(imageX, imageY, imageWidth, imageHeight);

    
    CGFloat labelX = 0;
    CGFloat labelY = imageHeight - 3;
    CGFloat labelW = imageWidth;
    CGFloat labelH = self.bounds.size.height - labelY;
    self.titleLabel.frame = CGRectMake(labelX, labelY, labelW, labelH);
    
    self.badgeView.x = self.width - self.badgeView.width -10;
    self.badgeView.y = 0;
    
}

- (void)setHighlighted:(BOOL)highlighted{}


@end
