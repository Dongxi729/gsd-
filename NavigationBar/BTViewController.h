//
//  BTViewController.h
//  MYsearchdisplaycontroller
//
//  Created by 张欣琳 on 14-9-9.
//  Copyright (c) 2014年 张欣琳. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DataModel.h"


#define RGBACOLOR(R,G,B,A) [UIColor colorWithRed:(R)/255.0f green:(G)/255.0f blue:(B)/255.0f alpha:(A)]

#pragma mark - 设备型号识别
#define is_IOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

#pragma mark - 硬件
#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface BTViewController : UIViewController

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com
