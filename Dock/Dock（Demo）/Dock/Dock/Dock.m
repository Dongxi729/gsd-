//
//  Dock.m
//  TabBarView
//
//  Created by 郑东喜 on 16/2/19.
//  Copyright © 2016年 郑东喜. All rights reserved.
//  主控制器选项卡

#import "Dock.h"
#import "DockBtn.h"

@interface Dock () {
    //当前选中啦哪个item
    DockBtn *_cuttrentItem;
}

@end

@implementation Dock

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //拿到image进行平铺
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tarbarbgcolor.png"]];

    }
    return self;
}

#pragma mark add item
- (void)addDockItemWithIcon:(NSString *)icon title:(NSString *)title textColor:(NSString*)txtColorWithImg{
    
    //1.创建item
    DockBtn* item = [DockBtn buttonWithType:UIButtonTypeCustom];
    
    [self addSubview:item];
    
    //2.设置标题
    [item setTitle:title forState:UIControlStateNormal];
    
    //3.设置图片
    [item setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [item setImage:[UIImage imageNamed:[icon stringByAppendingString:@"_selected"]] forState:UIControlStateSelected];
    
    [item setTitleColor:[UIColor colorWithPatternImage:[UIImage imageNamed:txtColorWithImg]] forState:UIControlStateNormal];
    [item setTitleColor:[UIColor colorWithPatternImage:[UIImage imageNamed:[txtColorWithImg stringByAppendingFormat:@"_selected"]]] forState:UIControlStateSelected];
    
    //item click
    [item addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchDown];
    
    //调整item的边框
    [self adjustDockItemFrame];
}
#pragma make点击啦某个item
-(void)itemClick:(DockBtn*)item {
    
    //当前的item取消选中
    _cuttrentItem.selected = NO;
    
    //让新的的item选中
    item.selected = YES;
    
    //让新的item变成当前选中
    _cuttrentItem = item;
    
    //call block
    if (_itemClickBlock) {
        _itemClickBlock((int)item.tag);
    }
}

#pragma mark 调整item的边框
- (void)adjustDockItemFrame {
    
    _kcount = self.subviews.count;
    
    CGFloat itemWeight = self.frame.size.width / _kcount;
    CGFloat itemHeight = self.frame.size.height;
    for (int i = 0; i < _kcount; i ++) {
        //1.取出子控件
        DockBtn *item = self.subviews[i];
        
        //2.算出边框
        item.frame = CGRectMake(i * itemWeight, 0, itemWeight, itemHeight);
        
        //3 默认第i个item选中
        if (i == 0 ) {
            item.selected = YES;
            _cuttrentItem = item;
        }
        
        //4 addItem tag
        item.tag = i;
    }
}

#pragma mark 重写设置索引的方法
- (void)setSelectedIndex:(int)selectedIndex {
    if (selectedIndex < 0 || selectedIndex >= self.subviews.count) return; {
        
        NSLog(@"selectedIndex%d",selectedIndex);
        
        //赋值给成员变量
        _selectedIndex = selectedIndex;
        
        //对应的item
        DockBtn* item = self.subviews[selectedIndex];
        
        NSLog(@"item:%@",self.subviews[selectedIndex]);
        //相当于点击啦这个item
        [self itemClick:item];
    }
}

@end
