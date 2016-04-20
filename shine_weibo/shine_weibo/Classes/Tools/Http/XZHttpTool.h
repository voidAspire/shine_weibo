//
//  XZHttpTool.h
//  shine_weibo
//
//  Created by shine on 16/4/14.
//  Copyright © 2016年 shine. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XZHttpTool : NSObject

+ (void)GET:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

+ (void)POST:(NSString *)URLString parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

@end
