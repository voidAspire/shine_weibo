//
//  XZAccouTool.h
//  shine_weibo
//
//  Created by shine on 16/4/14.
//  Copyright © 2016年 shine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XZAccount.h"

@interface XZAccountTool : NSObject

+ (void)saveAccount:(XZAccount *)account;

+ (XZAccount *)account;

+ (void)accountAccessTokenWithCode:(NSString *)code success:(void (^)())success failure:(void(^)(NSError *error))failure;

@end
