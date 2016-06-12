//
//  ViewController.m
//  小文件下载
//
//  Created by HEYANG on 16/2/14.
//  Copyright © 2016年 HEYANG. All rights reserved.
//



#import "ViewController.h"
// 图片和小视频的URL字符串
#define imageURLString @"http://img2.duitang.com/uploads/blog/201310/18/20131018213446_smUw4.thumb.700_0.jpeg"
#define mp4URLString @"http://120.25.226.186:32812/resources/videos/minion_03.mp4"

@interface ViewController () <NSURLConnectionDataDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

/** 文件总大小 */
@property (nonatomic,assign)NSInteger fileTotalSize;
/** 文件名 */
@property (nonatomic,strong)NSString *fileName;
/** 可变NSData对象,存储的是文件数据 */
@property (nonatomic,strong)NSMutableData *fileData;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self download_1];
//    [self download_2];
    [self download_3];
}
// 3、使用NSURLConnectionDataDelegate代理方法
-(void)download_3{
    // 1、确定URL
    NSURL* url = [NSURL URLWithString:mp4URLString];
    // 2、创建请求对象
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    // 3、请求并设置代理
    [NSURLConnection connectionWithRequest:request delegate:self];
}
#pragma mark - NSConnectionDataDelegate的代理方法
// 收到响应头调用的方法
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    // 请求头可以获得的信息：1、文件总大小。2、文件名
    self.fileTotalSize = response.expectedContentLength;
    self.fileName      = response.suggestedFilename;
    // 开发小技巧：如果一时想不起来属性名，可以进入NSURLResponse头文件里找找属性
}
// 收到数据调用的方法
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    // 这是拼接数据的方法，可不是1+1数值相加，不能用+=符号的
    [self.fileData appendData:data];
    // 同时我们打印一下数据的下载进度
    NSLog(@"%.2lf",self.fileData.length * 1.0f / self.fileTotalSize);
}
// 完成下载调用的方法
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    // 完成之后 存储进沙盒
    //caches
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fullPath = [caches stringByAppendingPathComponent:self.fileName];
    
    //写数据到沙盒中
    [self.fileData writeToFile:fullPath atomically:YES];
    NSLog(@"%@",fullPath);
}
// 失败调用的代理方法
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    // 如果出错 or 进行错误处理
    NSLog(@"%@",error);
}
#pragma mark - 懒加载一些property声明的属性
-(NSMutableData *)fileData{
    if (!_fileData) {
        _fileData = [NSMutableData data];
    }
    return _fileData;
}





#pragma mark - 下载小文件的两种方法
// 1.直接用NSData的 +(id)dataWithContentsOfURL:(NSURL*)url;下载小图片文件
-(void)download_1{
    // 1、确定URL
    NSURL* url = [NSURL URLWithString:imageURLString];
    // 2、把二进制数据下载到本地
    NSData* imageData = [NSData dataWithContentsOfURL:url];
    // 3、然后将这个图片的二进制格式数据转为UIImage，然后显示出来
    UIImage* image = [UIImage imageWithData:imageData];
    self.imageView.image = image;
}
// 2.利用NSURLConnection发送一个HTTP请求去下载，异步请求，会堵塞，所以下载大文件可能会花时间比较长
-(void)download_2{
    // 1、确定URL
    NSURL* url = [NSURL URLWithString:imageURLString];
    // 2、创建请求对象
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    // 3、请求数据
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^
     (NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
         if (connectionError) {
             NSLog(@"%@",connectionError);
         }
         UIImage* image = [UIImage imageWithData:data];
         self.imageView.image = image;
         NSLog(@"%ld",data.length);
     }];
}
@end
