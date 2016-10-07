//
//  CinemaTableViewCell.m
//  hkTimeMovie
//
//  Created by 看着太阳吃烧饼 on 15/11/10.
//  Copyright © 2015年 gogogo All rights reserved.
//

#import "CinemaTableViewCell.h"

@implementation CinemaTableViewCell


-(void)setCinema:(Cinema *)cinema
{
    if (_cinema != cinema) {
        _cinema = cinema;
        [self setNeedsLayout];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    _CinemaNameLabel.text = _cinema.name;
    _addressLabel.text = _cinema.address;
    _gradeLabel.text = _cinema.grade;
    _lowPriceLabel.text = [NSString stringWithFormat:@"￥%@",_cinema.lowPrice];
    NSRange range = [_cinema.coord rangeOfString:@","];
    float distance1 = [[_cinema.coord substringToIndex:range.location] floatValue];
    float distance2 = [[_cinema.coord substringFromIndex:range.location] floatValue];
    float distance = sqrtf(distance1 * distance1 + distance2 * distance2);
    _distanceLabel.text = [NSString stringWithFormat:@"%.1fkm",distance];
    
    if (![_cinema.isSeatSupport integerValue]) {
        _isSeatLabel.hidden = YES;
    }
    if (![_cinema.isCouponSupport integerValue]) {
        _isCouponLabel.hidden = YES;
    }
}



@end
