//
//  XZUserTool.h
//  shine_weibo
//
//  Created by shine on 16/4/14.
//  Copyright © 2016年 shine. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XZUserResult;


@interface XZUserTool : NSObject

+ (void)unreadWithSuccess:(void(^)(XZUserResult *result))success failure:(void(^)(NSError *error))failure;

@end
