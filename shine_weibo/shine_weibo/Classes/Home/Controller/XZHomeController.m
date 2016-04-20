//
//  XZHomeController.m
//  shine_weibo
//
//  Created by shine on 16/4/12.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "XZHomeController.h"
#import "XZOneViewController.h"
#import "XZStatus.h"
#import "XZUser.h"
#import "XZAccountTool.h"
#import "XZStatusTool.h"
#import "XZStatusFrame.h"
#import "XZStatusCell.h"

#import "UIImageView+WebCache.h"
#import "AFHTTPRequestOperationManager.h"
#import "MJExtension.h"
#import "MJRefresh.h"

#define XZHomeWeiboStatusUrl @"https://api.weibo.com/2/statuses/friends_timeline.json"
#define XZAccessToken @"access_token"
#define XZSinceId @"since_id"
#define XZMaxId @"max_id"

@interface XZHomeController ()

@property (nonatomic, strong) NSMutableArray *statuses;

@property (nonatomic, strong) NSMutableArray *statusFrames;


@end

@implementation XZHomeController

- (NSMutableArray *)statuses
{
    if (!_statuses) {
        _statuses = [NSMutableArray array];
    }
    
    return _statuses;
}

- (NSMutableArray *)statusFrames
{
    if (!_statusFrames) {
        _statusFrames = [NSMutableArray array];
    }
    
    return _statusFrames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"navigationbar_pop"] highImage:[UIImage imageNamed:@"navigationbar_pop_highlighted"] target:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addFooterWithTarget:self action:@selector(loadMoreStatus)];
    [self.tableView addHeaderWithTarget:self action:@selector(loadNewStatus)];
    [self.tableView headerBeginRefreshing];

}



- (void)loadNewStatus
{
    
    NSString *sinceId = nil;
    if (self.statusFrames.count) {
        sinceId = [[[self.statusFrames firstObject] status] idstr];
    }
    
    [XZStatusTool newStatusWithSinceId:sinceId success:^(NSArray *statuses) {
        
        [self.tableView headerEndRefreshing];
        NSIndexSet *index = [[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(0, statuses.count)];
        
        NSMutableArray *statusFrames = [NSMutableArray array];
        for (XZStatus *status in statuses) {
            XZStatusFrame *statusFrame = [[XZStatusFrame alloc] init];
            statusFrame.status = status;
            [statusFrames addObject:statusFrame];
        }
        
        [self.statusFrames insertObjects:statusFrames atIndexes:index];
        

        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}




- (void)loadMoreStatus
{

    
    NSString *maxId = nil;
    if (self.statusFrames.count) {
        long long max = [[[[self.statusFrames lastObject] status] idstr] longLongValue] - 1;
        maxId = [NSString stringWithFormat:@"%lld", max];
    }
    
    [XZStatusTool moreStatusWithMaxId:maxId success:^(NSArray *statuses) {
        

        [self.tableView footerEndRefreshing];
        NSMutableArray *statusFrames = [NSMutableArray array];
        for (XZStatus *status in statuses) {
            XZStatusFrame *statusFrame = [[XZStatusFrame alloc] init];
            statusFrame.status = status;
            [statusFrames addObject:statusFrame];
        }
        
        [self.statusFrames addObjectsFromArray:statusFrames];
        

        
        [self.tableView reloadData];
        
        
    } failure:^(NSError *error) {
        XZLog(@"%@", error);
        
    }];
}

- (void)pop
{
    XZOneViewController *vc = [[XZOneViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.statusFrames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseId = @"cell";
    XZStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (!cell) {
        cell = [[XZStatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseId];
    }
    
    
    XZStatusFrame *statusFrame = self.statusFrames[indexPath.row];
    
    cell.statusFrame = statusFrame;

    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 获取status模型
    XZStatusFrame *statusFrame = self.statusFrames[indexPath.row];
    
    return statusFrame.cellHeight;
    
}



@end
