//
//  SearchBar.m
//  NavigationBar
//
//  Created by 郑东喜 on 16/2/24.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "SearchBar.h"


#define is_IOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

#define IOSVersion                          [[[UIDevice currentDevice] systemVersion] floatValue]
#define IsIOS7Later                         !(IOSVersion < 7.0)
#define IsIOS8Later                         !(IOSVersion < 8.0)

@implementation SearchBar

- (void)drawRect:(CGRect)rect {
    //移除背景
    [self removeSearchBarBackground];
    self.delegate = self;
    self.userInteractionEnabled =YES;
    [self makeButton];
}

#pragma mark - add button on keyboardAccessoryView
- (void)makeButton {
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
    self.inputAccessoryView = toolBar;
    
    UIBarButtonItem *doneBtn=[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(doneBtn)];

    UIBarButtonItem *spaceBtn=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    toolBar.items=@[spaceBtn,doneBtn];

}

- (void)doneBtn {
    [self endEditing:YES];
}
#pragma mark searchBar delegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];

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

-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    [UIView animateWithDuration:0.5 animations:^{
        //将原生取消按钮文字改为“取消”
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
                [cancelbutton setTitle:@"取消" forState:UIControlStateNormal];
                
                _cancelBtn = cancelbutton;
                break;
                
            }
        }
    }];
    
    return YES;
}


-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    
    [UIView animateWithDuration:0.5 animations:^{
    }];

    return YES;
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
