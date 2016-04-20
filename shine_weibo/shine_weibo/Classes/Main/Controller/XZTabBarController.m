//
//  XZTabBarController.m
//  shine_weibo
//
//  Created by shine on 16/4/11.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "XZTabBarController.h"
#import "XZTabBar.h"
#import "XZNavigationController.h"
#import "XZDiscoverController.h"
#import "XZHomeController.h"
#import "XZMessageController.h"
#import "XZProfileController.h"
#import "XZUserTool.h"
#import "XZUserResult.h"

@interface XZTabBarController ()<XZTabBarDelegate>

@property (nonatomic, weak) XZHomeController *home;

@property (nonatomic, weak) XZMessageController *message;

@property (nonatomic, weak) XZDiscoverController *discover;

@property (nonatomic, weak) XZProfileController *profile;

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation XZTabBarController

- (NSMutableArray *)items
{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    
    return _items;
}

+ (void)initialize
{
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    NSMutableDictionary *attriSel = [NSMutableDictionary dictionary];
    attriSel[NSForegroundColorAttributeName] = [UIColor orangeColor];
    NSMutableDictionary *attriNor = [NSMutableDictionary dictionary];
    
    attriNor[NSFontAttributeName] = [UIFont fontWithName:@"HelveticaNeue-Bold" size:12.5];
    
    
    [item setTitleTextAttributes:attriNor forState:UIControlStateNormal];
    [item setTitleTextAttributes:attriSel forState:UIControlStateSelected];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpAllChildViewcontroller];
    
    [self setUpTabBar];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updataUnread) userInfo:nil repeats:YES];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}



- (void)updataUnread
{
    
    /*
     
     返回值字段	字段类型	字段说明
     status	int	新微博未读数
     follower	int	新粉丝数
     cmt	int	新评论数
     dm	int	新私信数
     mention_status	int	新提及我的微博数
     mention_cmt	int	新提及我的评论数
     group	int	微群消息未读数
     private_group	int	私有微群消息未读数
     notice	int	新通知未读数
     invite	int	新邀请未读数
     badge	int	新勋章数
     photo	int	相册消息未读数
     msgbox	int	{{{3}}}
     */
    
    [XZUserTool unreadWithSuccess:^(XZUserResult *result) {
        
        _home.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", result.status];
        _message.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", result.notice];
        _profile.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", result.follower];
        
        [UIApplication sharedApplication].applicationIconBadgeNumber = result.status;
        
    } failure:^(NSError *error) {
        
        
    }];
}



- (void)setUpAllChildViewcontroller
{
    XZHomeController *home = [[XZHomeController alloc] init];
    [self setUpOneViewController:home normalImage:[UIImage imageNamed:@"tabbar_home"] selectedImage:[UIImage imageNameWithOriginalMode:@"tabbar_home_selected"] title:@"首页"];
    _home = home;

    XZMessageController *message = [[XZMessageController alloc] init];
    [self setUpOneViewController:message normalImage:[UIImage imageNamed:@"tabbar_message_center"] selectedImage:[UIImage imageNameWithOriginalMode:@"tabbar_message_center_selected"] title:@"消息"];
    _message = message;
    
    XZDiscoverController *discover = [[XZDiscoverController alloc] init];
    [self setUpOneViewController:discover normalImage:[UIImage imageNamed:@"tabbar_discover"] selectedImage:[UIImage imageNameWithOriginalMode:@"tabbar_discover_selected"] title:@"发现"];
    _discover = discover;
    
    XZProfileController *profile = [[XZProfileController alloc] init];
    [self setUpOneViewController:profile normalImage:[UIImage imageNamed:@"tabbar_profile"] selectedImage:[UIImage imageNameWithOriginalMode:@"tabbar_profile_selected"] title:@"我"];
    _profile = profile;
}

- (void)setUpOneViewController:(UIViewController *)vc normalImage:(UIImage *)normalImage selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    vc.title = title;
    vc.tabBarItem.image = normalImage;
    vc.tabBarItem.selectedImage = selectedImage;
    
    [self.items addObject:vc.tabBarItem];
    [self addChildViewController:vc];
    
    XZNavigationController *nav = [[XZNavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];
}


- (void)tabBar:(XZTabBar *)tabBar didSelectIndex:(NSInteger)index
{
    self.selectedIndex = index;
}

- (void)setUpTabBar
{
    XZTabBar *tabBar = [[XZTabBar alloc] initWithFrame:self.tabBar.bounds];
    tabBar.backgroundColor = [UIColor whiteColor];

    
    tabBar.items = self.items;
    tabBar.delegate = self;
    
    [self.tabBar addSubview:tabBar];

}



@end
