//
//  ViewController.m
//  TestNaviHeight
//
//  Created by 郑东喜 on 16/2/26.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationBar+CustomHeight.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.navigationController.navigationBar setBarTintColor:[UIColor blueColor]];
    [self.navigationController.navigationBar setHeight:50];
    
    self.navigationItem.title = @"不要偏移啊";
    UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                      style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backBarButton;
    
    UIBarButtonItem *go = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                                     style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    self.navigationItem.rightBarButtonItem = go;

}

- (void)backAction {
    
}


//- (void)viewWillDisappear:(BOOL)animated {
//    
//    [super viewWillDisappear:animated ] ;
//    
//    CGRect rect = self . navigationController . navigationBar . frame ;
//    
//    self.navigationController . navigationBar . frame = CGRectMake ( rect . origin . x ,rect . origin . y , rect . size . width , 44 ) ;
//}

-(void)viewWillAppear:(BOOL)animated {
    
    CGRect rect = self . navigationController . navigationBar . frame ;
    
//    self . navigationController . navigationBar . frame = CGRectMake ( rect . origin . x , rect . origin . y , rect . size . width , 84 ) ;
    [self.navigationController.navigationBar setTitleVerticalPositionAdjustment:-5.0 forBarMetrics:UIBarMetricsDefault];
//    [self.navigationItem.leftBarButtonItem setBackgroundVerticalPositionAdjustment:-20.0 forBarMetrics:UIBarMetricsDefault];
    [self.navigationItem.leftBarButtonItem setBackButtonBackgroundVerticalPositionAdjustment:-10 forBarMetrics:UIBarMetricsDefault];
//
//     [self.navigationItem.rightBarButtonItem setBackgroundVerticalPositionAdjustment:-10.0 forBarMetrics:UIBarMetricsDefault];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
