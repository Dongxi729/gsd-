//
//  CollectionView.m
//  TestCal
//
//  Created by 郑东喜 on 16/1/15.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "CollectionView.h"
#import "CollectionViewCell.h"
#define kDeviceHeight  100
#define kDeviceWidth    100
#define kTabBarHeight   100

#define kNavHeight 44
@interface CollectionView ()

@end

@implementation CollectionView

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad
{
    //初始化
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, kNavHeight, kDeviceWidth,kDeviceHeight-kNavHeight*2-kTabBarHeight-20)collectionViewLayout:flowLayout];
    //注册
    [self.collectionView registerClass:[CollectionViewCell class]forCellWithReuseIdentifier:@"cell"];
    //设置代理
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];

}

#pragma mark - collectionView delegate
//设置分区
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView
{
    return 1;
}

//每个分区上的元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 24;
}

//设置元素内容
- (UICollectionViewCell *)collectionView:(UICollectionView*)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        
    }
//    VideoModel *model = [self.videoModels objectAtIndex:indexPath.row];
//    NSURL *url = [NSURL URLWithString:model.videoImgURL];
    
//    [cell.imgView setImageWithURL:url];
//    cell.titleLbale.text = model.videoTitle;
    return cell;
}

//设置元素的的大小框
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets top = {5,10,15,5};
    return top;
}

//设置顶部的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGSize size={0,0};
    return size;
}
//设置元素大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(240,(kDeviceHeight-kNavHeight*2-kTabBarHeight-20)/4.0);
}

//点击元素触发事件
//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSLog(@"%@",indexPath);
//    DetailVideoViewController *detailVC = [[DetailVideoViewControlleralloc]init];
//    [self.navigationController pushViewController:detailVCanimated:YES];
//}
@end
