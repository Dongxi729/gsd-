//
//  ViewController.m
//  Nsautolayout
//
//  Created by 郑东喜 on 16/3/3.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UIButton *btn;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn  setTitle:@"zdx" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor greenColor]];
    
    [self.view addSubview:btn];
    
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    
    //居中
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    //距离底部20单位
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:-20]];
    
    //高度是屏幕的0.3
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.3 constant:0]];
    
    //注册KVO方法
    [btn addObserver:self forKeyPath:@"bounds" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial context:nil];
}


//KVO回调
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (object == btn && [keyPath isEqualToString:@"bounds"]) {
        [btn setTitle:NSStringFromCGSize(btn.bounds.size) forState:UIControlStateNormal];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
