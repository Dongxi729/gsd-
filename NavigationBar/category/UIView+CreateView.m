//
//  UIView+CreateView.m
//  NavigationBar
//
//  Created by 郑东喜 on 16/2/23.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "UIView+CreateView.h"
#import "SearchBar.h"


@implementation UIView (CreateView)


+ (UIView*)size:(CGRect)size addTarget:(id)target setViewAction:(SEL)action addBtnTitle:(NSString *)addbtnTitle addLabelText:(NSString *)addLabeltext iconImg:(UIImage*)iconImage btnFontSize:(CGFloat)btnfontSize labelFontSize:(CGFloat)labelfontSize selectImg:(UIImage*)seleceImage {
    
    UIView *view = [[UIView alloc] initWithFrame:size];
    UIButton *btn = [UIButton size:CGRectMake(0, 0, 100, 30) fontSize:btnfontSize btnTitle:addbtnTitle TextColor:[UIColor whiteColor]];
//    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    
    UILabel* addLabel = [UILabel size:CGRectMake(45, 25, 80, 10) fontSize:labelfontSize LabelText:addLabeltext];
    UIImageView *iconImg = [UIImageView size:CGRectMake(30, 25, 10, 10) setImage:iconImage];
    
    UIImageView *selectImg = [UIImageView size:CGRectMake(100, 10, 10, 10) setImage:seleceImage];
    selectImg.contentMode = UIViewContentModeScaleAspectFill;
    
    [view addSubview:selectImg];
    [view addSubview:iconImg];
    [view addSubview:btn];
    [view addSubview:addLabel];
    
    return view;
}

+ (UIView*)setSearchBarSize:(CGRect)size placeHolderText:(NSString*)placeHolderText btnAction:(SEL)action {
    UIView *view = [[UIView alloc] initWithFrame:size];
    
    SearchBar *search = [[SearchBar alloc] initWithFrame:size];
    search.placeholder = placeHolderText;
    
    [search btnAction:action];
    
    search.backgroundColor = [UIColor clearColor];
    //    search.backgroundImage = [UIImage imageNamed:@"test"];
    //自定背景图片
    
    [view addSubview:search];
    
    return view;

}

//+ (UIView *)size:(CGRect)size 

+ (UILabel*)size:(CGRect)size fontSize:(CGFloat)fontSize LabelText:(NSString*)labelText {
    UILabel *label = [[UILabel alloc] initWithFrame:size];
    
    label.font = [UIFont systemFontOfSize:fontSize];
    label.text = labelText;
    
    return label;
}

+ (UIImageView*)size:(CGRect)size setImage:(UIImage *)setImg{
    UIImageView *img = [[UIImageView alloc] initWithFrame:size];
    img.contentMode = UIViewContentModeScaleAspectFill;
    
    img.image = setImg;
    return img;
}

+ (UIButton*)size:(CGRect)size fontSize:(CGFloat)fontSize btnTitle:(NSString*)btnText TextColor:(UIColor *)textColor{
    UIButton *btn = [[UIButton alloc] initWithFrame:size];
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [btn setTitle:btnText forState:UIControlStateNormal];
    
    [btn setTitleColor:textColor forState:UIControlStateNormal];
    return btn;
}

@end
