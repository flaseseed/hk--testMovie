//
//  PosterView.m
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/7.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "PosterView.h"
#import "PosterCollectionView.h"
#import "IndexCollectionView.h"
#import "Movie.h"
@implementation PosterView
{
    UIView *_headerView;
    UIButton *_button;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createCollectionView];
        [self createHeaderView];
        [self createIndexCollectionView];
        [self createFooterView];
        [_collectionView addObserver:self forKeyPath:@"current" options:NSKeyValueObservingOptionNew context:nil];
        [_indexCollection addObserver:self forKeyPath:@"current" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    int item = [change[@"new"] intValue];
    NSIndexPath *index = [NSIndexPath indexPathForItem:item inSection:0];
    if (object == _collectionView && _indexCollection.current != item) {
        _indexCollection.current = item;
        [_indexCollection scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
    else if(object == _indexCollection && _collectionView.current != item)
    {
        _collectionView.current = item;
        [_collectionView scrollToItemAtIndexPath:index atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
    Movie *movie = _dataArray[item];
    _footerLable.text = movie.title;
}

-(void)setDataArray:(NSArray *)dataArray
{
    if (_dataArray != dataArray) {
        _dataArray = dataArray;
        _collectionView.dataArray = dataArray;
        _indexCollection.dataArray = dataArray;
        if (_dataArray.count > 0) {
            Movie *movie = _dataArray[0];
            _footerLable.text = movie.title;
        }
    }
}

-(void)createIndexCollectionView
{
    _indexCollection = [[IndexCollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
    _indexCollection.pageWidth = 75;
    _indexCollection.backgroundColor = [UIColor clearColor];
    
    [_headerView addSubview:_indexCollection];
}
-(void)createCollectionView
{
    _collectionView = [[PosterCollectionView alloc]initWithFrame:CGRectMake(0, 25, kScreenWidth, kScreenHeight - 64 - 49 - 40)];
    _collectionView.pageWidth = 250;
    _collectionView.backgroundColor = [UIColor clearColor];

    [self addSubview:_collectionView];
}

-(void)createHeaderView
{
    
    _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, -105, kScreenWidth, 130)];
    _headerView.backgroundColor = [UIColor clearColor];
    [self addSubview:_headerView];
    
    UIImage *image = [UIImage imageNamed:@"indexBG_home"];
    image = [image stretchableImageWithLeftCapWidth:0 topCapHeight:2];
    
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 130)];
    imgView.image = image;
    [_headerView addSubview:imgView];
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button setImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [_button setImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    _button.frame = CGRectMake((kScreenWidth - 15) / 2, CGRectGetMaxY(imgView.frame) - 20, 20, 15);
    [_button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_headerView addSubview:_button];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipe:)];
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:swipe];
}

-(void)createFooterView
{
    _footerLable = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_collectionView.frame) - 10, kScreenWidth, 24)];
    _footerLable.backgroundColor = [UIColor blackColor];
    _footerLable.alpha = 0.3;
    _footerLable.textAlignment = NSTextAlignmentCenter;
    _footerLable.textColor = [UIColor whiteColor];
    [self addSubview:_footerLable];
}

-(UIControl *)mask
{
    _mask = [[UIControl alloc]initWithFrame:self.bounds];
    _mask.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    [_mask addTarget:self action:@selector(maskClick:) forControlEvents:UIControlEventTouchUpInside];
    return _mask;
}

-(void)maskClick:(UIControl *)control
{
    [self hide];
}

-(void)swipe:(UISwipeGestureRecognizer *)swipe
{
    [self show];
}

-(void)show
{
    [UIView animateWithDuration:0.4 animations:^{
        _headerView.transform = CGAffineTransformMakeTranslation(0, 105);
    }];
    _button.selected = YES;
    [self insertSubview:self.mask belowSubview:_headerView];
}

-(void)hide
{
    [UIView animateWithDuration:0.4 animations:^{
        _headerView.transform = CGAffineTransformIdentity;
    }];
    _button.selected = NO;
    _mask.hidden = YES;
}

-(void)buttonAction:(UIButton *)button
{
    if (!button.selected) {
        [self show];
    }
    else
    {
        [self hide];
    }
}
@end
