//
//  RootViewController.m
//  TestCal
//
//  Created by 郑东喜 on 16/1/21.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "RootViewController.h"
#import "SecViewController.h"

@interface RootViewController ()
{
    UILabel *label;
}


@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    label=[[UILabel alloc]initWithFrame:CGRectMake(80, 100, 80, 80)];
    label.text=@"获取的值";
    label.layer.borderWidth=1;
    label.backgroundColor=[UIColor orangeColor];
    [self.view addSubview:label];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(80, 200, 80, 80);
    [button setTitle:@"获取值" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pushToAnother) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor orangeColor]];
    [self.view addSubview:button];
    
}

-(void)pushToAnother
{
    SecViewController *second=[[SecViewController alloc]init];
    second.block=^(NSString *showText){
        label.text=showText;
    };
    [self presentViewController:second animated:YES completion:^{
        NSLog(@"传送成功");
    }];
}


@end