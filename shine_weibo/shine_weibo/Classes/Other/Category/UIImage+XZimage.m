//
//  UIImage+XZimage.m
//  shine_weibo
//
//  Created by shine on 16/4/11.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "UIImage+XZimage.h"

@implementation UIImage (XZimage)

+ (instancetype)imageNameWithOriginalMode:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (instancetype)imageNameWithStretchable:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

@end
