//
//  DataModel.m
//  TestCal
//
//  Created by 郑东喜 on 16/1/18.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "DataModel.h"
#import <UIKit/UIKit.h>

@implementation DataModel

+ (DataModel *)shareInstance {
    static DataModel *dataSource = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        dataSource = [DataModel new];
    });
    return dataSource;
}

- (void)initData {

    [DataModel shareInstance].firstUICollecLineImgUrlData = [[NSMutableArray alloc] initWithObjects:
                                           [NSURL URLWithString:@"http://www.pocc.cc/news/2013/08/137783100215.jpg"],
                                           [NSURL URLWithString:@"http://www.pocc.cc/news/2013/08/137783100215.jpg"],
                                           [NSURL URLWithString:@"http://www.pocc.cc/news/2013/08/137783100215.jpg"],
                                           [NSURL URLWithString:@"http://www.pocc.cc/news/2013/08/137783100215.jpg"],
                                           [NSURL URLWithString:@"http://www.pocc.cc/news/2013/08/137783100215.jpg"],
                                            nil];
    //图片
//    [DataModel shareInstance].secUICollecLineImgUrlData = [[NSMutableArray alloc] initWithObjects:
//                                           [NSURL URLWithString:@"http://www.pocc.cc/news/2013/08/137783100215.jpg"],
//                                           [NSURL URLWithString:@"http://www.pocc.cc/news/2013/08/137783100215.jpg"],
//                                           [NSURL URLWithString:@"http://www.pocc.cc/news/2013/08/137783100215.jpg"],
//                                           [NSURL URLWithString:@"http://www.pocc.cc/news/2013/08/137783100215.jpg"],
//                                           nil];
    
    
    [DataModel shareInstance].secUICollecLineImgUrlData = [[NSMutableArray alloc] initWithObjects:
                                                           [UIImage imageNamed:@"1.png"],[UIImage imageNamed:@"1.png"],[UIImage imageNamed:@"1.png"],[UIImage imageNamed:@"1.png"]
                                                           ,nil];
    
    
   
    [DataModel shareInstance].secUICollecLineImgnameData = [NSMutableArray arrayWithArray:
                                                            @[
                                                              @[@"当前账号",@"缤纷商城",@"修改密码",@"开锁密码"],
                                                              @[@"联系我们",@"关于我们"],
//                                                              @[@"联系我们",@"关于我们",@"我的设备"],
//                                                              @[@"联系我们",@"关于我们",@"我的设备"],
//                                                              @[@"联系我们",@"关于我们",@"我的设备"],
                                                              
                                                              ]];
    [DataModel shareInstance].firstUICollecLineImgnameData = [NSMutableArray arrayWithArray:
                                                            @[@"姓名",@"昵称", @"性别", @"体重",@"eee"]];
    
}

@end
