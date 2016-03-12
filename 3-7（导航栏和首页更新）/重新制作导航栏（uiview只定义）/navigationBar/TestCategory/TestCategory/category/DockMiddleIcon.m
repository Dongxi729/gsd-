//
//  DockMiddleIcon.m
//  TabBarView
//
//  Created by 郑东喜 on 16/2/25.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "DockMiddleIcon.h"

@implementation DockMiddleIcon


- (void)drawRect:(CGRect)rect {
    
    //设置图片属性
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    self.adjustsImageWhenHighlighted = NO;
//    self.layer.borderWidth = 0.5;
    
//    self.imageView.layer.borderWidth = 0.5;
    //设置选中时的背景
//    [self setBackgroundImage:[UIImage imageNamed:@"tarbarbgcolor"] forState:UIControlStateSelected];
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, 0, 0, 0);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    return CGRectMake(5, 5, contentRect.size.width - 10, contentRect.size.height -10);
}

@end
