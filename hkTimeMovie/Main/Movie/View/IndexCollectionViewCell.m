//
//  IndexCollectionViewCell.m
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/9.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "IndexCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation IndexCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createImageView];
    }
    return self;
}

-(void)createImageView
{
    _image = [[UIImageView alloc]initWithFrame:self.bounds];
    _image.transform = CGAffineTransformMakeScale(0.9, 0.9);
    [self.contentView addSubview:_image];
}

-(void)setMovie:(Movie *)movie
{
    if (_movie != movie) {
        _movie = movie;
        NSString *img = [movie.images objectForKey:@"large"];
        [_image sd_setImageWithURL:[NSURL URLWithString:img]];
    }
}

@end
