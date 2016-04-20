//
//  XZNavigationController.m
//  shine_weibo
//
//  Created by shine on 16/4/12.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "XZNavigationController.h"
#import "XZTabBar.h"

@interface XZNavigationController ()<UINavigationControllerDelegate>

@property (nonatomic, strong) id gestureDelegate;

@end

@implementation XZNavigationController

+ (void)initialize
{
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    NSMutableDictionary *titleAttr = [NSMutableDictionary dictionary];
    titleAttr[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [item setTitleTextAttributes:titleAttr forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.delegate = self;

    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.gestureDelegate = self.interactivePopGestureRecognizer.delegate;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count) {
        
        viewController.hidesBottomBarWhenPushed = YES;  
        
        UIBarButtonItem *left = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_back"] highImage:[UIImage imageNamed:@"navigationbar_back_highlighted"] target:self action:@selector(popToPre) forControlEvents:UIControlEventTouchUpInside];
        
        viewController.navigationItem.leftBarButtonItem = left;
        
        UIBarButtonItem *right = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_more"] highImage:[UIImage imageNamed:@"navigationbar_more_highlighted"] target:self action:@selector(popToRoot) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.rightBarButtonItem = right;
    }
    
    [super pushViewController:viewController animated:YES];
}

- (void)popToPre
{
    [self popViewControllerAnimated:YES];
}

- (void)popToRoot
{
    [self popToRootViewControllerAnimated:YES];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UITabBarController *tabVc = (UITabBarController *)XZKeyWindow.rootViewController;
    for (UIView *view in tabVc.tabBar.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [view removeFromSuperview];
        }
    }
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController == self.viewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate = self.gestureDelegate;
    }else{
        self.interactivePopGestureRecognizer.delegate = nil;
    }
}



@end
