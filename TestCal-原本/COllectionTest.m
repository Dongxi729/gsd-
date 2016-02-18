//
//  COllectionTest.m
//  TestCal
//
//  Created by 郑东喜 on 16/1/18.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "COllectionTest.h"
//------------------------------------------------------------------------------------------------------------------------------
#import "SecCollVC.h"
#import "ViewController.h"
#import "RootViewController.h"
#import "Three.h"

#import "FrameScroll.h"

#define W [UIScreen mainScreen].bounds.size.width
#define H [UIScreen mainScreen].bounds.size.height

@interface COllectionTest () {
    UIView *_name;
    //celltag 值
    int _cellTag;
//------------------------------------------------------------------------------------------------------------------------------
    //测试跳转页面A
    UIViewController *_vc;
    //测试跳转页面B
    UIViewController *_r;
    //测试跳转页面C
    UIViewController *_three;
//------------------------------------------------------------------------------------------------------------------------------
    int _secHangTag;
    int _secLieTag;
    
    FrameScroll *_mainScro;
}

@end

@implementation COllectionTest

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     *  添加uiscrollView （
     1.设置好滑动视图大小
     2.测试滑动视图 滑动方向，相关设置
     3.将两个uicollectionView添加到滑动视图
     ）
     */
    
    _mainScro = [[FrameScroll alloc] initWithFrame:CGRectMake(0, 100, W, H *0.7)];
    [self.view addSubview:_mainScro];
    
    
    /**
     *  添加collectionView并设置样式
     */
    [self setData];

    // Do any additional setup after loading the view.
}

- (void)setData {
//------------------------------------------------------------------------------------------------------------------------------
    /**
     *  uiviewcollectionView 第一行
     */
    CollectionVC *test = [CollectionVC initWithFrame:CGRectMake(0, 0, W, H * 0.2)];
    [_mainScro addSubview:test];
    
    test.cellVC.layer.borderWidth = 0.5;
    
    test.nameSource = [DataModel shareInstance].firstUICollecLineImgnameData;
    test.imgName = [DataModel shareInstance].firstUICollecLineImgUrlData;
    

    test.layerShowType = 0;
    
//------------------------------------------------------------------------------------------------------------------------------
    /**
     *  block取单机的cell
     */

    [test setImageViewDidTapAtIndex:^(int index) {
        _cellTag = index;
        NSLog(@"tapped:%d",index);
        
        
        
        [self jumpToPage];
    }];
    
//------------------------------------------------------------------------------------------------------------------------------
    /**
     *  测试页面
     */
//测试跳转页面A
    ViewController *vc = [[ViewController alloc] init];
    test.passVC = vc;
    _vc = vc;
//测试跳转页面B
    RootViewController *r = [[RootViewController alloc] init];
    
    _r = r;
//测试跳转页面C
    Three *three = [[Three alloc] init];
    _three = three;

    
    NSLog(@"%@",vc);
    
//------------------------------------------------------------------------------------------------------------------------------
    /**
     *  uiviewcollectionView 第二行
     */
    SecCollVC * secVC = [[SecCollVC alloc] initWithFrame:CGRectMake(0, H * 0.2 , W, 2 * (H * 0.2 + 10))];
    secVC.nameSource = [DataModel shareInstance].secUICollecLineImgnameData;

    secVC.secTwoImgData = [DataModel shareInstance].secUICollecLineImgUrlData;

    
//    UIImage * img = [UIImage imageNamed:@"1.png"];
//    
////    secVC.cellRoundImg.image = [DataModel shareInstance].secUICollecLineImgnameData;
//    
//    secVC.cellRoundImg.image = img;
//    
    
    NSLog(@"secVC.cell.roundimg%@",secVC.cellRoundImg);
        
//------------------------------------------------------------------------------------------------------------------------------
    /**
     *  block取单机的cell
     */
    [secVC setImageViewDidTapAtIndex:^(int section, int row) {
        NSLog(@"第几行:%d第几列：%d",section,row);
        [self secTwojumpToPage];
        
        _secHangTag = section;
        _secLieTag = row;
    }];
    //第二行uicollectionView
    [_mainScro addSubview:secVC];
}

//------------------------------------------------------------------------------------------------------------------------------
/**
 *  页面跳转----第一行uicllectionView测试
 */
//跳转指定页面
- (void)secTwojumpToPage {
    NSLog(@"%d",_cellTag);
    if (_secHangTag == 0 && _secLieTag == 1) {
        [self turnPage];
    }
    
    if (_secHangTag == 1 && _secLieTag == 0) {
        [self turnPageTwo];
    }
}

/**
 *  页面跳转----第二行uicllectionView测试
 */
//跳转指定页面
- (void)jumpToPage {
    NSLog(@"%d",_cellTag);
    if (_cellTag == 1 ) {
        [self turnPage];
    }
    
    if (_cellTag == 2) {
        [self turnPageTwo];
    }
    if (_cellTag == 3) {
        [self turnPageThree];
    }
}

/**
 *  跳转到的页面
 */
- (void)turnPage {

    [self.navigationController pushViewController:_vc animated:YES];
    
    NSLog(@"run");
    
}

- (void)turnPageTwo {
    [self.navigationController pushViewController:_r animated:YES];
}

- (void)turnPageThree {
    [self.navigationController pushViewController:_three animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
