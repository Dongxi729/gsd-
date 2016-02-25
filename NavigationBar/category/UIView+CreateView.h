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
 *  自定义uinavigationTitileView视图
 */
+ (UIView*)size:(CGRect)size addTarget:(id)target setViewAction:(SEL)action addBtnTitle:(NSString *)addbtnTitle addLabelText:(NSString *)addLabeltext iconImg:(UIImage*)iconImage btnFontSize:(CGFloat)btnfontSize labelFontSize:(CGFloat)labelfontSize selectImg:(UIImage*)seleceImage;


+ (UIView*)setSearchBarSize:(CGRect)size placeHolderText:(NSString*)placeHolderText btnAction:(SEL)action;

@end
