//
//  ViewController.h
//  代码创建UICollectionView
//
//  Created by 陈家庆 on 15-2-6.
//  Copyright (c) 2015年 shikee_Chan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>{
    
}
@property (nonatomic,strong)UICollectionView *collectionView;


@end
