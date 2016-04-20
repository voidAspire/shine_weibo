//
//  XZBaseParam.h
//  shine_weibo
//
//  Created by shine on 16/4/14.
//  Copyright © 2016年 shine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XZBaseParam : NSObject

@property (nonatomic, copy) NSString *access_token;

+ (instancetype)param;

@end
