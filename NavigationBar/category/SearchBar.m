//
//  SearchBar.m
//  NavigationBar
//
//  Created by 郑东喜 on 16/2/24.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "SearchBar.h"

#import "DataModel.h"

#import "BTViewController.h"

#define IOSVersion                          [[[UIDevice currentDevice] systemVersion] floatValue]
#define IsIOS7Later                         !(IOSVersion < 7.0)
#define IsIOS8Later                         !(IOSVersion < 8.0)

@implementation SearchBar

//- (id)initWithFrame:(CGRect)frame {
//    self = [super initWithFrame:frame];
//    if (self) {
//    }
//
//    return self;
//}

- (void)drawRect:(CGRect)rect {
    //移除背景
    [self removeSearchBarBackground];
    self.delegate = self;
//    self.showsCancelButton = YES;
    self.text = @"ddd";
    NSArray *subViews;
    

//取出取消按钮
    if (is_IOS_7) {
        subViews = [(self.subviews[0]) subviews];
    }
    else {
        subViews = self.subviews;
    }
    
    for (id view in subViews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton* cancelbutton = (UIButton* )view;
            [cancelbutton setTitle:@"搜索" forState:UIControlStateNormal];
            
//             [cancelbutton addTarget:self action:@selector(touch) forControlEvents:UIControlEventTouchUpInside];
            
            _cancelBtn = cancelbutton;
            break;
            
        }
    }

}


#pragma mark searchBar delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    // Do the search...
    
    NSLog(@"yeah");
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    [self.superview addSubview:view];
    
    [self.superview.superview addSubview:view];
    
    NSLog(@"viewSuoer:%@",self.superview.superview);

}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}

- (void)btnAction:(SEL)action {
    [_cancelBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
}


- (void)removeSearchBarBackground
{
    for (UIView *subView in self.subviews) {
        if (IsIOS7Later) {
            for (UIView *subSubView in subView.subviews) {
                if ([subSubView isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
                    [subSubView removeFromSuperview];
                }
            }
        } else if ([subView isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) { // iOS6以下版本searchBar内部子视图的结构不一样
            [subView removeFromSuperview];
        }
    }
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSLog(@"dd");

}

@end
