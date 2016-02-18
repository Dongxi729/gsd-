//
//  SecCollVC.h
//  TestCal
//
//  Created by 郑东喜 on 16/1/21.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
#import "CollectionViewCell.h"

#define fDeviceWidth ([UIScreen mainScreen].bounds.size.width)
#define fDeviceHeight ([UIScreen mainScreen].bounds.size.height)
#define KCount 4

@interface SecCollVC : UIView<UICollectionViewDataSource,UICollectionViewDelegate,UINavigationControllerDelegate,UIGestureRecognizerDelegate> {
    //获取控制器导航栏
//    UINavigationController *_navC;
    //导航栏高度
//    float _navHeight;
    
    //行
    NSString *_sec;
    
    //列
    NSString *_row;
    
    NSError *_error;
    
    int _secindex;
    int _rowindex;

    
}

- (void)clickAtsec:(NSIndexPath *)sec clickAtRow:(NSIndexPath *)row;


+ (instancetype)initWithFrame:(CGRect)frame;


/**
 *  取出当前点击的第几个cell值（int 类型）
 */
@property (nonatomic,copy) void(^imageViewDidTapAtIndex)(int secIndex,int rowIndex); //index从0开始


/**
 *  网格布局初始化，强引用
 */
@property (nonatomic,strong) UICollectionView *collectionView;

/**
 *  第一行图像名称
 */
@property (nonatomic,copy) NSArray *secOneImgData;

/**
 *  第二行图像名称
 */
@property (nonatomic,copy) NSMutableArray *secTwoImgData;

@property (nonatomic,copy) NSMutableArray *nameSource;

/**
 *  跳转页面
 */
@property (nonatomic,strong) UIViewController *passVC;

@property (nonatomic,retain) CollectionViewCell *cell;

/**
 *  cell圆形图片
 */
@property (nonatomic,strong) UIImageView *cellRoundImg;

@end
