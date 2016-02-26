//
//  ViewController.m
//  TabBarView
//
//  Created by 郑东喜 on 16/2/19.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "ViewController.h"
#import "Dock.h"

//#import <iOS/iOS.h>
//#import <tarbar/tarbar.h>
#import "PrefixHeader.pch"

#import "Creater.h"
#import "Custom.h"
#import "Creater_home.h"
#import "Main_page.h"
#import "Five.h"

//---------
/**
 *   不能响应交互
 1.userIntereactionEnable = NO;
 2.hidden = YES;
 3.clearColor
 4.alpha＝0.01
 */
//底部高度
#define KDOckHeight 44

@interface ViewController () {
    //选中的子控制器
    UIViewController* _selectedViewController;
    //底部拷贝
    UIView * _dockView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    //1.添加dock
    [self addDock];
    
}

#pragma mark 创建所有的子控制器
- (void)addChildViewController:(UIViewController *)childController {
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController:childController];

    [super addChildViewController:nav];
}

- (void)createChildViewControllers {
    
    Main_page* main_page = [[Main_page alloc] init];
    main_page.title =@"首页";
    main_page.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:main_page];

    
    Creater_home* smartHome = [[Creater_home alloc] init];
    smartHome.title =@"智汇家";
    smartHome.view.backgroundColor = [UIColor blueColor];
    [self addChildViewController:smartHome];
    
    Creater* creater = [[Creater alloc] init];
    creater.title = @"创客";
    creater.view.backgroundColor = [UIColor grayColor];
    [self addChildViewController:creater];
    
    Custom* custom = [[Custom alloc] init];
    custom.title = @"账户";
    custom.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:custom];
    
    Five* five = [[Five alloc] init];
        custom.title = @"账户";
    five.view.backgroundColor = [UIColor orangeColor];
    [self addChildViewController:five];

}

- (void)addDock {
    Dock* dock = [[Dock alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - KDOckHeight, self.view.frame.size.width, KDOckHeight)];
    //2.添加到主界面
    
    [dock addDockItemWithIcon:@"main_page" title:@"首页" textColor:@"dockTitlecolor"];
    [dock addDockItemWithIcon:@"smartHome" title:@"智汇家" textColor:@"dockTitlecolor"];
    
    [dock addDockCenterIcon:@"test"];
    
    [dock addDockItemWithIcon:@"creater" title:@"创客" textColor:@"dockTitlecolor"];
    [dock addDockItemWithIcon:@"custom" title:@"账户" textColor:@"dockTitlecolor"];
    
    //2.创建所有子控制器
    [self createChildViewControllers];
    
    //默认选中第0个控制器
    [self selecteControllerAtIndex:0];

    //将当前资源拷贝到_dockView
    _dockView = dock;
    
    //3.监听Dock内部item点击
    dock.itemClickBlock = ^(int index) {
        //选中index对应的子控制器
        [self selecteControllerAtIndex:index];
        QLOG(@"选中啦第%d个item",index);
    };
    
    [self.view addSubview:dock];
}

//选中index对应的子控制器
- (void)selecteControllerAtIndex:(int)index {
    //切换子控制器
    
    //2.创建新视图
    UIViewController* new = self.childViewControllers[index];
    
    if (new == _selectedViewController) {
        return;
    }
    
    //1.移除
    [_selectedViewController.view removeFromSuperview];
    // 移除dock所在的view不然会被下一次点击的时候覆盖，中间的图标无法再次显示（防止内存资源占用）
    [_dockView removeFromSuperview];
    

    new.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - KDOckHeight);
    
    //重新添加视图
    [self.view addSubview:new.view];
    [self.view addSubview:_dockView];
    //3.让新控制器成为当前主控制器
    _selectedViewController = new;
    
    QLOG(@"选中啦第%d个item",index);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
