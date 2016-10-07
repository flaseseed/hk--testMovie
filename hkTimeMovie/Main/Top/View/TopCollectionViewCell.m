//
//  TopCollectionViewCell.m
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/3.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "TopCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "StarView.h"
@implementation TopCollectionViewCell

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _titleLabel.text = _top.title;
    _ratingLable.text = [NSString stringWithFormat:@"%.1f",[_top.average floatValue]];
    [_imgView sd_setImageWithURL:[NSURL URLWithString:_top.images]];
    _starview.rating = [_top.average floatValue];
}

@end
