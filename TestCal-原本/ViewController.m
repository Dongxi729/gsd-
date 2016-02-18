//
//  ViewController.m
//  代码创建UICollectionView
//
//  Created by 陈家庆 on 15-2-6.
//  Copyright (c) 2015年 shikee_Chan. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"

@interface ViewController ()  {
    NSArray *_funcCategoryData;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    _funcCategoryData = @[
                          @[@"当前账号",@"缤纷商城",@"修改密码",@"开锁密码"],
                          @[@"联系我们",@"关于我们",@"我的设备"],
                          @[@"联系我们",@"关于我们",@"我的设备"],
                          @[@"联系我们",@"关于我们",@"我的设备"],
                          @[@"联系我们",@"关于我们",@"我的设备"],

                          ];

    self.title = @"Hello";
    
//    头部位置设置
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    flowLayout.headerReferenceSize = CGSizeMake(fDeviceWidth, 0);
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];

//    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300) collectionViewLayout:flowLayout];
    self.collectionView.alwaysBounceVertical = YES;
    
    //设置代理
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;


    [self.view insertSubview:self.collectionView atIndex:0];
    
        self.collectionView.backgroundColor = [UIColor grayColor];
    
    //注册cell和ReusableView（相当于头部）
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableView"];
    self.collectionView.showsVerticalScrollIndicator = NO;
}


#pragma mark -- UICollectionViewDataSource
//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0 ) {
        return 4;
    }else return 2;
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _funcCategoryData.count;
}

#warning mark 设置显示内容
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
//    [cell sizeToFit];
    if (!cell) {
        NSLog(@"无法创建CollectionViewCell时打印，自定义的cell就不可能进来了。");
    }
    cell.text.text = _funcCategoryData[indexPath.section][indexPath.row];
    cell.backgroundColor = [UIColor whiteColor];
    
    if (indexPath.section == 0) {
        cell.imgView.image = [UIImage imageNamed:@"1.png"];

    }
    if (indexPath.section == 1) {
        cell.roundimg.image = [UIImage imageNamed:@"1.png"];
        cell.layer.borderWidth = 0;
    }
    
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        return CGSizeMake((fDeviceWidth)/4 -1, (fDeviceWidth)/4);
    } else return CGSizeMake((fDeviceWidth)/4, (fDeviceWidth)/4);

}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return 0;
    } else return 10;
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
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选择%ld",(long)indexPath.row);
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
