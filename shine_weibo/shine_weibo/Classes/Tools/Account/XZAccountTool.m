//
//  XZAccouTool.m
//  shine_weibo
//
//  Created by shine on 16/4/14.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "XZAccountTool.h"
#import "XZAccount.h"
#import "XZAccountParam.h"
#import "XZHttpTool.h"

#import "MJExtension.h"

#define XZOAuthAccessTokenUrl @"https://api.weibo.com/oauth2/access_token"
#define XZAPPKey @"1367061963"
#define XZAppSecret @"90c0f4f86cec5511274dac6b565ef39e"
#define XZRedirectUrl @"http://www.baidu.com"

#define XZAccountDataPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingString:@"Account.data"]

@implementation XZAccountTool

+ (void)saveAccount:(XZAccount *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:XZAccountDataPath];
}


static XZAccount *_account;
+ (XZAccount *)account
{
    if (!_account) {
        _account = [NSKeyedUnarchiver unarchiveObjectWithFile:XZAccountDataPath];
        
        if ([[NSDate date] compare:_account.expiresDate] != NSOrderedAscending) {
            return nil;
        }
    }
    
    return _account;
}

+ (void)accountAccessTokenWithCode:(NSString *)code success:(void (^)())success failure:(void (^)(NSError *))failure
{
    /*
     client_id	true	string	申请应用时分配的AppKey。
     client_secret	true	string	申请应用时分配的AppSecret。
     grant_type	true	string	请求的类型，填写authorization_code
     
     grant_type为authorization_code时
     必选	类型及范围	说明
     code	true	string	调用authorize获得的code值。
     redirect_uri	true	string	回调地址，需需与注册应用里的回调地址一致。
     */
    XZAccountParam *param = [[XZAccountParam alloc] init];
    param.client_id = XZAPPKey;
    param.client_secret = XZAppSecret;
    param.grant_type = @"authorization_code";
    param.code = code;
    param.redirect_uri = XZRedirectUrl;

    
    [XZHttpTool POST:XZOAuthAccessTokenUrl parameters:param.keyValues success:^(id responseObject) {
        
        XZAccount *account = [XZAccount objectWithKeyValues:responseObject];
        
        [XZAccountTool saveAccount:account];
        
        if (success) {
            success();
        }
        
    } failure:^(NSError *error) {
        
        if (failure) {
            failure(error);
        }
        
    }];
    

}

@end
