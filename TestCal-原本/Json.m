//
//  Json.m
//  TestCal
//
//  Created by 郑东喜 on 16/1/21.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "Json.h"
#import "CJSONDeserializer.h"

@implementation Json

- (void)localText{
//    
//    {
//        "results" : [
//        {
//            "address_components" : [
//            {
//                "long_name" : "南京市",
//                "short_name" : "南京市",
//                "types" : [ "locality", "political" ]
//            },
//            {
//                "long_name" : "江苏省",
//                "short_name" : "江苏省",
//                "types" : [ "administrative_area_level_1", "political" ]
//            },
//            {
//                "long_name" : "中国",
//                "short_name" : "CN",
//                "types" : [ "country", "political" ]
//            }
//                                    ],
//            "formatted_address" : "中国江苏省南京市",
//            "geometry" : {
//                "bounds" : {
//                    "northeast" : {
//                        "lat" : 32.6143633,
//                        "lng" : 119.2360223
//                    },
//                    "southwest" : {
//                        "lat" : 31.2280977,
//                        "lng" : 118.3633731
//                    }
//                },
//                "location" : {
//                    "lat" : 32.060255,
//                    "lng" : 118.796877
//                },
//                "location_type" : "APPROXIMATE",
//                "viewport" : {
//                    "northeast" : {
//                        "lat" : 32.3940135,
//                        "lng" : 119.050169
//                    },
//                    "southwest" : {
//                        "lat" : 31.8045247,
//                        "lng" : 118.4253323
//                    }
//                }
//            },
//            "place_id" : "ChIJg82NZpuMtTURBhvfeQu2-48",
//            "types" : [ "locality", "political" ]
//        }
//                     ],
//        "status" : "OK"
//    }
    
    //初始化文件路径。
    NSString* path  = [[NSBundle mainBundle] pathForResource:@"n" ofType:@"txt"];
    //将文件内容读取到字符串中，注意编码NSUTF8StringEncoding 防止乱码，
    NSString* jsonString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    //将字符串写到缓冲区。
    NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    //解析json数据，使用系统方法 JSONObjectWithData:  options: error:
    NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
    
    
    //接下来一步一步解析。知道得到你想要的东西。
    
    /**
     *  1.先解析出来的字典，其中包含数组，无法根据key获取内容
        2.将得到的字典，再将其分离，取出字典（字典比较好解析啦，直接根据objctforkey进行操作就好）
        3.假如我们要取到key为“location”的值，则必须解析到location对应的那个字典
     */
    NSArray* arrayResult =[dic objectForKey:@"results"];
    NSDictionary* resultDic = [arrayResult objectAtIndex:0];
    NSDictionary* geometryDic = [resultDic objectForKey:@"geometry"];
//    NSLog(@"geometryDic: %@,  resultDic:%@",geometryDic,resultDic);
    NSLog(@"arrayresult%@",arrayResult);
    NSDictionary* locationDic = [geometryDic objectForKey:@"location"];
    NSNumber* lat = [locationDic objectForKey:@"lat"];
    NSNumber* lng = [locationDic objectForKey:@"lng"];
    
    NSLog(@"%@-lat = %@, lng = %@",geometryDic,lat,lng);
}

//Eg 3 :使用网络路径来解析json 。 使用NSURLRequest 和NSURLConnection 请求网络数据。

- (void)jsonParseTwo{
    
    //初始化网络路径。
    NSString* path  = @"http://maps.googleapis.com/maps/api/geocode/json?address=nanjing&sensor=true";
    //初始化 url
    NSURL* url = [NSURL URLWithString:path];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    //将请求到的字符串写到缓冲区。
    NSData* jsonData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //解析json数据，使用系统方法 JSONObjectWithData:  options: error:
    NSDictionary* dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableLeaves error:nil];
    
    //一下为自定义解析， 自己想怎么干就怎么干
    
    NSArray* arrayResult =[dic objectForKey:@"results"];
    NSDictionary* resultDic = [arrayResult objectAtIndex:0];
    NSDictionary* geometryDic = [resultDic objectForKey:@"geometry"];
//    NSLog(@"geometryDic: %@,  resultDic:%@",geometryDic,resultDic);
    NSDictionary* locationDic = [geometryDic objectForKey:@"location"];
    
    
    NSNumber* lat = [locationDic objectForKey:@"lat"];
    NSNumber* lng = [locationDic objectForKey:@"lng"];
    NSLog(@"lat = %@, lng = %@",lat,lng);
}

- (void)jsonParseThree {
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
//    [self jsonParseTwo];
    [self localText];
//    [self beijing];
}

- (void)beijing {
    NSString* path  = [[NSBundle mainBundle] pathForResource:@"A" ofType:@"txt"];
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
       //网络访问
//    NSURL *url = [NSURL URLWithString:@"http://www.weather.com.cn/adat/sk/101010100.html"];
    //定义一个NSError对象，用于捕获错误信息
//    NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
    NSError *error;
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    //本地访问

    NSString* jsonString = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];

    NSLog(@"jsonString--->%@",jsonString);
    //将解析得到的内容存放字典中，编码格式为UTF8，防止取值的时候发生乱码
    NSDictionary *rootDic = [[CJSONDeserializer deserializer] deserialize:[jsonString dataUsingEncoding:NSUTF8StringEncoding] error:&error];
    //因为返回的Json文件有两层，去第二层内容放到字典中去
    NSDictionary *weatherInfo = [rootDic objectForKey:@"weatherinfo"];
    NSLog(@"weatherInfo--->%@",weatherInfo);
    
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, 300 ,100)];
    _label.numberOfLines = 0;
    [self.view addSubview:_label];
    //取值打印
    _label.text = [NSString stringWithFormat:@"今天是 %@  %@  %@ ：%@  %@ ",[weatherInfo objectForKey:@"time"],[weatherInfo objectForKey:@"qy"],[weatherInfo objectForKey:@"cityid"], [weatherInfo objectForKey:@"njd"], [weatherInfo objectForKey:@"WS"]];
    
    NSString *urlPath = [NSString stringWithFormat:@"%@",[weatherInfo objectForKey:@"imgUrl"]];
    
//    1 NSURL转换成NSString
//    NSString * urlStr = [url absoluteString];
//    NSURL *path = [NSString stringWithFormat:@"%@",url];
//    2 NSString转换成NSURL
//    NSURL * url = [NSURL URLWithString:urlStr];
//    NSURL * url = [[NSURL alloc] initWithString:urlStr];
    NSURL *url = [NSURL URLWithString:urlPath];
    NSLog(@"urlPath%@",urlPath);
    
    //从解析好的地址加载图像
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 200, 200)];
    imgView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
    [self.view addSubview:imgView];

    
    NSLog(@"%@%@%@%@",[weatherInfo objectForKey:@"date_y"],[weatherInfo objectForKey:@"week"],[weatherInfo objectForKey:@"city"],[weatherInfo objectForKey:@"temp"]);
    

}

@end
