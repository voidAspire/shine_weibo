//
//  XZStatusTool.m
//  shine_weibo
//
//  Created by shine on 16/4/14.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "XZStatusTool.h"
#import "XZHttpTool.h"
#import "XZStatusParam.h"
#import "XZStatusResult.h"

#import "MJExtension.h"

#define XZHomeWeiboStatusUrl @"https://api.weibo.com/2/statuses/home_timeline.json"

@implementation XZStatusTool

+ (void)newStatusWithSinceId:(NSString *)sinceId success:(void (^)(NSArray *statuses))success failure:(void (^)(NSError *))failure
{
    XZStatusParam *param = [XZStatusParam param];
    if (sinceId) {
        param.since_id = sinceId;
    }

    [XZHttpTool GET:XZHomeWeiboStatusUrl parameters:param.keyValues success:^(id responseObject) {
        
        XZStatusResult *result = [XZStatusResult objectWithKeyValues:responseObject];
        
//        NSString *fileName = @"/Users/shine/Desktop/TEST.plist";
//        NSFileManager *fm = [NSFileManager defaultManager];
//        if ([fm createFileAtPath:fileName contents:nil attributes:nil] ==YES) {
//            
//            [responseObject writeToFile:fileName atomically:YES];
//        }
        
        if (success) {
            success(result.statuses);
        }
        
    } failure:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
        
    }];

}

+ (void)moreStatusWithMaxId:(NSString *)maxId success:(void (^)(NSArray *statuses))success failure:(void (^)(NSError *))failure
{
    XZStatusParam *param = [XZStatusParam param];
    if (maxId) {
        param.max_id = maxId;
    }
    
    [XZHttpTool GET:XZHomeWeiboStatusUrl parameters:param.keyValues success:^(id responseObject) {
        
        XZStatusResult *result = [XZStatusResult objectWithKeyValues:responseObject];
        
        if (success) {
            success(result.statuses);
        }
        
    } failure:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
    }];
    
}

@end
