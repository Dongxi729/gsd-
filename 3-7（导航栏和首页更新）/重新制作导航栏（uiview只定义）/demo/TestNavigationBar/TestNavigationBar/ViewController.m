//
//  ViewController.m
//  TestNavigationBar
//
//  Created by 郑东喜 on 16/3/1.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "ViewController.h"
#import <NavigationBar/NavigationBar.h>
#import "SecViewController.h"

#ifdef DEBUG
#define QLOG(...) NSLog(__VA_ARGS__);
#define QLOG_METHOD NSLog(@"%s", __func__);
#else
#define QLOG(...) ;
#define QLOG_METHOD ;
#endif

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    //1.设置导航栏（自定义uiview的大小），暂定(0, 0, [UIScreen mainScreen].bounds.size.width, 75)
    //2.设置navigationItem的类型（左／右）
    
    SetNaviItemBar *btnNavItem = [SetNaviItemBar initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width ,75) bgColor:[UIColor grayColor]];
    //依次添加两个navigationItem（左右两边）
    [btnNavItem setNavItemWithImg:@"test" addTarget:self btnAction:@selector(touch) itemType:left];
    [btnNavItem setNavItemWithImg:@"test" addTarget:self btnAction:@selector(touch) itemType:right];
    [self.view addSubview:btnNavItem];
    
    //添加搜索栏
    [btnNavItem setSearchBarWithTitle:@"rs"];

}

- (void)touch {
    QLOG(@"单击啦");
}

@end
