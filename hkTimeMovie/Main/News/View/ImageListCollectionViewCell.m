//
//  ImageListCollectionViewCell.m
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/5.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "ImageListCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@implementation ImageListCollectionViewCell

-(void)layoutSubviews
{
    [super layoutSubviews];

}

-(void)setImagelist:(ImageList *)imagelist
{
    if (_imagelist != imagelist) {
        _imagelist = imagelist;
        [_imgView sd_setImageWithURL:[NSURL URLWithString:_imagelist.image]];
    }

}
@end
