//
//  MultiThreadDownImg.m
//  jjjj
//
//  Created by 郑东喜 on 16/3/13.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "MultiThreadDownImg.h"
#import "NsthreadDownImg.h"
#define ROW_COUNT 5
#define COLUMN_COUNT 3
#define ROW_HEIGHT 100
#define ROW_WIDTH ROW_HEIGHT
#define CELL_SPACING 10


@interface MultiThreadDownImg () {
    UIImageView*_imageView;
    NSMutableArray *_imageViews;

}

@end

@implementation MultiThreadDownImg

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self layoutUI];

}

-(void)layoutUI{
    //创建多个图片控件用于显示图片
    _imageViews=[NSMutableArray array];
    for (int r=0; r<ROW_COUNT; r++) {
        for (int c=0; c<COLUMN_COUNT; c++) {
            UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(c*ROW_WIDTH+(c*CELL_SPACING), r*ROW_HEIGHT+(r*CELL_SPACING                           ), ROW_WIDTH, ROW_HEIGHT)];
            imageView.contentMode=UIViewContentModeScaleAspectFit;
            //            imageView.backgroundColor=[UIColor redColor];
            [self.view addSubview:imageView];
            [_imageViews addObject:imageView];
            
        }
    }
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(50, 50, 220, 25);
    [button setTitle:@"加载图片" forState:UIControlStateNormal];
    //添加方法
    [button addTarget:self action:@selector(loadImageWithMultiThread) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)loadImage:(NSNumber *)index {
    //    NSLog(@"%i",i);
    //currentThread方法可以取得当前操作线程
    NSLog(@"current thread:%@",[NSThread currentThread]);
    
    int i = [index integerValue];
    
    NSData *data = [self requestData:i];
    MultiThreadDownImg *imageData = [[MultiThreadDownImg alloc] init];
    imageData.index = i;
    imageData.data = data;
    [self performSelectorOnMainThread:@selector(updateImage:) withObject:imageData waitUntilDone:YES];

}

#pragma mark 更新图片
- (void)updateImage:(MultiThreadDownImg *)imageData {
    UIImage *image = [UIImage imageWithData:imageData.data];
    UIImageView *imageView = _imageViews[imageData.index];
    imageView.image = image;
}

#pragma maek 请求图片数据
- (NSData *)requestData:(int)index {
    @autoreleasepool {
        NSURL *url = [NSURL URLWithString:@"http://img1.ph.126.net/XN4wbryeSAJ_n_xVHWG1RA==/6597744866797283047.jpg"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        return data;
    }
}




#pragma mark 多线程下载图片
-(void)loadImageWithMultiThread {
    for ( int i = 0; i < ROW_COUNT * COLUMN_COUNT; i ++) {
        NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(loadImage:) object:[NSNumber numberWithInteger:i]];
        thread.name=[NSString stringWithFormat:@"myThread%i",i];//设置线程名称

        [thread start];
        
    }
}

//-(void)loadImageWithMultiThread{
//    NSMutableArray *threads=[NSMutableArray array];
//    int count=ROW_COUNT*COLUMN_COUNT;
//    //创建多个线程用于填充图片
//    for (int i=0; i<count; ++i) {
//        //        [NSThread detachNewThreadSelector:@selector(loadImage:) toTarget:self withObject:[NSNumber numberWithInt:i]];
//        NSThread *thread=[[NSThread alloc]initWithTarget:self selector:@selector(loadImage:) object:[NSNumber numberWithInt:i]];
//        thread.name=[NSString stringWithFormat:@"myThread%i",i];//设置线程名称
//        if(i==(count-1)){
//            thread.threadPriority=1.0;
//        }else{
//            thread.threadPriority=0.0;
//        }
//        [threads addObject:thread];
//    }
//    
//    for (int i=0; i<count; i++) {
//        NSThread *thread=threads[i];
//        [thread start];
//    }
//}
//
//
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
