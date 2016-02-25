//
//  UIBarButtonItem+Category.m
//  SinaWeibo
//
//  Created by android_ls on 15/5/19.
//  Copyright (c) 2015年 android_ls. All rights reserved.
//

#import "UIBarButtonItem+Category.h"

@implementation UIBarButtonItem (Category)

#pragma mark 设置左侧文字和图片组成的按钮的外观样式
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage title:(NSString *)title
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    
    [btn.titleLabel setFont:[UIFont systemFontOfSize:15]];
    [btn setTitle:title?title:@"返回" forState:UIControlStateNormal];
    [btn setTitle:title?title:@"返回" forState:UIControlStateHighlighted];
    [btn setTitleColor:kColor(64, 64, 64) forState:UIControlStateNormal];
    [btn setTitleColor:kColor(253, 109, 10) forState:UIControlStateHighlighted];
    
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    
    // 设置尺寸
    btn.size = CGSizeMake(60, 44);
    
    // 调整UIBarButtonItem左侧的外边距
    CGFloat left = -8;
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, left, 0, 0);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, left, 0, 0);
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

#pragma mark 设置左侧按钮的外观样式（只有图片）
+ (UIBarButtonItem *)leftBarButtonItemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    
    // 设置尺寸
    btn.size = CGSizeMake(60, 44);
    
    // 调整UIBarButtonItem右侧的外边距
    CGFloat left = -8;
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, left, 0, 0);
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

#pragma mark 设置右侧按钮的外观样式（只有图片）
+ (UIBarButtonItem *)rightBarButtonItemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    
    // 设置尺寸
    btn.size = CGSizeMake(60, 44);
    
    // 调整UIBarButtonItem右侧的外边距
    CGFloat right = -8;
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, right);
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
