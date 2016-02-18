//
//  CollectionVC.m
//  TestCal
//
//  Created by 郑东喜 on 16/1/18.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "CollectionVC.h"
#import "ViewController.h"

@interface CollectionVC ()

@end
static NSString *identify = @"cell";


@implementation CollectionVC

+ (instancetype)initWithFrame:(CGRect)frame {
    return [[CollectionVC alloc] initWithFrame:frame];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    //绘制collectionView
    [self prepareCollectionView];
    
    //获取控制器导航栏
//    [self getNacControl];
    
    //导航栏高度
//    [self getNavHeight];
    
    return self;
}
//
////导航栏高度
//- (void)getNavHeight {
//
//    // 导航栏（navigationbar）
//    CGRect rectNav = _navC.navigationBar.frame;
//    float navHeight = rectNav.size.height;
//    _navHeight = navHeight;
//    
////    NSLog(@"%f",_navHeight);
//
//}

////获取导航栏
//- (void)getNacControl {
//    UIViewController *zdx = [UIApplication sharedApplication].keyWindow.rootViewController;
//    UINavigationController *z =  (UINavigationController *)zdx;
//    _navC = z;
//    
//}


- (void)prepareCollectionView {
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    flowLayout.headerReferenceSize = CGSizeMake(fDeviceWidth, 0);
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    self.collectionView.alwaysBounceVertical = NO;
    [self.collectionView setBackgroundColor:[UIColor redColor]];
    
    //设置代理
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    //collectionView置于最顶层
    [self insertSubview:self.collectionView atIndex:0];
    
    //collectionView背景颜色设置
    self.collectionView.backgroundColor = [UIColor lightGrayColor];
    
    //注册cell和ReusableView（相当于头部）
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:@"ReusableView"];
    self.collectionView.showsVerticalScrollIndicator = NO;
    
}

#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return KCount;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    _cellVC = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    if (!_cellVC) {
        NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
    }

    /**
     *  图像标题
     */
    _cellVC.text.text = _nameSource[indexPath.row];
    
    //设置layer是否显示
    _cellVC.layer.borderColor = [UIColor lightGrayColor].CGColor;
    if (_layerShowType == 0 ) {
        _cellVC.layer.borderWidth = 0.5;
    } else     _cellVC.layer.borderWidth = 0;


    
        NSError *error = nil;

    _cellVC.imgView.image = [UIImage imageNamed:@"1.png"];
//    cell.imgView.image = _img;
    
        if (error) {
            NSLog(@"%@", [error localizedDescription]);
        } else {
            NSLog(@"Data has loaded successfully.");
        }        //here is another array of objects showing in table view

    return _cellVC;
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((fDeviceWidth)/KCount, (fDeviceWidth)/KCount);
}
//定义每个UICollectionView 的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//定义每个UICollectionView 纵向的间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

#pragma mark --UICollectionViewDelegate
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.collectionView.userInteractionEnabled = YES;

//     NSLog(@"%ld-%ld",(long)indexPath.section,(long)indexPath.row);
    
    int hang = indexPath.section;
    int lie = indexPath.row;
    
    _index = lie;
    
    _sec = [[NSString alloc] initWithFormat:@"%d",hang];
    _row = [[NSString alloc] initWithFormat:@"%d",lie];
    
    NSString *msg = [[NSString alloc] initWithFormat:@"%@-%@",_sec,_row];
//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"敬请期待~" message:msg delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    
    [alertView show];
    
    
//    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"敬请期待~"
//                                                                   message:msg
//                                                            preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
//                                                          handler:^(UIAlertAction * action) {}];
//    
//    [alert addAction:defaultAction];
    
//    NSLog(@"~~~%d",_index);
//    [_navC presentViewController:alert animated:YES completion:nil];
//    if (indexPath.section == 0) {
//        [_navC pushViewController:_passVC animated:YES];
//        NSLog(@"%@",_navC);
        
       
//    } else {};
//
    [self imageViewDidTap];

}

/**
 *  获取单机的cell（通过block）
 */
- (void)imageViewDidTap {
    if (self.imageViewDidTapAtIndex != nil) {
        self.imageViewDidTapAtIndex (_index);
    }
    
    
//    NSLog(@"~~%d",_index);
}

//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


@end
