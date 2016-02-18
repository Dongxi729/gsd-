//
//  SecViewController.h
//  TestCal
//
//  Created by 郑东喜 on 16/1/21.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecViewController : UIViewController

typedef void (^valueBlock)(NSString *returnVlue);
@property(nonatomic,copy)valueBlock block;

-(void)returnMyBlock:(valueBlock)block;


@end
