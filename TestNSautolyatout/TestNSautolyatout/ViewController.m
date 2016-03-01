//
//  ViewController.m
//  TestNSautolyatout
//
//  Created by 郑东喜 on 16/3/1.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView* v = [[UIView alloc] init];
    [v setBackgroundColor:[UIColor brownColor]];
    v.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.view addSubview:v];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:0.5 constant:20]];
    
    [self.view addConstraint:
     [NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:0.5 constant:-20]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:0.5 constant:10]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:v attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:0.5 constant:-10]];
    
    
    UIView *r = [UIView new];
    [r setBackgroundColor:[UIColor blueColor]];
    r.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:r];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:r attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:v attribute:NSLayoutAttributeLeft multiplier:0.5 constant:150]];
    
      [self.view addConstraint:[NSLayoutConstraint constraintWithItem:r attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:0.5 constant:10]];
      [self.view addConstraint:[NSLayoutConstraint constraintWithItem:r attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:v attribute:NSLayoutAttributeTop multiplier:0.5 constant:10]];
      [self.view addConstraint:[NSLayoutConstraint constraintWithItem:r attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:0.5 constant:10]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
