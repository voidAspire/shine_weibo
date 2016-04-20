//
//  XZNewFeatureCell.h
//  shine_weibo
//
//  Created by shine on 16/4/13.
//  Copyright © 2016年 shine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XZNewFeatureCell : UICollectionViewCell

@property (nonatomic, strong) UIImage *image;

@property (nonatomic,assign) NSInteger index;

- (void)isFinalPageWithCurrent:(NSInteger)current all:(NSInteger)all;

@end
