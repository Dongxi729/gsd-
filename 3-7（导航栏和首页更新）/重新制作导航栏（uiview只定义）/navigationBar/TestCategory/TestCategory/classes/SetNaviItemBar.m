//
//  SetNaviItemBar.m
//  TestCategory
//
//  Created by 郑东喜 on 16/2/29.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "SetNaviItemBar.h"
#import "SearchBar.h"

@implementation SetNaviItemBar

+(instancetype)initWithFrame:(CGRect)frame bgColor:(UIColor *)color {
    return [[SetNaviItemBar alloc] initWithFrame:frame bgColor:color];
}

-(instancetype)initWithFrame:(CGRect)frame bgColor:(UIColor *)color {
    self = [super initWithFrame:frame];
    self.backgroundColor = color;

    return self;
}

#pragma mark - 设置导航栏的属性
- (void)setNavItemWithImg:(NSString *)image addTarget:(id)target btnAction:(SEL)action itemType:(ItemType)type {
    
    UIView *item = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 75)];
    
    if (type == left) {
        _leftNavButton = [[DockMiddleIcon alloc] initWithFrame:CGRectMake(12, 30, 30, 30)];
        
        _leftNavButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [_leftNavButton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        
        [_leftNavButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_leftNavButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        
        
    } else if (type == right) {
        _rightNavButton = [[DockMiddleIcon alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 45, 30, 30, 30)];
        _rightNavButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [_rightNavButton setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        
        [_rightNavButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_rightNavButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self addSubview:item];
    [item addSubview:_rightNavButton];
    [item addSubview:_leftNavButton];
}

#pragma mark - 设置导航栏标题
- (void)setNavigationTitile:(NSString *)title {
    
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width * 0.5 - 50, self.frame.size.height * 0.5 -6, 100, 30)];
        titleLabel.text = title;
        
        [titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:20]];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleLabel];
}

#pragma mark - 设置首页导航栏样式
- (void)setCityNameBtnTarget:(id)target setCItyNameBtnAction:(SEL)action setCityNameBtnTitle:(NSString *)addbtnTitle selectImg:(NSString*)seleceImage setCityNameLocationLabelText:(NSString *)addLabeltext setLocationImg:(NSString*)iconImage {
    
    _naviLocationView = [[UIView alloc] initWithFrame:CGRectMake(self.frame.size.width * 0.5 - 60, self.frame.size.height * 0.5 -16, 120, 44)];

    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:addLabeltext forState:UIControlStateNormal];
    btn.titleLabel.textAlignment = NSTextAlignmentRight;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *addLabel = [[UILabel alloc] initWithFrame:CGRectMake(32, 25, 60, 10)];
    addLabel.font= [UIFont systemFontOfSize:10];
    addLabel.textAlignment = NSTextAlignmentCenter;
    addLabel.text = addLabeltext;
    
    UIImageView *selectImg = [[UIImageView alloc] initWithFrame:CGRectMake(85, 10, 10, 10)];
    selectImg.image = [UIImage imageNamed:seleceImage];
    selectImg.contentMode= UIViewContentModeScaleAspectFit;
    
    UIImageView *iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(20, 25, 10, 10)];
    iconImg.image = [UIImage imageNamed:iconImage];
    iconImg.contentMode = UIViewContentModeScaleAspectFit;
    [_naviLocationView addSubview:selectImg];
    [_naviLocationView addSubview:iconImg];
    [_naviLocationView addSubview:btn];
    [_naviLocationView addSubview:addLabel];
    
    [self addSubview:_naviLocationView];
}

#pragma mark - 设置导航栏带有tarbar样式
- (void)setSearchBarWithTitle:(NSString *)placeHolderText {
    
    CGFloat X = self.frame.size.width * 0.5;
    CGFloat Y = self.frame.size.height * 0.5 -16;
    CGFloat W = self.frame.size.width * 0.5 - 22;
    CGFloat H = 44;
    _searchView.layer.borderWidth = 0.5;
    
    SearchBar *search = [[SearchBar alloc] initWithFrame:CGRectMake(X - (0.5* W), Y, W, H)];
    
    search.placeholder = placeHolderText;
    
    
    [self addSubview:search];

}

@end
