//
//  WBNavigationController.m
//  SinaWeibo
//
//  Created by android_ls on 15/5/19.
//  Copyright (c) 2015年 android_ls. All rights reserved.
//

#import "WBNavigationController.h"
#import "UIBarButtonItem+Category.h"

@interface WBNavigationController ()

@end

@implementation WBNavigationController

#pragma mark 在运行时仅被触发一次
#pragma mark 值得注意的是在此之前，父类的方法已经被执行过一次了，所以不需要调用super的该函数。
+ (void)initialize
{
    // 设置整个项目中所有UIBarButtonItem的外观样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    // 设置在UIControlStateNormal下，导航栏文字的大小和颜色
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:kColor(64, 64, 64),
                                   NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                forState:UIControlStateNormal];
    
    // 设置在UIControlStateHighlighted下，导航栏文字的大小和颜色
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:kColor(253, 109, 10),
                                   NSFontAttributeName:[UIFont systemFontOfSize:15]}
                                forState:UIControlStateHighlighted];
}

#pragma mark 重写这个方法目的：能够拦截所有push进来的控制器
#pragma mark viewController这个参数是即将push进来的控制器
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        // 如果push进来的控制器viewController，不是根控制器
        
        // 自动显示和隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 设置导航栏上左边的返回按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_back_withtext" highImage:@"navigationbar_back_withtext_highlighted" title:self.title];
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

@end
