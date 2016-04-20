//
//  XZStatus.h
//  shine_weibo
//
//  Created by shine on 16/4/14.
//  Copyright © 2016年 shine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XZUser.h"
#import "MJExtension.h"

@interface XZStatus : NSObject<MJKeyValue>

/**
 *  转发微博
 */
@property (nonatomic, strong)  XZStatus *retweeted_status;

/**
 *  用户
 */
@property (nonatomic, strong)  XZUser *user;

/**
 *  微博创建时间
 */
@property (nonatomic, copy) NSString *created_at;

/**
 *  字符串型的微博ID
 */
@property (nonatomic, copy) NSString *idstr;

/**
 *  微博信息内容
 */
@property (nonatomic, copy) NSString *text;

/**
 *  微博来源
 */
@property (nonatomic, copy) NSString *source;

/**
 *  转发数
 */
@property (nonatomic, assign) NSInteger reposts_count;

/**
 *  评论数
 */
@property (nonatomic, assign) NSInteger comments_count;

/**
 *  表态数(赞)
 */
@property (nonatomic, assign) NSInteger attitudes_count;

/**
 *  配图数组(XZPhoto)
 */
@property (nonatomic, strong) NSArray *pic_urls;

@end
