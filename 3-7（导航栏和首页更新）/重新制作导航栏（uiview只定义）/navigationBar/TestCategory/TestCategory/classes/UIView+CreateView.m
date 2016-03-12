//
//  UIView+CreateView.m
//  NavigationBar
//
//  Created by 郑东喜 on 16/2/23.
//  Copyright © 2016年 郑东喜. All rights reserved.
//

#import "UIView+CreateView.h"


@implementation UIView (CreateView)


+ (UIView*)setCityNameBtnTarget:(id)target setCItyNameBtnAction:(SEL)action setCityNameBtnTitle:(NSString *)addbtnTitle selectImg:(NSString*)seleceImage setCityNameLocationLabelText:(NSString *)addLabeltext setLocationImg:(NSString*)iconImage {
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 44)];

    UIButton *btn = [UIButton size:CGRectMake(0, 0, 80, 30) fontSize:17 btnTitle:addbtnTitle TextColor:[UIColor whiteColor]];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    UILabel* addLabel = [UILabel size:CGRectMake(32, 25, 60, 10) fontSize:10 LabelText:addLabeltext];
    UIImageView *iconImg = [UIImageView size:CGRectMake(20, 25, 10, 10) setImage:iconImage];
    
    UIImageView *selectImg = [UIImageView size:CGRectMake(85, 10, 10, 10) setImage:seleceImage];
    selectImg.contentMode = UIViewContentModeScaleAspectFill;
    
    [view addSubview:selectImg];
    [view addSubview:iconImg];
    [view addSubview:btn];
    [view addSubview:addLabel];
    
    return view;
}

+ (UILabel*)size:(CGRect)size fontSize:(CGFloat)fontSize LabelText:(NSString*)labelText {
    UILabel *label = [[UILabel alloc] initWithFrame:size];
    
    label.font = [UIFont systemFontOfSize:fontSize];
    label.layer.borderWidth = 0.5;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = labelText;
    
    return label;
}

+ (UIImageView*)size:(CGRect)size setImage:(NSString *)setImg{
    UIImageView *img = [[UIImageView alloc] initWithFrame:size];
    img.contentMode = UIViewContentModeScaleAspectFill;
        img.image = [UIImage imageNamed:setImg];
    return img;
}

+ (UIButton*)size:(CGRect)size fontSize:(CGFloat)fontSize btnTitle:(NSString*)btnText TextColor:(UIColor *)textColor{
    UIButton *btn = [[UIButton alloc] initWithFrame:size];
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    
    //按钮字体右对齐
    [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];


//    btn.layer.borderWidth = 0.5;
    [btn setTitle:btnText forState:UIControlStateNormal];
    
    [btn setTitleColor:textColor forState:UIControlStateNormal];
    return btn;
}

@end
