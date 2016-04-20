//
//  XZStatus.m
//  shine_weibo
//
//  Created by shine on 16/4/14.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "XZStatus.h"
#import "XZPhoto.h"

@implementation XZStatus

+ (NSDictionary *)objectClassInArray
{
    return @{@"pic_urls":[XZPhoto class]};
}

- (NSString *)created_at
{
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"EEE MMM d HH:mm:ss Z yyyy";
    fmt.locale = [NSLocale localeWithLocaleIdentifier:@"en_us"];
    NSDate *created_at = [fmt dateFromString:_created_at];
    
    if ([created_at isThisYear]) {
        
        if ([created_at isToday]) { 
            
            
            NSDateComponents *cmp = [created_at deltaWithNow];
            

            
            if (cmp.hour >= 1) {
                return [NSString stringWithFormat:@"%ld小时之前",cmp.hour];
            }else if (cmp.minute > 1){
                return [NSString stringWithFormat:@"%ld分钟之前",cmp.minute];
            }else{
                return @"刚刚";
            }
            
        }else if ([created_at isYesterday]){
            fmt.dateFormat = @"昨天 HH:mm";
            return  [fmt stringFromDate:created_at];
            
        }else{
            fmt.dateFormat = @"MM-dd HH:mm";
            return  [fmt stringFromDate:created_at];
        }
        
        
        
    }else{ 
        
        fmt.dateFormat = @"yyyy-MM-dd HH:mm";
        
        return [fmt stringFromDate:created_at];
        
    }

    return _created_at;
}


- (void)setSource:(NSString *)source
{
    NSRange range = [source rangeOfString:@">"];
    source = [source substringFromIndex:range.location + range.length];
    range = [source rangeOfString:@"<"];
    source = [source substringToIndex:range.location];
    source = [NSString stringWithFormat:@"来自%@",source];
    
    _source = source;

}

@end
