//
//  XZRootTool.m
//  shine_weibo
//
//  Created by shine on 16/4/14.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "XZRootTool.h"
#import "XZNewFeatureController.h"
#import "XZTabBarController.h"

#define XZVersionKey @"version"

@implementation XZRootTool

+ (void)chooseRootViewController:(UIWindow *)window
{
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleVersion"];
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:XZVersionKey];
    
    if ([currentVersion isEqualToString:lastVersion]) {
        XZTabBarController *tabVc = [[XZTabBarController alloc] init];
        window.rootViewController = tabVc;
    }else{
        XZNewFeatureController *newVc = [[XZNewFeatureController alloc] init];
        window.rootViewController = newVc;
        
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:XZVersionKey];
    }
}

@end
