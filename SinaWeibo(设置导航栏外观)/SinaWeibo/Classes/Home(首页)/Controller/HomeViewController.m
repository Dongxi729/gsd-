//
//  HomeViewController.m
//  SinaWeibo
//
//  Created by android_ls on 15/5/17.
//  Copyright (c) 2015年 android_ls. All rights reserved.
//
//  首页动态列表控制器

#import "HomeViewController.h"
#import "UIBarButtonItem+Category.h"
#import "FriendAttentionStatusViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航栏左侧的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem leftBarButtonItemWithTarget:self action:@selector(friendsearch) image:@"navigationbar_friendsearch" highImage:@"navigationbar_friendsearch_highlighted"];
    
    // 设置导航栏右侧的弹出下拉菜单按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem rightBarButtonItemWithTarget:self action:@selector(pop) image:@"navigationbar_pop" highImage:@"navigationbar_pop_highlighted"];
    
    
}

#pragma mark 打开好友关注动态控制器
-(void)friendsearch
{
    MyLog(@"用户点击了左侧按钮");
    
    FriendAttentionStatusViewController *friendAttentionStatusVC = [[FriendAttentionStatusViewController alloc]init];
    [self.navigationController pushViewController:friendAttentionStatusVC animated:YES];
}

#pragma mark 弹出下拉菜单
-(void)pop
{
    MyLog(@"用户点击了右侧弹出下拉菜单按钮");
    
}

@end
