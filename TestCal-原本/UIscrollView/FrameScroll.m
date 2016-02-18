//
//  FrameScroll.m
//  TestCal
//
//  Created by 郑东喜 on 16/1/21.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "FrameScroll.h"

@implementation FrameScroll

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)initWithFrame:(CGRect)frame {
    return [[FrameScroll alloc] initWithFrame:frame];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setBgColor];
    
    return self;
}

- (void)setBgColor {
    self.backgroundColor = [UIColor grayColor];
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.delegate = self;
    [self setShowsVerticalScrollIndicator:NO];
    [self setShowsHorizontalScrollIndicator:NO];
    self.contentSize = CGSizeMake(self.frame.size.width, self.frame.size.height * 1.0);
}

@end
