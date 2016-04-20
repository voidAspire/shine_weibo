//
//  XZOAuthViewController.m
//  shine_weibo
//
//  Created by shine on 16/4/14.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "XZOAuthViewController.h"
#import "MBProgressHUD+MJ.h"
#import "AFNetworking.h"
#import "XZRootTool.h"
#import "XZAccountTool.h"
#import "XZAccount.h"

#define XZOAuthBaseUrl @"https://api.weibo.com/oauth2/authorize"
#define XZOAuthMobileUrl @"https://open.weibo.cn/oauth2/authorize"
#define XZOAuthAccessTokenUrl @"https://api.weibo.com/oauth2/access_token"
#define XZAPPKey @"1367061963"
#define XZAppSecret @"90c0f4f86cec5511274dac6b565ef39e"
#define XZRedirectUrl @"http://www.baidu.com"


@interface XZOAuthViewController ()<UIWebViewDelegate>

@end

@implementation XZOAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = self.view.frame;
    frame.origin.y += 20;
    frame.size.height -= 20;
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIWebView *web = [[UIWebView alloc] initWithFrame:frame];
    [self.view addSubview:web];
    
    NSString *requestStr = [[NSString alloc] initWithFormat:@"%@?client_id=%@&redirect_uri=%@", XZOAuthBaseUrl, XZAPPKey, XZRedirectUrl];
//    NSString *requestMobilStr = [[NSString alloc] initWithFormat:@"%@?client_id=%@&redirect_uri=%@&display=mobile", XZOAuthMobileUrl, XZAPPKey, XZRedirectUrl];

    
    
    NSURL *requestUrl = [NSURL URLWithString:requestStr];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:requestUrl];
    
    [web loadRequest:request];
    
    web.delegate = self;
    

}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showMessage:@"正在加载"];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUD];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlStr = request.URL.absoluteString;
    
    NSRange range = [urlStr rangeOfString:@"code="];
    if (range.length) {
        NSString *code = [urlStr substringFromIndex:range.length + range.location];
        [self getAccountAndAccessTokenWithCode:code];
        return NO;
    }
    
    return YES;
}

- (void)getAccountAndAccessTokenWithCode:(NSString *)code
{
    
    [XZAccountTool accountAccessTokenWithCode:code success:^{
       
        [XZRootTool chooseRootViewController:XZKeyWindow];
        
    } failure:^(NSError *error) {
        
        XZLog(@"%@", error);
        
        
    }];
    
}

@end
