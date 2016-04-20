//
//  XZUserTool.m
//  shine_weibo
//
//  Created by shine on 16/4/14.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "XZUserTool.h"
#import "XZUserResult.h"
#import "XZUserParam.h"
#import "XZHttpTool.h"
#import "XZAccount.h"
#import "XZAccountTool.h"

#import "MJExtension.h"

#define XZUnreadUrl @"https://rm.api.weibo.com/2/remind/unread_count.json"

@implementation XZUserTool

+ (void)unreadWithSuccess:(void (^)(XZUserResult *))success failure:(void (^)(NSError *))failure
{
    XZUserParam *param = [XZUserParam param];
    param.uid = [XZAccountTool account].uid;
    
    [XZHttpTool GET:XZUnreadUrl parameters:param.keyValues success:^(id responseObject) {
       
        XZUserResult *result = [XZUserResult objectWithKeyValues:responseObject];
        
        if (success) {
            success(result);
        }
        
    } failure:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
        
    }];
    
}

@end
