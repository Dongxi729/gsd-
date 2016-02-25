//
//  UINavigationItem+CustomItem.h
//  NavigationBar
//
//  Created by 郑东喜 on 16/2/23.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomBarItem.h"

@interface UINavigationItem (CustomItem)

- (CustomBarItem *)setItemWithTitle:(NSString *)title textColor:(UIColor *)color fontsize:(CGFloat)font itemType:(ItemType)type;

- (CustomBarItem *)setItemWithImage:(NSString*)setImage size:(CGSize)size itemType:(ItemType)type;

- (CustomBarItem *)setItemWithCustomView:(UIView *)customView itemType:(ItemType)type;


@end
