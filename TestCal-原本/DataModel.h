//
//  DataModel.h
//  TestCal
//
//  Created by 郑东喜 on 16/1/18.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject {
}

+ (DataModel *)shareInstance;

- (void)initData;
/**
 *  第一行图像
 */
@property (nonatomic,copy) NSMutableArray *firstUICollecLineImgUrlData;
@property (nonatomic,copy) NSMutableArray *secUICollecLineImgUrlData;

/**
 *  第二行图像
 */
@property (nonatomic,copy) NSMutableArray *secTwoImg;

/**
 *  图像名称
 */
@property (nonatomic,copy) NSMutableArray *firstUICollecLineImgnameData;

@property (nonatomic,copy) NSMutableArray *secUICollecLineImgnameData;


@end
