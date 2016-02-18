//
//  BtnMake.m
//  TestCal
//
//  Created by 郑东喜 on 16/1/15.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "BtnMake.h"

#define KSTextScale 0.3
#define KSImageSacle 0.6

#define imageX W * 0.1
#define imageY H * 0.1



@implementation BtnMake

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.layer.borderWidth = 2;
        self.imageView.layer.borderWidth = 1;
        self.imageView.layer.borderColor = [UIColor blueColor].CGColor;
        self.titleLabel.layer.borderColor = [UIColor blueColor].CGColor;
        self.titleLabel.layer.borderWidth = 1;
        
//        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat W = contentRect.size.width;
    CGFloat H = contentRect.size.height *KSTextScale;
    CGFloat y = contentRect.size.height - H;
    return CGRectMake(0, y, W, H);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat W = contentRect.size.width * KSImageSacle;
    CGFloat H = contentRect.size.height * KSImageSacle ;
    return CGRectMake(imageX, imageY, W, H);
}



@end
