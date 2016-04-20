//
//  XZStatusResult.m
//  shine_weibo
//
//  Created by shine on 16/4/14.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "XZStatusResult.h"
#import "XZStatus.h"

@implementation XZStatusResult

+ (NSDictionary *)objectClassInArray
{
    return @{@"statuses":[XZStatus class]};
}

@end
