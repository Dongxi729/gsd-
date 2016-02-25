//
//  SearchBar.h
//  NavigationBar
//
//  Created by 郑东喜 on 16/2/24.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchBar : UISearchBar<UISearchResultsUpdating,UISearchBarDelegate,UISearchDisplayDelegate,UITextFieldDelegate> {
//    UIButton *_actionBtn;
}

@property (nonatomic,strong ) UIButton* cancelBtn;
- (void)btnAction:(SEL)action;

@end
