//
//  XTZoomPicture.h
//  HighSpeedLight
//
//  Created by 郑东喜 on 16/1/5.
//  Copyright © 2016年 郑东喜. All rights reserved.
//  参考项目：http://www.jianshu.com/p/a0250e768510

/**
 *  最大放大倍数
 *  @param MAX_ZOOM    图片放大的倍数
 */
#define MAX_ZOOM    2.0

/**
 *  最小放大倍数
 *  @param MIN_ZOOM    图片缩小的倍数
 */
#define MIN_ZOOM    1.0 

/**
 *  图片阴影宽度
 *  @param FLEX_SIDE    图片阴影宽度
 */
#define FLEX_SIDE   0.0

/**
 *  方法矩形边角大小      (150 即一个 150 * 150的矩形)
 *  @param SIDE_ZOOMTORECT    图片阴影宽度
 */
#define SIDE_ZOOMTORECT     150.0


#import <UIKit/UIKit.h>

@interface XTZoomPicture : UIScrollView <UIScrollViewDelegate>

@property (nonatomic,strong) UIImage *backImage ;  //图片
@property (nonatomic, strong) UIImageView *imageView ; //图片大小

/**
 *  初始化backImage
 *
 *  @param frame         视图坐标位置
 *  @param backImage     图片添加的内存地址
 *  @return backImage实例
 */

- (id)initWithFrame:(CGRect)frame
          backImage:(UIImage *)backImage;

/**
 *  创建新的视图对象frame
 *
 *  @param frame         视图坐标位置
 *  @return frame实例
 */
- (id)initWithFrame:(CGRect)frame;

/**
 *  重新设置图片大小
 */
- (void)resetToOrigin;



@end
