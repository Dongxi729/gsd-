//
//  SetNaviItemBar.h
//  TestCategory
//
//  Created by 郑东喜 on 16/2/29.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DockMiddleIcon.h"


/**
 *  添加类型
 *  @param  left 导航栏按钮为左边
 *  @param  righ 导航栏按钮为右边
 */
typedef enum{
    left,
    right,
}ItemType;


@interface SetNaviItemBar : UIView
/**
 *  初始化导航栏（自定义uiview背景颜色及大小）
 */
+(instancetype)initWithFrame:(CGRect)size bgColor:(UIColor *)color;

/**
 *  设置左边导航栏的属性
 *  @param              setNavItemWithImg 设置对应导航栏按钮的图片名称
 *  @param              navBgColor        设置导航栏背景颜色
 *  @param              btnAction         设置导航栏按钮单击事件
 *  @param              itemtype          设置导航栏类型（左边还是右边）
 */
- (void)setNavItemWithImg:(NSString *)image addTarget:(id)target btnAction:(SEL)action itemType:(ItemType)type;
/**
 *  设置导航栏标题
 */
- (void)setNavigationTitile:(NSString *)title;

/**
 *  自定义uinavigationTitileView视图导航定位
 *  @param setCityNameBtnTarget         第一行城市名称按钮单击对象
 *  @param setCItyNameBtnAction         第一行城市按钮单击事件
 *  @param setCityNameBtnTitle          第一行城市按钮标题
 *  @param selectImg                    第一行图标
 *  @param setCityNameLocationLabelText 第二行定位信息地址标题
 *  @param setLocationImg               第一行图标
 */
- (void)setCityNameBtnTarget:(id)target setCItyNameBtnAction:(SEL)action setCityNameBtnTitle:(NSString *)addbtnTitle selectImg:(NSString*)seleceImage setCityNameLocationLabelText:(NSString *)addLabeltext setLocationImg:(NSString*)iconImage;

- (void)setSearchBarWithTitle:(NSString *)placeHolderText;


//左边按钮
@property (nonatomic,strong) DockMiddleIcon *leftNavButton;
//右边按钮
@property (nonatomic,strong) DockMiddleIcon *rightNavButton;

//titileView 导航栏中间的标题视图
@property (nonatomic,strong) UIView *naviLocationView;

@property (nonatomic,strong)UIView *searchView;


@end
