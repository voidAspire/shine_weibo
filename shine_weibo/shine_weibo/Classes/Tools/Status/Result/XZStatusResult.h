//
//  XZStatusResult.h
//  shine_weibo
//
//  Created by shine on 16/4/14.
//  Copyright © 2016年 shine. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MJExtension.h"

@interface XZStatusResult : NSObject<MJKeyValue>

@property (nonatomic, strong) NSArray *statuses;

@property (nonatomic, assign) NSInteger total_number;

@end
