//
//  MovieTableViewCell.m
//  hkTimeMovie
//
//  Created by hk-seed on 15/11/2.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "MovieTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "StarView.h"
@implementation MovieTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    _titleLable.text = self.movie.title;
    _yearLable.text = [NSString stringWithFormat:@"年份：%@",self.movie.year];
    _ratingLable.text = [NSString stringWithFormat:@"%.1f",[self.movie.average floatValue]];
    
    NSString *mid = [self.movie.images objectForKey:@"medium"];
    NSURL *url = [NSURL URLWithString:mid];
    [_image sd_setImageWithURL:url];
    _starview.rating = [self.movie.average floatValue];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
