//
//  ProfileViewController.m
//  SinaWeibo
//
//  Created by android_ls on 15/5/17.
//  Copyright (c) 2015年 android_ls. All rights reserved.
//

#import "ProfileViewController.h"
#import "SettingViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     // 设置导航栏右侧的设置按钮
     UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:0 target:self action:@selector(setting)];
    [barButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:kColor(253, 109, 10),
                                   NSFontAttributeName:[UIFont systemFontOfSize:15]}
                        forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = barButtonItem;
    
    
}

- (void)setting
{
    MyLog(@"用户点击了设置按钮");
    SettingViewController * settingViewController = [[SettingViewController alloc]init];
    [self.navigationController pushViewController:settingViewController animated:YES];
}

@end
