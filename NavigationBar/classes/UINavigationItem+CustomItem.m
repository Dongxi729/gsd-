//
//  UINavigationItem+CustomItem.m
//  NavigationBar
//
//  Created by 郑东喜 on 16/2/23.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "UINavigationItem+CustomItem.h"

@implementation UINavigationItem (CustomItem)

-(CustomBarItem *)setItemWithTitle:(NSString *)title textColor:(UIColor *)color fontsize:(CGFloat)font itemType:(ItemType)type {
    CustomBarItem *item = [CustomBarItem itemWithTitle:title textColor:color fontSize:font itemtype:type];
    [item setItemWithNavigationItem:self itemType:type];
    return item;
}

- (CustomBarItem *)setItemWithImage:(NSString *)setImage size:(CGSize)size itemType:(ItemType)type {
    CustomBarItem *item = [CustomBarItem itemWithImage:setImage size:size type:type];
    [item setItemWithNavigationItem:self itemType:type];
    return item;
}

- (CustomBarItem *)setItemWithCustomView:(UIView *)customView itemType:(ItemType)type {
    CustomBarItem *item = [CustomBarItem itemWithCustomeView:customView type:type];
    [item setItemWithNavigationItem:self itemType:type];
    return item;
}

@end
