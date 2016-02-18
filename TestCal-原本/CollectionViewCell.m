//
//  CollectionViewCell.m
//  collectionView
//
//  Created by shikee_app05 on 14-12-10.
//  Copyright (c) 2014年 shikee_app05. All rights reserved.
//

#import "CollectionViewCell.h"
#import "ViewController.h"

#define grayColor [UIColor grayColor]
#define x (self.frame.size.width - CGRectGetWidth(self.frame) * 0.6) * 0.5
#define y (self.frame.size.width - CGRectGetWidth(self.frame) * 0.6) * 0.5 - 5
#define imgWidth CGRectGetWidth(self.frame) * 0.6
#define imgHeidth CGRectGetWidth(self.frame) * 0.6


@implementation CollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        // Initialization code
        
        [self setBackgroundColor:[UIColor whiteColor]];
        self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, imgWidth, imgHeidth)];
        [self addSubview:self.imgView];
        
        
        NSLog(@"%f--%f",CGRectGetWidth(self.frame),CGRectGetWidth(self.frame));
        
        self.text = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) * 0.7, CGRectGetWidth(self.frame), CGRectGetWidth(self.frame) *0.3)];
        self.text.textAlignment = NSTextAlignmentCenter;
        [self.text setFont:[UIFont systemFontOfSize:12]];
        [self addSubview:self.text];
        
        //圆角图片
        
        self.roundimg = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, imgWidth, imgHeidth)];
//        self.roundimg.backgroundColor = [UIColor groupTableViewBackgroundColor];
        self.roundimg.layer.masksToBounds = YES;
        self.roundimg.layer.cornerRadius = imgWidth * 0.5;
        [self addSubview:self.roundimg];
        
    }
    return self;
}


@end
