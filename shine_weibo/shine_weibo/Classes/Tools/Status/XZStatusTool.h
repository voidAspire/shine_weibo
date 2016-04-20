//
//  XZStatusTool.h
//  shine_weibo
//
//  Created by shine on 16/4/14.
//  Copyright © 2016年 shine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XZStatusTool : NSObject

+ (void)newStatusWithSinceId:(NSString *)sinceId success:(void (^)(NSArray *statuses))success failure:(void (^)(NSError *error))failure;

+ (void)moreStatusWithMaxId:(NSString *)maxId success:(void (^)(NSArray *statuses))success failure:(void (^)(NSError *error))failure;

@end
