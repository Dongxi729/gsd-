//
//  CustomBarItem.h
//  NavigationBar
//
//  Created by 郑东喜 on 16/2/22.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    left,
    right,
    center
}ItemType;

@interface CustomBarItem : NSObject

@property (nonatomic,strong) UIBarButtonItem *fixbarItem;
@property (nonatomic,strong) UIButton *contentBarItem;
@property (nonatomic,assign) ItemType itemType;
@property (nonatomic,assign) BOOL isCustomView;
@property (nonatomic,strong) UIView *customView;

@property (nonatomic,strong) NSMutableArray *items;


/**
 *  自定义标题
 */
+ (CustomBarItem *)itemWithTitle:(NSString *)title textColor:(UIColor*)color fontSize:(CGFloat)font itemtype:(ItemType)type;


/**
 *  设置选中类型的图片
 */
+ (CustomBarItem *)itemWithImage:(NSString *)imageName size:(CGSize)size type:(ItemType)type;

/**
 *  设置左右按钮大小
 */
+ (CustomBarItem *)itemWithCustomeView:(UIView*)customView type:(ItemType)type;

/**
 *  设置选中导航条的类型
 */
- (void)setItemWithNavigationItem:(UINavigationItem*)navigationItem itemType:(ItemType)type;


/**
 *  添加单击事件
 */
- (void)addTarget:(id)target selector:(SEL)selector event:(UIControlEvents)event;

/**
 *设置item偏移量
 *@param offSet 正值向左偏，负值向右偏
 */
- (void)setOffset:(CGFloat)offSet;

@end
