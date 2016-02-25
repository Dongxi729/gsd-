//
//  DataModel.m
//  NavigationBar
//
//  Created by 郑东喜 on 16/2/24.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "DataModel.h"

#import "SearchBar.h"

@implementation DataModel

+ (DataModel *)shareInstance {
    static DataModel *dataSource = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dataSource = [DataModel new];
    });
    return dataSource;
}

- (void)initData {
    SearchBar *sear = [[SearchBar alloc] init];
    
    [DataModel shareInstance].searchStr = sear.text;
    
    NSLog(@"sr%@",sear.text);
}

@end
