//
//  ViewController.m
//  TestAD(demo)
//
//  Created by 郑东喜 on 16/2/17.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

//
//  ViewController.m
//  TestIos
//
//  Created by 郑东喜 on 16/2/17.
//  Copyright © 2016年 郑东喜. All rights reserved.
//  参考原项目 https://github.com/NSDengChen/DCPicScrollView

#import "ViewController.h"
#import <TestAD/TestAD.h>

@interface ViewController () {
    //创建图片数组
    NSArray* _scImg;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //设置图片
    _scImg = @[@"http://192.168.6.124/zxtxs/img/home_icon/circle3.jpg",
               @"http://imgsrc.baidu.com/forum/pic/item/88d10057f9abb24297ca6be2.jpg",
               @"http://192.168.6.124/zxtxs/img/home_icon/circle2.jpg",
               @"http://192.168.6.124/zxtxs/img/home_icon/circle3.jpg",
               @"http://imgsrc.baidu.com/forum/pic/item/88d10057f9abb24297ca6be2.jpg",
               @"http://192.168.6.124/zxtxs/img/home_icon/circle3.jpg",
               @"http://www.ynepb.gov.cn/color/contentimage/8582/104-1.jpg",
               ];
    //设置大小
    DCPicScrollView* picView = [DCPicScrollView picScrollViewWithFrame:self.view.bounds WithImageUrls:_scImg];
    [self.view addSubview:picView];
    
    //单击图片对应index
    [picView setImageViewDidTapAtIndex:^(NSInteger a) {
        NSLog(@"%ld",(long)a);
    }];
    
    //设定轮播时间(默认2秒)
    picView.AutoScrollDelay = 2.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
