//
//  XZStatusCell.h
//  shine_weibo
//
//  Created by shine on 16/4/15.
//  Copyright © 2016年 shine. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XZStatusFrame;

@interface XZStatusCell : UITableViewCell

@property (nonatomic, strong) XZStatusFrame *statusFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
