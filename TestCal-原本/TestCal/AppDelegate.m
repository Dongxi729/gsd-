//
//  AppDelegate.m
//  TestCal
//
//  Created by 郑东喜 on 16/1/15.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "CollectionView.h"
#import "TestViewController.h"
#import "CollectionVC.h"
//------------------------------------------------------------------------------------------------------------------------------
//json
#import "Json.h"
#import "J.h"
#import "JJJ.h"
//block
//------------------------------------------------------------------------------------------------------------------------------
#import "SecViewController.h"
#import "RootViewController.h"
//collectionVC
#import "COllectionTest.h"


@interface AppDelegate ()

@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //数据初始化
    [self initData];
    
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
//    
//     self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:[[COllectionTest alloc]init]];
//    

//------------------------------------------------------------------------------------------------------------------------------
//     *  导航栏设置
         COllectionTest * collVC = [[COllectionTest alloc] init];
         UINavigationController *rightnc = [[UINavigationController alloc] initWithRootViewController:collVC];
     
         //设置导航栏字体颜色
         [rightnc.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blueColor]}];
         self.window.rootViewController = rightnc;
     
         //去掉navigationBar背景小黑线
         [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
         [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];

    //打印导航栏高度
//------------------------------------------------------------------------------------------------------------------------------
//    // 状态栏(statusbar)
//    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
//    NSLog(@"status width - %f", rectStatus.size.width); // 宽度
//    NSLog(@"status height - %f", rectStatus.size.height);   // 高度
//    
//    // 导航栏（navigationbar）
//    CGRect rectNav = rightnc.navigationBar.frame;
//    NSLog(@"nav width - %f", rectNav.size.width); // 宽度
//    NSLog(@"nav height - %f", rectNav.size.height);   // 高度

//------------------------------------------------- -----------------------------------------------------------------------------
    //没有导航栏
//    self.window.rootViewController = [[Json alloc] init];
//------------------------------------------------------------------------------------------------------------------------------
//    self.window.rootViewController = [[Json alloc] init];
//------------------------------------------------------------------------------------------------------------------------------
//    self.window.rootViewController = [[RootViewController alloc] init];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];

//------------------------------------------------------------------------------------------------------------------------------
    
    
    return YES;
}



//数据初始化
- (void)initData {
    [[DataModel shareInstance] initData];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
