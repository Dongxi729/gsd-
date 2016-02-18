//
//  SecCollVC.m
//  TestCal
//
//  Created by 郑东喜 on 16/1/21.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "SecCollVC.h"

@interface SecCollVC ()

@end
static NSString *identify = @"cell";


@implementation SecCollVC

+ (instancetype)initWithFrame:(CGRect)frame {
    return [[SecCollVC alloc] initWithFrame:frame];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    //绘制collectionView
    [self prepareCollectionView];
    
//    //获取控制器导航栏
//    [self getNacControl];
    
//    //导航栏高度
//    [self getNavHeight];
    
    return self;
}

////导航栏高度
//- (void)getNavHeight {
//    
//    // 导航栏（navigationbar）
//    CGRect rectNav = _navC.navigationBar.frame;
//    float navHeight = rectNav.size.height;
//    _navHeight = navHeight;
//    
//    NSLog(@"%f",_navHeight);
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
    
    //    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 220 , self.frame.size.width,(fDeviceWidth)/KCount * 2 + 10)
    //                                            collectionViewLayout:flowLayout];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
    self.collectionView.alwaysBounceVertical = NO;
    [self.collectionView setBackgroundColor:[UIColor redColor]];
    
    //设置代理
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    //collectionView置于最顶层
    [self insertSubview:self.collectionView atIndex:0];
    
    //collectionView背景颜色设置
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    //注册cell和ReusableView（相当于头部）
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                   withReuseIdentifier:@"ReusableView"];
    self.collectionView.showsVerticalScrollIndicator = NO;
    
//    self.collectionView.userInteractionEnabled = NO;

    
}

#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    if (section == 0 ) {
//        return KCount;
//    }else return KCount;
//    return KCount;
    if (section == 0) {
        return KCount;
    } else
    return _nameSource.count / KCount < KCount ? _nameSource.count : KCount;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    return _nameSource.count;
    return _nameSource.count;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForRowAtIndex:(NSInteger)section {
    return 10;
}


//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    //    static NSString *identify = @"cell";
    _cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    //    [cell sizeToFit];
    if (!_cell) {
        NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
    }
    
    /**
     *  图像标题
     */
    _cell.text.text = _nameSource[indexPath.section][indexPath.row];
    
    NSLog(@"%@===",_secOneImgData[indexPath.row]);
    
        NSError *error = nil;

        _cell.roundimg.image = [UIImage imageWithData:[NSData dataWithContentsOfFile:_secTwoImgData[indexPath.section]  options:NSDataReadingUncached error:&error]];
    
    NSLog(@" _cell.roundimg%@", _cellRoundImg);
    
    _cell.layer.borderWidth = 0;
    
    return _cell;
}

- (void)clickAtsec:(NSIndexPath *)sec clickAtRow:(NSIndexPath *)row {
    
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((fDeviceWidth)/KCount, (fDeviceWidth)/KCount);
}
//定义每个UICollectionView 的间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
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

    NSLog(@"%ld-%ld",(long)indexPath.section,(long)indexPath.row);
    
    int hang = indexPath.section;
    int lie = indexPath.row;
    
    _secindex = hang;
    _rowindex = lie;
    
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
    [self imageViewDidTap];
}

- (void)imageViewDidTap {
    if (self.imageViewDidTapAtIndex != nil) {
        self.imageViewDidTapAtIndex (_secindex,_rowindex);
    }
    
    //    NSLog(@"~~%d",_index);
}



//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}


@end
