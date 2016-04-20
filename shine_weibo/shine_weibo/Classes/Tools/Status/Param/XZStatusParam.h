//
//  XZStatusParam.h
//  shine_weibo
//
//  Created by shine on 16/4/14.
//  Copyright © 2016年 shine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XZBaseParam.h"

@interface XZStatusParam : XZBaseParam

@property (nonatomic, copy) NSString *since_id;

@property (nonatomic, copy) NSString *max_id;

@end
