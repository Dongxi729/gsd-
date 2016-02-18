//
//  J.m
//  TestCal
//
//  Created by 郑东喜 on 16/1/21.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "J.h"
#import "CJSONDeserializer.h"


@interface J ()

@end

@implementation J

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self json];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 100 ,100)];
    [self.view addSubview:_label];
}


- (void)json {
            NSURL *url = [NSURL URLWithString:@"http://www.weather.com.cn/adat/sk/101010100.html"];
    //定义一个NSError对象，用于捕获错误信息
    NSError *error;
    NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    NSLog(@"jsonString--->%@",jsonString);
    //将解析得到的内容存放字典中，编码格式为UTF8，防止取值的时候发生乱码
    NSDictionary *rootDic = [[CJSONDeserializer deserializer] deserialize:[jsonString dataUsingEncoding:NSUTF8StringEncoding] error:&error];
    //因为返回的Json文件有两层，去第二层内容放到字典中去
    NSDictionary *weatherInfo = [rootDic objectForKey:@"weatherinfo"];
    NSLog(@"weatherInfo--->%@",weatherInfo);
    //取值打印
    self.label.text = [NSString stringWithFormat:@"今天是 %@  %@  %@  的天气状况是：%@  %@ ",[weatherInfo objectForKey:@"time"],[weatherInfo objectForKey:@"qy"],[weatherInfo objectForKey:@"city"], [weatherInfo objectForKey:@"WD"], [weatherInfo objectForKey:@"WS"]];
    
    NSLog(@"%@%@%@%@",[weatherInfo objectForKey:@"date_y"],[weatherInfo objectForKey:@"week"],[weatherInfo objectForKey:@"city"],[weatherInfo objectForKey:@"temp"]);

}

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
