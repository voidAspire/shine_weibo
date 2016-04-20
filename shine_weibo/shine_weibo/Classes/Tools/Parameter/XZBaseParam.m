//
//  XZBaseParam.m
//  shine_weibo
//
//  Created by shine on 16/4/14.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "XZBaseParam.h"
#import "XZAccount.h"
#import "XZAccountTool.h"

@implementation XZBaseParam

+ (instancetype)param
{
    XZBaseParam *param = [[self alloc] init];
    param.access_token = [XZAccountTool account].access_token;
    
    return param;
}

@end
