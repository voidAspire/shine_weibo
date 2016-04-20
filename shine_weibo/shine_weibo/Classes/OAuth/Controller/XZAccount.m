//
//  XZAccount.m
//  shine_weibo
//
//  Created by shine on 16/4/14.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "XZAccount.h"

#define XZAccessToken @"access_token"
#define XZExpiresIn @"expires_in"
#define XZRemindIn @"remind_in"
#define XZUid @"uid"
#define XZExpiresDate @"expiresDate"

@implementation XZAccount

+ (instancetype)accountWithDic:(NSDictionary *)dic
{
    XZAccount *account = [[self alloc] init];
    [account setValuesForKeysWithDictionary:dic];
    return account;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        _access_token = [aDecoder decodeObjectForKey:XZAccessToken];
        _expires_in = [aDecoder decodeObjectForKey:XZExpiresIn];
        _remind_in = [aDecoder decodeObjectForKey:XZRemindIn];
        _uid = [aDecoder decodeObjectForKey:XZUid];
        _expiresDate = [aDecoder decodeObjectForKey:XZExpiresDate];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_access_token forKey:XZAccessToken];
    [aCoder encodeObject:_expiresDate forKey:XZExpiresDate];
    [aCoder encodeObject:_expires_in forKey:XZExpiresIn];
    [aCoder encodeObject:_remind_in forKey:XZRemindIn];
    [aCoder encodeObject:_uid forKey:XZUid];
}

- (void)setExpires_in:(NSString *)expires_in
{
    _expires_in = expires_in;
    _expiresDate = [NSDate dateWithTimeIntervalSinceNow:[expires_in longLongValue]];
}




@end
