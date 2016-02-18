//
//  AppDelegate.h
//  TestCal
//
//  Created by 郑东喜 on 16/1/15.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import <UIKit/UIKit.h>
#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)
#define StatusBarHeight (IOS7==YES ? 0 : 20)
#define BackHeight      (IOS7==YES ? 0 : 15)
#define fNavBarHeigth (IOS7==YES ? 44 : 44)

#define fDeviceWidth ([UIScreen mainScreen].bounds.size.width)
#define fDeviceHeight ([UIScreen mainScreen].bounds.size.height)
//#define x 0
//#define y 0

#import "DataModel.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
@private
    NSString *_deviceToken;
}

@property (strong, nonatomic) UIWindow *window;

@end

