//
//  SeachView.m
//  NavigationBar
//
//  Created by 郑东喜 on 16/2/24.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "SeachView.h"
#import "SearchBar.h"
@implementation SeachView

- (void)viewDidLoad {
    
    [self.view setBackgroundColor:[UIColor redColor]];

    SearchBar *search = [[SearchBar alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width * 0.5, 44)];
    search.placeholder = [NSString stringWithCString:"输入城市名字"  encoding: NSUTF8StringEncoding];
    search.backgroundColor = [UIColor clearColor];
    search.showsCancelButton = YES;
    
    
    
//    search.backgroundImage = [UIImage imageNamed:@"test"];
    //自定背景图片
    
      UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 44)];
    [self.view addSubview:search];
    
    self.navigationItem.titleView = view;
    
//    [self.view endEditing:YES];
//    [self setSearch];
}

- (void)searchDisplayControllerDidBeginSearch:(UISearchDisplayController *)controller {
    NSLog(@"dd");

}


- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"dj");

}

-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    //準備搜尋前，把上面調整的TableView調整回全屏幕的狀態
    [UIView animateWithDuration:1.0 animations:^{
//        self.view.frame = CGRectMake(0, 20, 320, [[UIScreen mainScreen].bounds.size.width]-20);
        self.view.frame = (CGRect){0,0,100,100};
        
        [self.view setBackgroundColor:[UIColor grayColor]];
    }];
    
    return YES;
}

@end
