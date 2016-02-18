//
//  CollectionVC.h
//  TestCal
//
//  Created by 郑东喜 on 16/1/18.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"
#import "CollectionViewCell.h"

#define fDeviceWidth ([UIScreen mainScreen].bounds.size.width)
#define fDeviceHeight ([UIScreen mainScreen].bounds.size.height)
#define KCount 4

//按钮状态

typedef enum {
    layerShow = 0,    //显示
    layerHidden = 1  //隐藏
} cellLayerShowStyle;


@interface CollectionVC : UIView<UICollectionViewDataSource,UICollectionViewDelegate,UINavigationControllerDelegate,UIGestureRecognizerDelegate> {
    //获取控制器导航栏
//    UINavigationController *_navC; 
    //导航栏高度
    float _navHeight;
    
    //行
    NSString *_sec;
    
    //列
    NSString *_row;
    
    NSError *_error;
    
    int _index;
    
}

/**
 *  uicollectionView页面初始化大小
 */
+ (instancetype)initWithFrame:(CGRect)frame;

/**
 *  网格布局初始化，强引用
 */
@property (nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,retain) CollectionViewCell * cellVC;

/**
 *  第一行图像名称
 */
@property (nonatomic,copy) NSArray *imgName ;

@property (nonatomic,strong) UIImage *img;

/**
 *  按钮状态
 *  @param layerShow 0显示按钮
 *  @param layerHidden 1隐藏按钮
 */
@property (nonatomic, assign,readwrite) cellLayerShowStyle layerShowType;

/**
 *  取出当前点击的第几个cell值（int 类型）
 */
@property (nonatomic,copy) void(^imageViewDidTapAtIndex)(int index); //index从0开始

@property (nonatomic,copy) NSMutableArray *nameSource;

/**
 *  跳转页面
 */
@property (nonatomic,strong) UIViewController *passVC;

@end
