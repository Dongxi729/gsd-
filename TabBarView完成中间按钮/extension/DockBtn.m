//
//  DockBtn.m
//  TabBarView
//
//  Created by 郑东喜 on 16/2/19.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#define KimageRatio 0.6

#import "DockBtn.h"

@implementation DockBtn

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //设置文字属性
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:11];
    
    //设置图片属性
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.adjustsImageWhenHighlighted = NO;
    
    //设置选中时的背景
    [self setBackgroundImage:[UIImage imageNamed:@"tarbarbgcolor"] forState:UIControlStateSelected];
}

#pragma mark 重写HeightLighted方法(覆盖父类在高亮时所作的行为)
-(void)setHighlighted:(BOOL)highlighted {
    
}

#pragma mark 文字
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat titleY = contentRect.size.height * KimageRatio;
    CGFloat titleHeight = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, contentRect.size.width, titleHeight);
}

#pragma mark 图片边框
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, 2, contentRect.size.width, KimageRatio * contentRect.size.height);
}

@end
