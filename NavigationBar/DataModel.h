//
//  DataModel.h
//  NavigationBar
//
//  Created by 郑东喜 on 16/2/24.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

+(DataModel *)shareInstance;

@property (nonatomic,strong) NSString *searchStr;

- (void)initData;

@end
