//
//  basePicScrollView.h
//  DCWebPicScrollView
//
//  Created by dengchen on 15/12/5.
//  Copyright © 2015年 name. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  获取屏幕宽度
 *  @param myWidth          屏幕宽度
 *  @param myHeight         屏幕高度
 *  @param pageSize         页码高度
 *  @param pageNum          默认设置当前第3页
 *  @param currentTintColor 页脚颜色
 */
#define myWidth     self.frame.size.width
#define myHeight    self.frame.size.height
#define pageSize (myHeight * 0.2 > 25 ? 25 : myHeight * 0.2)
#define pageNum 3
#define currentTintColor         [UIColor colorWithRed:181/255.0 green:204/255.0 blue:62/255.0 alpha:1]


@interface DCPicScrollView : UIView

//占位图片
@property (nonatomic,strong) UIImage *placeImage;

/**
 *  自动播放图片时间
 *  @param AutoScrollDelay  自动播放图片时间（父类NSTimeInterval：用于指定的时间间隔，
 *  以秒为单位，为float类型），default is 2.0f,如果小于0.5不自动播放。
 */
@property (nonatomic,assign) NSTimeInterval AutoScrollDelay;

/**
 *  图片被点击会调用该block
 *  @param index             返回单机图片为第index张，index从0开始。
 */
@property (nonatomic,copy) void(^imageViewDidTapAtIndex)(NSInteger index);


/**
 *  初始化滑动视图大小并根据网络路径下载图片
 *  @param  frame             滑动视图大小（cgrect：CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)）
 *  @param WithImageUrls      加载网络图片资源(网络加载urlsring必须为http:// 开头,根据数组中的元素（nsstring类型数据）,本地加载只需图片名字数组)
 */
+ (instancetype)picScrollViewWithFrame:(CGRect)frame WithImageUrls:(NSArray<NSString *> *)imageUrl;



@property (nonatomic,strong) UIColor *pageIndicatorTintColor;

@property (nonatomic,strong) UIColor *currentPageIndicatorTintColor;

//default is [[UIColor alloc] initWithWhite:0.5 alpha:1]
//@property (nonatomic,strong) UIColor *textColor;

//@property (nonatomic,strong) UIFont *font;

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com