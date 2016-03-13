//
//  MultiThreadDownImg.h
//  jjjj
//
//  Created by 郑东喜 on 16/3/13.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultiThreadDownImg : UIViewController


#pragma mark 索引
@property (nonatomic,assign) int index;

#pragma mark 图片数据
@property (nonatomic,strong) NSData *data;

@end
