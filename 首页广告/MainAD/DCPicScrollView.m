//
//  DCPicScrollView.m
//  DCPicScrollView
//
//  Created by dengchen on 15/12/4.
//  Copyright © 2015年 name. All rights reserved.
//



#import "DCPicScrollView.h"
#import "DCWebImageManager.h"

@interface DCPicScrollView () <UIScrollViewDelegate>

@property (nonatomic,copy) NSArray *imageData;

@end

@implementation DCPicScrollView{
    
    __weak  UIImageView *_leftImageView,*_centerImageView,*_rightImageView;
    
    __weak  UIScrollView *_scrollView;

    __weak  UIPageControl *_PageControl;
    
    NSTimer *_timer;
    
    NSInteger _currentIndex;
    
    NSInteger _MaxImageCount;
    
    BOOL _isNetwork;
    
}




- (void)setMaxImageCount:(NSInteger)MaxImageCount {
    _MaxImageCount = MaxImageCount;
    
    [self prepareImageView];
    [self preparePageControl];
    
    [self setUpTimer];
    
    [self changeImageLeft:_MaxImageCount-1 center:0 right:1];
    
    //视图阴影效果设置
    [self shadowColor];
    
    
}


- (void)setLabel {
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(20, 20, self.frame.size.width, 40);
    label.layer.borderColor = [UIColor redColor].CGColor;
    label.layer.borderWidth = 2;
    [self addSubview:label];
}

//视图阴影效果设置
-(void)shadowColor {//加阴影
    self.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    self.layer.shadowOffset = CGSizeMake(4,4);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.layer.shadowOpacity = 0.9;//阴影透明度，默认0
    self.layer.shadowRadius = 4;//阴影半径，默认3
}

- (void)imageViewDidTap {
    if (self.imageViewDidTapAtIndex != nil) {
        self.imageViewDidTapAtIndex(_currentIndex);
    }
}

/**
 *  初始化滑动视图大小并根据网络路径下载图片
 *  @param  frame             滑动视图大小（cgrect：CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)）
 *  @param WithImageUrls      加载网络图片资源(网络加载urlsring必须为http:// 开头,根据数组中的元素（nsstring类型数据）,本地加载只需图片名字数组)
 */
+ (instancetype)picScrollViewWithFrame:(CGRect)frame WithImageUrls:(NSArray<NSString *> *)imageUrl {
    return  [[DCPicScrollView alloc] initWithFrame:frame WithImageNames:imageUrl];
}

- (instancetype)initWithFrame:(CGRect)frame WithImageNames:(NSArray<NSString *> *)ImageName {
    if (ImageName.count < 2) {
        return nil;
    }
    self = [super initWithFrame:frame];
    
    [self prepareScrollView];
    [self setImageData:ImageName];
    [self setMaxImageCount:_imageData.count];

    return self;
}



- (void)prepareScrollView {
    
    UIScrollView *sc = [[UIScrollView alloc] initWithFrame:self.bounds];
    [self addSubview:sc];
    
    _scrollView = sc;
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;

    _scrollView.contentSize = CGSizeMake(myWidth * pageNum,0);
    
    _AutoScrollDelay = 2.0f;
    _currentIndex = 0;
}

- (void)prepareImageView {
    
    UIImageView *left = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,myWidth, myHeight)];
    UIImageView *center = [[UIImageView alloc] initWithFrame:CGRectMake(myWidth, 0,myWidth, myHeight)];
    UIImageView *right = [[UIImageView alloc] initWithFrame:CGRectMake(myWidth * 2, 0,myWidth, myHeight)];
    
    center.userInteractionEnabled = YES;
    [center addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewDidTap)]];
 
    [_scrollView addSubview:left];
    [_scrollView addSubview:center];
    [_scrollView addSubview:right];
    

    _leftImageView = left;
    _centerImageView = center;
    _rightImageView = right;
}

//设置页脚
- (void)preparePageControl {
    
    UIPageControl *page = [[UIPageControl alloc] initWithFrame:CGRectMake(0,myHeight - pageSize,myWidth, 7)];
    
    page.pageIndicatorTintColor = [UIColor whiteColor];
    
//    显示当前PageControl的颜色
    
    page.currentPageIndicatorTintColor = currentTintColor;
    page.numberOfPages = _MaxImageCount;
    page.currentPage = 0;
    
    [self addSubview:page];
    
    
    _PageControl = page;
}

- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor {
    _PageControl.pageIndicatorTintColor = pageIndicatorTintColor;
}

- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor {
    _PageControl.currentPageIndicatorTintColor = currentPageIndicatorTintColor;
}


