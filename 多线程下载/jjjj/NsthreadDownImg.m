//
//  ViewController.m
//  jjjj
//
//  Created by 郑东喜 on 16/3/12.
//  Copyright © 2016年 郑东喜. All rights reserved.
//  http://blog.csdn.net/shenjie12345678/article/details/44152605
// 多线程并发

#import "NsthreadDownImg.h"

@interface NsthreadDownImg () {
    UIImageView *_imageView;
}

@end

@implementation NsthreadDownImg

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self layoutUI];
}

#pragma mark 界面布局
- (void)layoutUI {
    _imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:_imageView];
    
//    UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 500, 220, 25)];
//    [self.view addSubview:btn];
//    
//    [btn setTitle:@"加载图片" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(50, 50, 220, 25);
    [button setTitle:@"加载图片" forState:UIControlStateNormal];
    //添加方法
    [button addTarget:self action:@selector(loadImageWithThread) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    
    //添加方法
//    [btn addTarget:self action:@selector(loadImageWithThread) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
}


- (NSData *)requestData {
    @autoreleasepool {
        NSURL *url = [NSURL URLWithString:@"http://img1.ph.126.net/XN4wbryeSAJ_n_xVHWG1RA==/6597744866797283047.jpg"];
        
        NSData *data = [NSData dataWithContentsOfURL:url];
        return data;
    }
}

#pragma mark 加载图片
- (void)loadImage {
    NSData *data = [self requestData];
    
    [self performSelectorOnMainThread:@selector(updateImage:) withObject:data waitUntilDone:YES];
}

#pragma mark 将下载好的图片显示到界面
- (void)updateImage:(NSData*)imageData {
    UIImage *img = [UIImage imageWithData:imageData];
    _imageView.image = img;
}

#pragma mark 多线程下载图片
- (void)loadImageWithThread {
    [NSThread detachNewThreadSelector:@selector(loadImage) toTarget:self withObject:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
