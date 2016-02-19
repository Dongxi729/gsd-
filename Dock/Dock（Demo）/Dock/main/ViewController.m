//
//  ViewController.m
//  TabBarView
//
//  Created by 郑东喜 on 16/2/19.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "ViewController.h"
//#import "Dock.h"
#import "PrefixHeader.pch"
#import <tarbar/tarbar.h>

//---------


/**
 *   不能响应交互
 1.userIntereactionEnable = NO;
 2.hidden = YES;
 3.clearColor
 */
#define KDOckHeight 44

@interface ViewController () {
    Dock* _dock;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
    // Do any additional setup after loading the view, typically from a nib.

    //1.添加dock
    Dock* dock = [[Dock alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - KDOckHeight, self.view.frame.size.width, KDOckHeight)];
    
     //2.添加到主界面
    [self.view addSubview:dock];
    
    [dock addDockItemWithIcon:@"main_page" title:@"首页" textColor:@"dockTitlecolor"];
    [dock addDockItemWithIcon:@"smartHome" title:@"智汇家" textColor:@"dockTitlecolor"];
    [dock addDockItemWithIcon:@"creater" title:@"创客" textColor:@"dockTitlecolor"];
    [dock addDockItemWithIcon:@"custom" title:@"账户" textColor:@"dockTitlecolor"];
    //3.监听Dock内部item点击
    dock.itemClickBlock = ^(int index) {
        QLOG(@"选中啦第%d个item",index);
    };
    _dock = dock;
    
    self.view.backgroundColor = [UIColor grayColor];
}

//代码单击视图切换到tag对应的图标
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _dock.selectedIndex = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