#pragma mark scrollViewDelegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self setUpTimer];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self removeTimer];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self changeImageWithOffset:scrollView.contentOffset.x];
}


- (void)changeImageWithOffset:(CGFloat)offsetX {
    
    if (offsetX >= myWidth * 2) {
        _currentIndex++;
        
        if (_currentIndex == _MaxImageCount-1) {
            
            [self changeImageLeft:_currentIndex-1 center:_currentIndex right:0];
            
        }else if (_currentIndex == _MaxImageCount) {
            
            _currentIndex = 0;
            [self changeImageLeft:_MaxImageCount-1 center:0 right:1];
            
        }else {
            [self changeImageLeft:_currentIndex-1 center:_currentIndex right:_currentIndex+1];
        }
        _PageControl.currentPage = _currentIndex;
        
    }
    
    if (offsetX <= 0) {
        _currentIndex--;
        
        if (_currentIndex == 0) {
            
            [self changeImageLeft:_MaxImageCount-1 center:0 right:1];
            
        }else if (_currentIndex == -1) {
            
            _currentIndex = _MaxImageCount-1;
            [self changeImageLeft:_currentIndex-1 center:_currentIndex right:0];
            
        }else {
            [self changeImageLeft:_currentIndex-1 center:_currentIndex right:_currentIndex+1];
        }
        
        _PageControl.currentPage = _currentIndex;
    }
    
}

- (void)changeImageLeft:(NSInteger)LeftIndex center:(NSInteger)centerIndex right:(NSInteger)rightIndex {
    
    if (_isNetwork) {
        
        _leftImageView.image = [self setImageWithIndex:LeftIndex];
        _centerImageView.image = [self setImageWithIndex:centerIndex];
        _rightImageView.image = [self setImageWithIndex:rightIndex];
        
    }else {
        
        _leftImageView.image = _imageData[LeftIndex];
        _centerImageView.image = _imageData[centerIndex];
        _rightImageView.image = _imageData[rightIndex];
        
    }
    
    [_scrollView setContentOffset:CGPointMake(myWidth, 0)];
}

-(void)setPlaceImage:(UIImage *)placeImage {
    _placeImage = placeImage;
    [self changeImageLeft:_MaxImageCount-1 center:0 right:1];
}

- (UIImage *)setImageWithIndex:(NSInteger)index {
    
    //从内存缓存中取,如果没有使用占位图片
    UIImage *image = [[[DCWebImageManager shareManager] webImageCache] valueForKey:_imageData[index]];
    
    return image ? image : _placeImage;
}


- (void)scorll {
    [_scrollView setContentOffset:CGPointMake(_scrollView.contentOffset.x + myWidth, 0) animated:YES];
}

- (void)setAutoScrollDelay:(NSTimeInterval)AutoScrollDelay {
    _AutoScrollDelay = AutoScrollDelay;
    [self removeTimer];
    [self setUpTimer];
}

- (void)setUpTimer {
    if (_AutoScrollDelay < 0.5) return;

    _timer = [NSTimer timerWithTimeInterval:_AutoScrollDelay target:self selector:@selector(scorll) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)removeTimer {
    if (_timer == nil) return;
    [_timer invalidate];
    _timer = nil;
}

- (void)setImageData:(NSArray *)ImageNames {
    
    _isNetwork = [ImageNames.firstObject hasPrefix:@"http://"];
    
    if (_isNetwork) {
        
        _imageData = [ImageNames copy];
        
        [self getImage];
        
    }else {
        
        NSMutableArray *temp = [NSMutableArray arrayWithCapacity:ImageNames.count];
        
        for (NSString *name in ImageNames) {
            [temp addObject:[UIImage imageNamed:name]];
        }
        
        _imageData = [temp copy];
    }
    
}


- (void)getImage {
    
    for (NSString *urlSting in _imageData) {
        [[DCWebImageManager shareManager] downloadImageWithUrlString:urlSting];
    }
    
}

-(void)dealloc {
    [self removeTimer];
}

//
//- (void)getImage {
//   
//    SDWebImageManager *manager = [SDWebImageManager sharedManager];
//    
//    for (NSString *urlString in _imageData) {
//        
//        [manager downloadImageWithURL:[NSURL URLWithString:urlString] options:SDWebImageHighPriority progress:NULL completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//            if (error) {
//                NSLog(@"%@",error);
//            }
//        }];
//    }
//    
//}
//- (UIImage *)setImageWithIndex:(NSInteger)index {
//    
//  UIImage *image =
//    [[[SDWebImageManager sharedManager] imageCache] imageFromMemoryCacheForKey:_imageData[index]];
//    if (image) {
//        return image;
//    }else {
//        return _placeImage;
//    }
//    
//}

@end

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com