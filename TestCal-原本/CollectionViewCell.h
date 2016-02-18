//
//  CollectionViewCell.h
//  collectionView
//
//  Created by shikee_app05 on 14-12-10.
//  Copyright (c) 2014年 shikee_app05. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell <UIGestureRecognizerDelegate>

/**
 *  正常图片
 */
@property(nonatomic ,strong)UIImageView *imgView;

/**
 *  图片标题
 */
@property(nonatomic ,strong)UILabel *text;

/**
 *  圆形图片
 */
@property (nonatomic,strong)UIImageView *roundimg;

@end
