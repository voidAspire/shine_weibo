//
//  XZStatusCell.m
//  shine_weibo
//
//  Created by shine on 16/4/15.
//  Copyright © 2016年 shine. All rights reserved.
//

#import "XZStatusCell.h"
#import "XZOriginalView.h"
#import "XZRetweetView.h"
#import "XZStatusBar.h"
#import "XZStatusFrame.h"

@interface XZStatusCell ()

@property (nonatomic, weak) XZOriginalView *original;

@property (nonatomic, weak) XZRetweetView *retweet;

@property (nonatomic, weak) XZStatusBar *bar;

@end

@implementation XZStatusCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        [self setUpAllChildView];
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
    
}


- (void)setUpAllChildView
{
    
    XZOriginalView *originalView = [[XZOriginalView alloc] init];
    [self addSubview:originalView];
    _original = originalView;
    
    
    XZRetweetView *retweetView = [[XZRetweetView alloc] init];
    [self addSubview:retweetView];
    _retweet = retweetView;
    
    
    XZStatusBar *toolBar = [[XZStatusBar alloc] init];
    [self addSubview:toolBar];
    _bar = toolBar;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    id cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
        
    }
    
    return cell;
}


- (void)setStatusFrame:(XZStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    
    _original.frame = statusFrame.originalViewFrame;
    _original.statusFrame = statusFrame;
    
    
    _retweet.frame = statusFrame.retweetViewFrame;
    _retweet.statusFrame = statusFrame;
    
    
    _bar.frame = statusFrame.barFrame;
    _bar.status = statusFrame.status;
}



@end
