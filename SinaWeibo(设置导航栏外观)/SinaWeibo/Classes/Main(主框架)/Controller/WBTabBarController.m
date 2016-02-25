//
//  WBTabBarController.m
//  SinaWeibo
//
//  Created by android_ls on 15/5/17.
//  Copyright (c) 2015年 android_ls. All rights reserved.
//

#import "WBTabBarController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "DiscoverViewController.h"
#import "ProfileViewController.h"
#import "WBNavigationController.h"

@interface WBTabBarController ()
{
    HomeViewController * _homeViewController;
    MessageViewController * _messageViewController;
    DiscoverViewController * _discoverViewController;
    ProfileViewController * _profileViewController;
}
@end

@implementation WBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _homeViewController = [[HomeViewController alloc]init];
    [self addChildController:_homeViewController title:@"首页" image:@"tabbar_home"];
    
    _messageViewController = [[MessageViewController alloc]init];
    [self addChildController:_messageViewController title:@"消息" image:@"tabbar_message_center"];
    
    _discoverViewController = [[DiscoverViewController alloc]init];
    [self addChildController:_discoverViewController title:@"发现" image:@"tabbar_discover"];
    
    _profileViewController = [[ProfileViewController alloc]init];
    [self addChildController:_profileViewController title:@"我" image:@"tabbar_profile"];
}

/**
 * 添加子控制器到UITabBarController中
 */
- (void)addChildController:(UIViewController *)childViewController title:(NSString *)title image:(NSString *)image
{
    // 设置子控制器，tabbar和navigationBar上的title
    childViewController.title = title;
    
    // 设置tabBarItem上默认的指示图片和选中时的图片
    childViewController.tabBarItem.image = [UIImage imageNamed:image];
    childViewController.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@%@", image, @"_selected"]]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置tabBarItem上文字的样式（这里是设置文字在不同状态下的颜色值）
    [childViewController.tabBarItem setTitleTextAttributes:
     @{NSForegroundColorAttributeName:kColor(117, 117, 117)} forState:UIControlStateNormal];
    [childViewController.tabBarItem setTitleTextAttributes:
     @{NSForegroundColorAttributeName:kColor(253, 109, 10)} forState:UIControlStateSelected];
    
    // 使用系统默认的UINavigationController
//    [self addChildViewController:[[UINavigationController alloc] initWithRootViewController:childViewController]];
    
    // 使用我们自定义的导航栏(WBNavigationController继承自UINavigationController)
    WBNavigationController * navigationController = [[WBNavigationController alloc]initWithRootViewController:childViewController];
    [self addChildViewController:navigationController];
}

@end
