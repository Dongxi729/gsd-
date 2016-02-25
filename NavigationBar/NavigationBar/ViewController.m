//
//  ViewController.m
//  NavigationBar
//
//  Created by 郑东喜 on 16/2/22.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "ViewController.h"
#import "BTViewController.h"

//-------
#import "test.h"
//#import "NavigationTitleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view, typically from a nib.
    [self.navigationController.navigationBar setBarTintColor:[UIColor blueColor]];
    [self setUpNavigationItem];
    
    UIView *middle = [UIView setSearchBarSize:CGRectMake(0, 0, 120, 44) placeHolderText:@"Text" btnAction:@selector(touch)];
    self.navigationItem.titleView = middle;
}

- (void)setUpNavigationItem {

    //左边导航栏
    [self.navigationItem setItemWithImage:@"test1" size:CGSizeMake(24, 13) itemType:left];
    
    //右边导航栏
    [self.navigationItem setItemWithImage:@"test1" size:CGSizeMake(24, 13) itemType:right];
//    CustomBarItem *centerItem = [self.navigationItem setItemWithTitle:@"middle" textColor:[UIColor redColor] fontsize:12 itemType:right];
    
//    [centerItem addTarget:self selector:@selector(touch) event:UIControlEventTouchUpInside];
}

- (void)touch {
//    NSLog(@"dd");
    BTViewController *t = [[BTViewController alloc] init];
    [self.navigationController pushViewController:t animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
