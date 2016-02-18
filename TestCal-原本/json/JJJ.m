
//
//  JSon.m
//  TestCal
//
//  Created by 郑东喜 on 16/1/22.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "JJJ.h"

@interface JJJ ()

@end

@implementation JJJ

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self json];
    [self jsonTwo];
}

/**
 *  解析本地文件
 */
- (void)json {
    //初始化文件路径。
    NSString* path  = [[NSBundle mainBundle] pathForResource:@"B" ofType:@"txt"];
    //将文件内容读取到字符串中，注意编码NSUTF8StringEncoding 防止乱码，
    NSString* jsonString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    //将字符串写到缓冲区。
    NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    //解析json数据，使用系统方法 JSONObjectWithData:  options: error:
//-------------------------------------
    //解析一大组数据
    NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
    //接下来一步一步解析。知道得到你想要的东西。
//-------------------------------------

    NSDictionary* arrayResult =[dic objectForKey:@"data"];
    
    NSString *tr = [NSString stringWithFormat:@"%@-%@",[arrayResult objectForKey:@"key"],[dic objectForKey:@"msg"]];
    
    
    UILabel *upLabTxt = [[UILabel alloc] initWithFrame:CGRectMake(80, 30,self.view.frame.size.width - 50, 20)];
    upLabTxt.numberOfLines = 0;
    upLabTxt.text = tr;
    [self.view addSubview:upLabTxt];
    
    NSLog(@"arrayResult--->%@",arrayResult);
    NSLog(@"%@",dic);
}

//[
// {
//     "key": "/test2",
//     "files":
//     [
//      "/test_111.apk",
//      "/test_112.apk"
//      ],
//     "headurl": "http://192.168.6.111/zxtxs"
// }
// ]
//
//

- (void)jsonTwo {
    
    /**
     *  1.初始化路径
        2.将文件内容读取到字符串中，注意编码NSUTF8StringEncoding防止乱码
        3.将字符串写到缓存区
        4.解析json数据，使用系统方法JSONObjectWithData:    options:error
     */
    NSString *path = [[NSBundle mainBundle] pathForResource:@"c" ofType:@"txt"];
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSArray *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
    
    //解析数据中第一组数组
    NSDictionary* resultDic = [dic objectAtIndex:0];

    NSLog(@"--->%@",resultDic);
    
//    NSDictionary *arrayResult = [dic objectForKey:@"key"];
    
//    NSLog(@"0-%@",arrayResult);
    
    NSString *str = [NSString stringWithFormat:@"\n %@\n%@ %@",[resultDic objectForKey:@"key"],[resultDic objectForKey:@"headurl"],[resultDic objectForKey:@"files"]];

//    
    UITextView *upLabTxt = [[UITextView alloc] initWithFrame:CGRectMake(0, 50,self.view.frame.size.width, 200)];
//    upLabTxt.numberOfLines = 3;
    upLabTxt.text = str;
    [self.view addSubview:upLabTxt];
    
    NSLog(@"XXX--->%@",str);
}

@end
