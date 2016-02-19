//
//  Dock.h
//  TabBarView
//
//  Created by 郑东喜 on 16/2/19.
//  Copyright © 2016年 郑东喜. All rights reserved.
//  主控制器选项卡

#import <UIKit/UIKit.h>

@interface Dock : UIView

/**
 *  添加一个选项卡（图标／文字标题)以及文字颜色
 *  @param  addDockItemWithIcon  图片名称（分选中为选中两种名称，直接写图片名称，如图片a.png和a_selected.png直接写a就好，默认已添加后缀"_selected"）
 *  @param  title 图标名称
 *  @param  textColor (文字颜色从图片取)
 */
- (void)addDockItemWithIcon:(NSString *)icon title:(NSString *)title textColor:(NSString*)txtColorWithImg;

@property (nonatomic,assign) NSUInteger kcount;

//传索引
@property (nonatomic,copy) void(^itemClickBlock)(int index);

//通过代码指定跳转第N个图标
@property (nonatomic,assign) int selectedIndex;

@end
