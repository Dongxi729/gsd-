//
//  UIView+CreateView.h
//  NavigationBar
//
//  Created by 郑东喜 on 16/2/23.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "NavigationTitleView.h"

@class NavigationTitleView;
@interface UIView (CreateView) <UIGestureRecognizerDelegate>

/**
 *  自定义uinavigationTitileView视图导航定位
 *  @param setCityNameBtnTarget         第一行城市名称按钮单击对象
 *  @param setCItyNameBtnAction         第一行城市按钮单击事件
 *  @param setCityNameBtnTitle          第一行城市按钮标题
 *  @param selectImg                    第一行图标
 *  @param setCityNameLocationLabelText 第二行定位信息地址标题
 *  @param setLocationImg               第一行图标
 */
+ (UIView*)setCityNameBtnTarget:(id)target setCItyNameBtnAction:(SEL)action setCityNameBtnTitle:(NSString *)addbtnTitle selectImg:(NSString*)seleceImage setCityNameLocationLabelText:(NSString *)addLabeltext setLocationImg:(NSString*)iconImage;



//+ (UIView*)setSearchBarSize:(CGRect)size placeHolderText:(NSString*)placeHolderText btnAction:(SEL)action;

@end
