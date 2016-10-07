//
//  MovieDetailView.m
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/9.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "MovieDetailView.h"
#import "UIImageView+WebCache.h"
@implementation MovieDetailView

-(void)setMovie:(Movie *)movie
{
    if (_movie != movie) {
        _movie = movie;
        [self setNeedsLayout];
    }
}

-(void)layoutSubviews
{
    NSString *image = self.movie.images[@"large"];
    [_ImageView sd_setImageWithURL:[NSURL URLWithString:image]];
    
    _titleCnLbel.text = self.movie.title;
    _titleEnLabel.text = self.movie.original_title;
    _yearLabel.text = self.movie.year;
    _ratingLabel.text = [NSString stringWithFormat:@"%.1f",[self.movie.average floatValue]];
    _starView.rating = [self.movie.average floatValue];
}
@end
