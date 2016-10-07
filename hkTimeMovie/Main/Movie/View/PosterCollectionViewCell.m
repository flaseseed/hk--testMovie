//
//  PosterCollectionViewCell.m
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/7.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "PosterCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "MovieDetailView.h"
@implementation PosterCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createImageView];
        [self createDetailView];
        _flag = YES;
    }
    return self;
}

-(void)createImageView
{
    _image = [[UIImageView alloc]initWithFrame:self.bounds];
    _image.transform = CGAffineTransformMakeScale(0.95, 0.95);
    [self.contentView addSubview:_image];
}

-(void)createDetailView
{
    _detailView = [[[NSBundle mainBundle]loadNibNamed:@"PosterDetail" owner:self options:nil]lastObject];
    _detailView.transform = CGAffineTransformMakeScale(0.95, 0.95);
    _detailView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    _detailView.hidden = YES;
    [self.contentView insertSubview:_detailView atIndex:0];
}

-(void)setMovie:(Movie *)movie
{
    if (_movie != movie) {
        _movie = movie;
        NSString *img = [movie.images objectForKey:@"large"];
        [_image sd_setImageWithURL:[NSURL URLWithString:img]];
        
        _detailView.movie = self.movie;
    }
}

-(void)flip
{
    NSInteger index1 = [self.contentView.subviews indexOfObject:_image];
    NSInteger index2 = [self.contentView.subviews indexOfObject:_detailView];
    
    UIViewAnimationOptions flip = _flag ? UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight;
    
    [UIView transitionWithView:self.contentView duration:0.4 options:flip animations:^{
        [self.contentView exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2
         ];} completion:nil];
    
    _image.hidden = !_image.hidden;
    _detailView.hidden = !_detailView.hidden;
    _flag = !_flag;
}
@end
