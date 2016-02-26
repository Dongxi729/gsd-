//
//  TestBtn.m
//  TabBarView
//
//  Created by 郑东喜 on 16/2/25.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "TestBtn.h"
#import "DockMiddleIcon.h"

@implementation TestBtn

- (void)viewDidLoad {
    DockMiddleIcon *btn = [[DockMiddleIcon alloc] initWithFrame:self.view.bounds];
    [btn setImage:[UIImage imageNamed:@"creater"] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    QLOG(@"btn:%@",btn);
}

@end
