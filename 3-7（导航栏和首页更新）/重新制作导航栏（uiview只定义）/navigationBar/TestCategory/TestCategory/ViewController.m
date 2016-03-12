//
//  ViewController.m
//  TestCategory
//
//  Created by 郑东喜 on 16/2/26.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "ViewController.h"
#import "SetNaviItemBar.h"
#import "SearchBar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    //1.设置导航栏（自定义uiview的大小），暂定(0, 0, [UIScreen mainScreen].bounds.size.width, 75)
    //2.设置navigationItem的类型（左／右）
    
    SetNaviItemBar *btnNavItem = [SetNaviItemBar initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width ,75) bgColor:[UIColor grayColor]];
    
    [btnNavItem setNavItemWithImg:@"test" addTarget:self btnAction:@selector(righttouch) itemType:right];
    
    [btnNavItem setNavItemWithImg:@"creater" addTarget:self btnAction:@selector(lefttouch) itemType:left];
    

//    [btnNavItem setNavigationTitile:@"hello world" titileType:titleWithLocation];
//    [btnNavItem setCityNameBtnTarget:self setCItyNameBtnAction:@selector(lefttouch) setCityNameBtnTitle:@"iugiu" selectImg:@"test" setCityNameLocationLabelText:@"jhdhhsd" setLocationImg:@"test"];
    
    [btnNavItem setSearchBarWithTitle:@"tst"];


    [self.view addSubview:btnNavItem];
}

- (void)lefttouch {
    NSLog(@"left");
}

- (void)righttouch {
    NSLog(@"right");
}

@end
