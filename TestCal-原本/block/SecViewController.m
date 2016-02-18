//
//  SecViewController.m
//  TestCal
//
//  Created by 郑东喜 on 16/1/21.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "SecViewController.h"

#import "rootViewController.h"
@interface SecViewController ()

@property(nonatomic,retain)UITextField *Field;

@end

@implementation SecViewController

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
    
    _Field=[[UITextField alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    _Field.text=@"获得的值是";
    _Field.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:_Field];
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=CGRectMake(100, 220, 50, 50);
    [button setTitle:@"传送" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

-(void)returnMyBlock:(valueBlock)returnblock
{
    self.block = returnblock;
}

-(void)viewWillDisappear:(BOOL)animated
{
    self.block(self.Field.text);
}

-(void)back
{
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"返回成功");
    }];
}
@end